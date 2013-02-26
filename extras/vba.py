#!/usr/bin/jython
# -*- encoding: utf-8 -*-
"""
vba-clojure (but really it's jython/python/jvm)

This is jython, not python. Use jython to run this file. Before running this
file, some of the dependencies need to be constructed. These can be obtained
from the vba-clojure project.
    hg clone http://hg.bortreb.com/vba-clojure
    cd vba-clojure/java/
    ant all
    cd ..
    autoreconf -i
    ./configure
    make
    sudo make install

Make sure vba-clojure bindings are in $CLASSPATH:
    export CLASSPATH=$CLASSPATH:java/dist/gb-bindings.jar

Make sure vba-clojure is available within "java.library.path":
    sudo ln -s \
      $HOME/local/vba-clojure/vba-clojure/src/clojure/.libs/libvba.so.0.0.0 \
      /usr/lib/jni/libvba.so

Also make sure VisualBoyAdvance.cfg is somewhere in the $PATH for VBA to find.
A default configuration is provided in vba-clojure under src/.

Usage (in jython, not python):
    import vba

    # activate the laser beam
    vba.load_rom("/path/to/baserom.gbc")

    # make the emulator eat some instructions
    vba.nstep(300)

    # save the state because we're paranoid
    copyrights = vba.get_state()
    # or ...
    vba.save_state("copyrights")
    # >>> vba.load_state("copyrights") == copyrights
    # True

    # play for a while, then press F12
    vba.run()

    # let's save the game again
    vba.save_state("unknown-delete-me")

    # and let's go back to the other state
    vba.set_state(copyrights)

    # or why not the other way around?
    vba.set_state(vba.load_state("unknown-delete-me"))

    registers = vba.get_registers()

TOOD:
    [ ] set a specific register
    [ ] get a specific register
    [ ] write value at address
    [ ] breakpoints
    [ ] vgm stuff
    [ ] gbz80disasm integration
    [ ] pokecrystal.extras integration

"""

import os
import sys
from array import array

# for _check_java_library_path
from java.lang import System

# for passing states to the emulator
from java.nio import ByteBuffer

# For getRegisters and other times we have to pass a java int array to a
# function.
import jarray

# load in the vba-clojure bindings
import com.aurellem.gb.Gb as Gb

# load the vba-clojure library
Gb.loadVBA()

# by default we assume the user has things in their $HOME
home = os.path.expanduser("~") # or System.getProperty("user.home")

# and that the pokecrystal project folder is in there somewhere
project_path = os.path.join(home, os.path.join("code", "pokecrystal"))

# save states are in ~/code/pokecrystal/save-states/
save_state_path = os.path.join(project_path, "save-states")

# where is your rom?
rom_path = os.path.join(project_path, "baserom.gbc")

def _check_java_library_path():
    """
    Returns the value of java.library.path. The vba-clojure library must be
    compiled and linked from this location.
    """
    return System.getProperty("java.library.path")

class RomList(list):
    """
    Simple wrapper to prevent a giant rom from being shown on screen.
    """
    def __init__(self, *args, **kwargs):
        list.__init__(self, *args, **kwargs)

    def __repr__(self):
        """
        Simplifies this object so that the output doesn't overflow stdout.
        """
        return "RomList(too long)"

button_masks = {
    "a": 0x0001,
    "b": 0x0002,
    "r": 0x0010,
    "l": 0x0020,
    "u": 0x0040,
    "d": 0x0080,
    "select":   0x0004,
    "start":    0x0008,
    "restart":  0x0800,
    "listen":       -1, # what?
}

# useful for directly stating what to press
a, b, r, l, u, d, select, start, restart = "a", "b", "r", "l", "u", "d", "select", "start", "restart"

def button_combiner(buttons):
    """
    Combines multiple button presses into an integer. This is used when sending
    a keypress to the emulator.
    """
    result = 0

    # String inputs need to be cleaned up so that "start" doesn't get
    # recognized as "s" and "t" etc..
    if isinstance(buttons, str):
        if "restart" in buttons:
            buttons.replace("restart", "")
            result |= button_masks["restart"]
        if "start" in buttons:
            buttons.replace("start", "")
            result |= button_masks["start"]
        if "select" in buttons:
            buttons.replace("select", "")
            result |= button_masks["select"]

    for each in buttons:
        result |= button_masks[each]
    
    print "button: " + str(result)
    return result

def load_rom(path=None):
    """
    Starts the emulator with a certain ROM. Defaults to rom_path if no
    parameters are given.
    """
    if path == None:
        path = rom_path
    try:
        root = load_state("root")
    except:
        # "root.sav" is required because if you create it in the future, you
        # will have to shutdown the emulator and possibly lose your state. Some
        # functions require there to be at least one root state available to do
        # computations between two states.
        sys.stderr.write("ERROR: unable to read \"root.sav\", please run"
        " generate_root() or get_root() to make an initial save.\n")
    Gb.startEmulator(path)

def shutdown():
    """
    Stops the emulator. Closes the window. The "opposite" of this is the
    load_rom function.
    """
    Gb.shutdown()

def step():
    """
    Advances the emulator forward by one step.
    """
    Gb.step()

def nstep(steplimit):
    """
    Step the game forward by a certain number of instructions.
    """
    for counter in range(0, steplimit):
        Gb.step()

def step_until_capture():
    """
    Loop step() until SDLK_F12 is detected.
    """
    Gb.stepUntilCapture()

# just some aliases for step_until_capture
run = go = step_until_capture

def _create_byte_buffer(data):
    """
    Converts data into a ByteBuffer. This is useful for interfacing with the Gb
    class.
    """
    buf = ByteBuffer.allocateDirect(len(data))
    if isinstance(data[0], int):
        for byte in data:
            buf.put(byte)
    else:
        for byte in data:
            buf.put(ord(byte))
    return buf

def set_state(state, do_step=False):
    """
    Injects the given state into the emulator. Use do_step if you want to call
    step(), which also allows SDL to render the latest frame. Note that the
    default is to not step, and that the screen (if it is enabled) will appear
    as if it still has the last state loaded. This is normal.
    """
    Gb.loadState(_create_byte_buffer(state))
    if do_step:
        step()

def get_state():
    """
    Retrieves the current state of the emulator.
    """
    buf = Gb.saveState()
    state = [buf.get(x) for x in range(0, buf.capacity())]
    arr = array("b")
    arr.extend(state)
    return arr.tostring() # instead of state

def save_state(name, state=None, override=False):
    """
    Saves the given state to save_state_path. The file format must be ".sav"
    (and this will be appended to your string if necessary).
    """
    if state == None:
        state = get_state()
    if len(name) < 4 or name[-4:] != ".sav":
        name += ".sav"
    save_path = os.path.join(save_state_path, name)
    if not override and os.path.exists(save_path):
        raise Exception("oops, save state path already exists: " + str(save_path))
    else:
        # convert the state into a reasonable output
        data = array('b')
        data.extend(state)
        output = data.tostring()

        file_handler = open(save_path, "wb")
        file_handler.write(output)
        file_handler.close()

def load_state(name):
    """
    Reads a state from file based on name. Looks in save_state_path for a file
    with this name (".sav" is optional).
    """
    save_path = os.path.join(save_state_path, name)
    if not os.path.exists(save_path):
        if len(name) < 4 or name[-4:] != ".sav":
            name += ".sav"
            save_path = os.path.join(save_state_path, name)
    file_handler = open(save_path, "rb")
    state = file_handler.read()
    file_handler.close()
    return state

def generate_root():
    """
    Restarts the emulator and saves the initial state to "root.sav".
    """
    shutdown()
    load_rom()
    root = get_state()
    save_state("root", state=root, override=True)
    return root

def get_root():
    """
    Loads the root state, or restarts the emulator and creates a new root
    state.
    """
    try:
        root = load_state("root")
    except:
        root = generate_root()

def get_registers():
    """
    Returns a list of current register values.
    """
    register_array = jarray.zeros(Gb.NUM_REGISTERS, "i")
    Gb.getRegisters(register_array)
    return list(register_array)

def get_rom():
    """
    Returns the ROM in bytes.. in a string.
    """
    rom_array = jarray.zeros(Gb.ROM_SIZE, "i")
    Gb.getROM(rom_array)
    return RomList(rom_array)

def get_ram():
    """
    Returns the RAM in bytes in a string.
    """
    ram_array = jarray.zeros(Gb.RAM_SIZE, "i")
    Gb.getRAM(ram_array)
    return RomList(ram_array)

def say_hello():
    """
    Test that the VBA/GB bindings are working.
    """
    Gb.sayHello()

def get_memory():
    """
    Returns memory in bytes in a string.
    """
    raise NotImplementedError("dunno how to calculate memory size")
    # memory_size = ...
    memory = jarray.zeros(memory_size, "i")
    Gb.getMemory(memory)
    return RomList(memory)

def get_pixels():
    """
    Returns a list of pixels on the screen display. Broken, probably. Use
    screenshot() instead.
    """
    sys.stderr.write("ERROR: seems to be broken on VBA's end? Good luck. Use"
    " screenshot() instead.\n")
    size = Gb.DISPLAY_WIDTH * Gb.DISPLAY_HEIGHT
    pixels = jarray.zeros(size, "i")
    Gb.getPixels(pixels)
    return RomList(pixels)

def screenshot(filename, literal=False):
    """
    Saves a PNG screenshot to the file at filename. Use literal if you want to
    store it in the current directory. Default is to save it to screenshots/
    under the project.
    """
    screenshots_path = os.path.join(project_path, "screenshots/")
    filename = os.path.join(screenshots_path, filename)
    if len(filename) < 4 or filename[-4:] != ".png":
        filename += ".png"
    Gb.nwritePNG(filename)
    print "Screenshot saved to: " + str(filename)
save_png = screenshot

def read_memory(address):
    """
    Read an integer at an address.
    """
    return Gb.readMemory(address)

def press(buttons, steplimit=1):
    """
    Press a button. Use steplimit to say for how many steps you want to press
    the button (try leaving it at the default, 1).
    """
    if hasattr(buttons, "__len__"):
        number = button_combiner(buttons)
    elif isinstance(buttons, int):
        number = buttons
    else:
        number = buttons
    for step_counter in range(0, steplimit):
        Gb.step(number)


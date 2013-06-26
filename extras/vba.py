#!/usr/bin/jython
# -*- encoding: utf-8 -*-
"""
vba-clojure (but really it's jython/python/jvm)

This is jython, not python. Use jython to run this file. Before running this
file, some of the dependencies need to be constructed. These can be obtained
from the vba-clojure project.
    sudo apt-get install g++ libtool openjdk-6-jre openjdk-6-jdk libsdl1.2-dev mercurial ant autoconf jython

    export JAVA_INCLUDE_PATH=/usr/lib/jvm/java-6-openjdk-amd64/include/
    export JAVA_INCLUDE_PATH2=/usr/lib/jvm/java-6-openjdk-amd64/include/

    hg clone http://hg.bortreb.com/vba-clojure
    cd vba-clojure/
    ./dl-libs.sh
    cd java/
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

(In the above command, substitute the first path with the path of the vba-clojure
directory you made, if it is different.)

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

    vba.get_memory_at(0xDCDA)
    vba.set_memory_at(0xDCDB, 0xFF)
    vba.get_memory_range(0xDCDA, 10)

TOOD:
    [ ] set a specific register
    [ ] get a specific register
    [ ] breakpoints
    [ ] vgm stuff
    [ ] gbz80disasm integration
    [ ] pokecrystal.extras integration

"""

import os
import sys
import re
from array import array
import string
from copy import copy
import unittest

# for converting bytes to readable text
from chars import chars

from map_names import map_names

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

from vba_config import *

try:
    import vba_keyboard as keyboard
except ImportError:
    print "Not loading the keyboard module (which uses networkx)."

if not os.path.exists(rom_path):
    raise Exception("rom_path is not configured properly; edit vba_config.py?")

def _check_java_library_path():
    """
    Returns the value of java.library.path.

    The vba-clojure library must be compiled
    and linked from this location.
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
    Combines multiple button presses into an integer.

    This is used when sending a keypress to the emulator.
    """
    result = 0

    # String inputs need to be cleaned up so that "start" doesn't get
    # recognized as "s" and "t" etc..
    if isinstance(buttons, str):
        if "restart" in buttons:
            buttons = buttons.replace("restart", "")
            result |= button_masks["restart"]
        if "start" in buttons:
            buttons = buttons.replace("start", "")
            result |= button_masks["start"]
        if "select" in buttons:
            buttons = buttons.replace("select", "")
            result |= button_masks["select"]

        # allow for the "a, b" and "a b" formats
        if ", " in buttons:
            buttons = buttons.split(", ")
        elif " " in buttons:
            buttons = buttons.split(" ")

    if isinstance(buttons, list):
        if len(buttons) > 9:
            raise Exception("can't combine more than 9 buttons at a time")

    for each in buttons:
        result |= button_masks[each]

    #print "button: " + str(result)
    return result

def load_rom(path=None):
    """
    Starts the emulator with a certain ROM.

    Defaults to rom_path if no parameters are given.
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
    Stops the emulator. Closes the window.

    The "opposite" of this is the load_rom function.
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

def translate_chars(charz):
    result = ""
    for each in charz:
        result += chars[each]
    return result

def _create_byte_buffer(data):
    """
    Converts data into a ByteBuffer.

    This is useful for interfacing with the Gb class.
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
    Injects the given state into the emulator.

    Use do_step if you want to call step(), which also allows
    SDL to render the latest frame. Note that the default is to
    not step, and that the screen (if it is enabled) will appear
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
    Saves the given state to save_state_path.

    The file format must be ".sav"
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
    Reads a state from file based on name.

    Looks in save_state_path for a file
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
    Loads the root state.

    (Or restarts the emulator and creates a new root state.)
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

def set_registers(registers):
    """
    Applies the set of registers to the CPU.
    """
    Gb.writeRegisters(registers)
write_registers = set_registers

def get_rom():
    """
    Returns the ROM in bytes.
    """
    rom_array = jarray.zeros(Gb.ROM_SIZE, "i")
    Gb.getROM(rom_array)
    return RomList(rom_array)

def get_ram():
    """
    Returns the RAM in bytes.
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
    Returns memory in bytes.
    """
    memory_size = 0x10000
    memory = jarray.zeros(memory_size, "i")
    Gb.getMemory(memory)
    return RomList(memory)

def set_memory(memory):
    """
    Sets memory in the emulator.

    Use get_memory() to retrieve the current state.
    """
    Gb.writeMemory(memory)

def get_pixels():
    """
    Returns a list of pixels on the screen display.

    Broken, probably. Use screenshot() instead.
    """
    sys.stderr.write("ERROR: seems to be broken on VBA's end? Good luck. Use"
    " screenshot() instead.\n")
    size = Gb.DISPLAY_WIDTH * Gb.DISPLAY_HEIGHT
    pixels = jarray.zeros(size, "i")
    Gb.getPixels(pixels)
    return RomList(pixels)

def screenshot(filename, literal=False):
    """
    Saves a PNG screenshot to the file at filename.

    Use literal if you want to store it in the current directory.
    Default is to save it to screenshots/ under the project.
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
get_memory_at = read_memory

def get_memory_range(start_address, byte_count):
    """
    Returns a list of bytes.

    start_address - address to start reading at
    byte_count - how many bytes (0 returns just 1 byte)
    """
    bytez = []
    for counter in range(0, byte_count):
        byte = get_memory_at(start_address + counter)
        bytez.append(byte)
    return bytez

def set_memory_at(address, value):
    """
    Sets a byte at a certain address in memory.

    This directly sets the memory instead of copying
    the memory from the emulator.
    """
    Gb.setMemoryAt(address, value)

def press(buttons, holdsteps=1, aftersteps=1):
    """
    Press a button.

    Use steplimit to say for how many steps you want to press
    the button (try leaving it at the default, 1).
    """
    if hasattr(buttons, "__len__"):
        number = button_combiner(buttons)
    elif isinstance(buttons, int):
        number = buttons
    else:
        number = buttons
    for step_counter in range(0, holdsteps):
        Gb.step(number)

    # clear the button press
    if aftersteps > 0:
        for step_counter in range(0, aftersteps):
            Gb.step(0)

def get_buttons():
    """
    Returns the currentButtons[0] value

    (an integer with bits set for which
    buttons are currently pressed).
    """
    return Gb.getCurrentButtons()

class State(RomList):
    name = None

class Recording:
    def __init__(self):
        self.frames = []
        self.states = {}

    def _get_frame_count(self):
        return len(self.frames)

    frame_count = property(fget=_get_frame_count)

    def save(self, name=None):
        """
        Saves the current state.
        """
        state = State(get_state())
        state.name = name
        self.states[self.frame_count] = state

    def load(self, name):
        """
        Loads a state by name in the state list.
        """
        for state in self.states.items():
            if state.name == name:
                set_state(state)
                return state
        return False

    def step(self, stepcount=1, first_frame=0, replay=False):
        """
        Records button presses for each frame.
        """
        if replay:
            stepcount = len(self.frames[first_name:])

        for counter in range(first_frame, stepcount):
            if replay:
                press(self.frames[counter], steplimit=0)
            else:
                self.frames.append(get_buttons())
            nstep(1)

    def replay_from(self, thing):
        """
        Replays based on a State or the name of a saved state.
        """
        if isinstance(thing, State):
            set_state(thing)
        else:
            thing = self.load(thing)
        frame_id = self.states.index(thing)
        self.step(first_frame=frame_id, replay=True)

class Registers:
    order = [
        "pc",
        "sp",
        "af",
        "bc",
        "de",
        "hl",
        "iff",
        "div",
        "tima",
        "tma",
        "tac",
        "if",
        "lcdc",
        "stat",
        "scy",
        "scx",
        "ly",
        "lyc",
        "dma",
        "wy",
        "wx",
        "vbk",
        "hdma1",
        "hdma2",
        "hdma3",
        "hdma4",
        "hdma5",
        "svbk",
        "ie",
    ]

    def __setitem__(self, key, value):
        current_registers = get_registers()
        current_registers[Registers.order.index(key)] = value
        set_registers(current_registers)

    def __getitem__(self, key):
        current_registers = get_registers()
        return current_registers[Registers.order.index(key)]

    def __list__(self):
        return get_registers()

    def _get_register(id):
        def constructed_func(self, id=copy(id)):
            return get_registers()[id]
        return constructed_func

    def _set_register(id):
        def constructed_func(self, value, id=copy(id)):
            current_registers = get_registers()
            current_registers[id] = value
            set_registers(current_registers)
        return constructed_func

    pc = property(fget=_get_register(0), fset=_set_register(0))
    sp = property(fget=_get_register(1), fset=_set_register(1))
    af = property(fget=_get_register(2), fset=_set_register(2))
    bc = property(fget=_get_register(3), fset=_set_register(3))
    de = property(fget=_get_register(4), fset=_set_register(4))
    hl = property(fget=_get_register(5), fset=_set_register(5))
    iff = property(fget=_get_register(6), fset=_set_register(6))
    div = property(fget=_get_register(7), fset=_set_register(7))
    tima = property(fget=_get_register(8), fset=_set_register(8))
    tma = property(fget=_get_register(9), fset=_set_register(9))
    tac = property(fget=_get_register(10), fset=_set_register(10))
    _if = property(fget=_get_register(11), fset=_set_register(11))
    lcdc = property(fget=_get_register(12), fset=_set_register(12))
    stat = property(fget=_get_register(13), fset=_set_register(13))
    scy = property(fget=_get_register(14), fset=_set_register(14))
    scx = property(fget=_get_register(15), fset=_set_register(15))
    ly = property(fget=_get_register(16), fset=_set_register(16))
    lyc = property(fget=_get_register(17), fset=_set_register(17))
    dma = property(fget=_get_register(18), fset=_set_register(18))
    wy = property(fget=_get_register(19), fset=_set_register(19))
    wx = property(fget=_get_register(20), fset=_set_register(20))
    vbk = property(fget=_get_register(21), fset=_set_register(21))
    hdma1 = property(fget=_get_register(22), fset=_set_register(22))
    hdma2 = property(fget=_get_register(23), fset=_set_register(23))
    hdma3 = property(fget=_get_register(24), fset=_set_register(24))
    hdma4 = property(fget=_get_register(25), fset=_set_register(25))
    hdma5 = property(fget=_get_register(26), fset=_set_register(26))
    svbk = property(fget=_get_register(27), fset=_set_register(27))
    ie = property(fget=_get_register(28), fset=_set_register(28))

    def __repr__(self):
        spacing = "\t"
        output = "Registers:\n"
        for (id, each) in enumerate(self.order):
            output += spacing + each + " = " + hex(get_registers()[id])
            #hex(self[each])
            output += "\n"
        return output

registers = Registers()

def call(bank, address):
    """
    Jumps into a function at a certain address.

    Go into the start menu, pause the game and try call(1, 0x1078) to see a
    string printed to the screen.
    """
    push = [
        registers.pc,
        registers.hl,
        registers.de,
        registers.bc,
        registers.af,
        0x3bb7,
    ]

    for value in push:
        registers.sp -= 2
        set_memory_at(registers.sp + 1, value >> 8)
        set_memory_at(registers.sp, value & 0xFF)
        if get_memory_range(registers.sp, 2) != [value & 0xFF, value >> 8]:
            print "desired memory values: " + str([value & 0xFF, value >> 8] )
            print "actual memory values: " + str(get_memory_range(registers.sp , 2))
            print "wrong value at " + hex(registers.sp) + " expected " + hex(value) + " but got " + hex(get_memory_at(registers.sp))

    if bank != 0:
        registers["af"] = (bank << 8) | (registers["af"] & 0xFF)
        registers["hl"] = address
        registers["pc"] = 0x2d63 # FarJump
    else:
        registers["pc"] = address

class cheats:
    """
    Helpers to manage the cheating infrastructure.

    import vba; vba.load_rom(); vba.cheats.add_gameshark("0100CFCF", "text speedup 1"); vba.cheats.add_gameshark("0101CCCF", "text speedup 2"); vba.go()
    """

    @staticmethod
    def enable(id):
        """
        void gbCheatEnable(int i)
        """
        Gb.cheatEnable(id)

    @staticmethod
    def disable(id):
        """
        void gbCheatDisable(int i)
        """
        Gb.cheatDisable(id)

    @staticmethod
    def load_file(filename):
        """
        Loads a .clt file. By default each cheat is disabled.
        """
        Gb.loadCheatsFromFile(filename)

    @staticmethod
    def remove_all():
        """
        Removes all cheats from memory.

        void gbCheatRemoveAll()
        """
        Gb.cheatRemoveAll()

    @staticmethod
    def remove_cheat(id):
        """
        Removes a specific cheat from memory by id.

        void gbCheatRemove(int i)
        """
        Gb.cheatRemove(id)

    @staticmethod
    def add_gamegenie(code, description=""):
        """
        void gbAddGgCheat(const char *code, const char *desc)
        """
        Gb.cheatAddGamegenie(code, description)

    @staticmethod
    def add_gameshark(code, description=""):
        """
        gbAddGsCheat(const char *code, const char *desc)
        """
        Gb.cheatAddGameshark(code, description)

class crystal:

    """
    Just a simple namespace to store a bunch of functions for Pokémon Crystal.
    """

    @staticmethod
    def text_wait(step_size=10, max_wait=500):
        """
        Presses the "A" button when text is done being drawn to screen.

        :param step_size: number of steps per wait loop
        :param max_wait: number of wait loops to perform
        """
        for x in range(0, max_wait):
            hi = get_memory_at(registers.sp + 1)
            lo = get_memory_at(registers.sp)
            address = ((hi << 8) | lo)
            if address == 0xaef:
                break
            else:
                nstep(step_size)

        press("a", holdsteps=50, aftersteps=1)

    @staticmethod
    def walk_through_walls_slow():
        memory = get_memory()
        memory[0xC2FA] = 0
        memory[0xC2FB] = 0
        memory[0xC2FC] = 0
        memory[0xC2FD] = 0
        set_memory(memory)

    @staticmethod
    def walk_through_walls():
        """
        Lets the player walk all over the map.

        These values are probably reset by some of the map/collision
        functions when you move on to a new location, so this needs
        to be executed each step/tick if continuous walk-through-walls
        is desired.
        """
        set_memory_at(0xC2FA, 0)
        set_memory_at(0xC2FB, 0)
        set_memory_at(0xC2FC, 0)
        set_memory_at(0xC2FD, 0)

    #@staticmethod
    #def set_enemy_level(level):
    #    set_memory_at(0xd213, level)

    @staticmethod
    def nstep(steplimit=500):
        """
        Steps the CPU forward and calls some functions in between each step.

        (For example, to manipulate memory.) This is pretty slow.
        """
        for step_counter in range(0, steplimit):
            crystal.walk_through_walls()
            #call(0x1, 0x1078)
            step()

    @staticmethod
    def disable_triggers():
        set_memory_at(0x23c4, 0xAF)
        set_memory_at(0x23d0, 0xAF);

    @staticmethod
    def disable_callbacks():
        set_memory_at(0x23f2, 0xAF)
        set_memory_at(0x23fe, 0xAF)

    @staticmethod
    def get_map_group_id():
        """
        Returns the current map group.
        """
        return get_memory_at(0xdcb5)

    @staticmethod
    def get_map_id():
        """
        Returns the map number of the current map.
        """
        return get_memory_at(0xdcb6)

    @staticmethod
    def get_map_name():
        """
        Figures out the current map name.
        """
        map_group_id = crystal.get_map_group_id()
        map_id = crystal.get_map_id()
        return map_names[map_group_id][map_id]["name"]

    @staticmethod
    def get_xy():
        """
        (x, y) coordinates of player on map.

        Relative to top-left corner of map.
        """
        x = get_memory_at(0xdcb8)
        y = get_memory_at(0xdcb7)
        return (x, y)

    @staticmethod
    def menu_select(id=1):
        """
        Sets the cursor to the given pokemon in the player's party.

        This is under Start -> PKMN. This is useful for selecting a
        certain pokemon with fly or another skill.

        This probably works on other menus.
        """
        set_memory_at(0xcfa9, id)

    @staticmethod
    def is_in_battle():
        """
        Checks whether or not we're in a battle.
        """
        return (get_memory_at(0xd22d) != 0) or crystal.is_in_link_battle()

    @staticmethod
    def is_in_link_battle():
        return get_memory_at(0xc2dc) != 0

    @staticmethod
    def unlock_flypoints():
        """
        Unlocks different destinations for flying.

        Note: this might start at 0xDCA4 (minus one on all addresses), but not
        sure.
        """
        set_memory_at(0xDCA5, 0xFF)
        set_memory_at(0xDCA6, 0xFF)
        set_memory_at(0xDCA7, 0xFF)
        set_memory_at(0xDCA8, 0xFF)

    @staticmethod
    def get_gender():
        """
        Returns 'male' or 'female'.
        """
        gender = get_memory_at(0xD472)
        if gender == 0:
            return "male"
        elif gender == 1:
            return "female"
        else:
            return gender

    @staticmethod
    def get_player_name():
        """
        Returns the 7 characters making up the player's name.
        """
        bytez = get_memory_range(0xD47D, 7)
        name = translate_chars(bytez)
        return name

    @staticmethod
    def warp(map_group_id, map_id, x, y):
        set_memory_at(0xdcb5, map_group_id)
        set_memory_at(0xdcb6, map_id)
        set_memory_at(0xdcb7, y)
        set_memory_at(0xdcb8, x)
        set_memory_at(0xd001, 0xFF)
        set_memory_at(0xff9f, 0xF1)
        set_memory_at(0xd432, 1)
        set_memory_at(0xd434, 0 & 251)

    @staticmethod
    def warp_pokecenter():
        crystal.warp(1, 1, 3, 3)
        crystal.nstep(200)

    @staticmethod
    def masterballs():
        # masterball
        set_memory_at(0xd8d8, 1)
        set_memory_at(0xd8d9, 99)

        # ultraball
        set_memory_at(0xd8da, 2)
        set_memory_at(0xd8db, 99)

        # pokeballs
        set_memory_at(0xd8dc, 5)
        set_memory_at(0xd8dd, 99)

    @staticmethod
    def get_text():
        """
        Returns alphanumeric text on the screen.

        Other characters will not be shown.
        """
        output = ""
        tiles = get_memory_range(0xc4a0, 1000)
        for each in tiles:
            if each in chars.keys():
                thing = chars[each]
                acceptable = False

                if len(thing) == 2:
                    portion = thing[1:]
                else:
                    portion = thing

                if portion in string.printable:
                    acceptable = True

                if acceptable:
                    output += thing

        # remove extra whitespace
        output = re.sub(" +", " ", output)
        output = output.strip()

        return output

    @staticmethod
    def keyboard_apply(button_sequence):
        """
        Applies a sequence of buttons to the on-screen keyboard.
        """
        for buttons in button_sequence:
            press(buttons)
            nstep(2)
            press([])

    @staticmethod
    def write(something="TrAiNeR"):
        """
        Types out a word.

        Uses a planning algorithm to do this in the most efficient way possible.
        """
        button_sequence = keyboard.plan_typing(something)
        crystal.keyboard_apply([[x] for x in button_sequence])

    @staticmethod
    def set_partymon2():
        """
        This causes corruption, so it's not working yet.
        """
        memory = get_memory()
        memory[0xdcd7] = 2
        memory[0xdcd9] = 0x7

        memory[0xdd0f] = 0x7
        memory[0xdd10] = 0x1

        # moves
        memory[0xdd11] = 0x1
        memory[0xdd12] = 0x2
        memory[0xdd13] = 0x3
        memory[0xdd14] = 0x4

        # id
        memory[0xdd15] = 0x1
        memory[0xdd16] = 0x2

        # experience
        memory[0xdd17] = 0x2
        memory[0xdd18] = 0x3
        memory[0xdd19] = 0x4

        # hp
        memory[0xdd1a] = 0x5
        memory[0xdd1b] = 0x6

        # current hp
        memory[0xdd31] = 0x10
        memory[0xdd32] = 0x25

        # max hp
        memory[0xdd33] = 0x10
        memory[0xdd34] = 0x40

        set_memory(memory)

class TestEmulator(unittest.TestCase):
    try:
        state = load_state("cheating-12")
    except:
        if "__name__" == "__main__":
            raise Exception("failed to setup unit tests because no save state found")

    def setUp(self):
        load_rom()
        set_state(self.state)

    def tearDown(self):
        shutdown()

    def test_PlaceString(self):
        call(0, 0x1078)

        # where to draw the text
        registers["hl"] = 0xc4a0

        # what text to read from
        registers["de"] = 0x1276

        nstep(10)

        text = crystal.get_text()

        self.assertTrue("TRAINER" in text)

class TestWriter(unittest.TestCase):
    def test_very_basic(self):
        button_sequence = keyboard.plan_typing("an")
        expected_result = ["select", "a", "d", "r", "r", "r", "r", "a"]

        self.assertEqual(len(expected_result), len(button_sequence))
        self.assertEqual(expected_result, button_sequence)

if __name__ == "__main__":
    unittest.main()


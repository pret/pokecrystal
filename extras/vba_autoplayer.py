# -*- coding: utf-8 -*-
"""
Programmatic speedrun of Pokémon Crystal
"""
import os

# bring in the emulator and basic tools
import vba

def main():
    """
    Start the game.
    """
    vba.load_rom()

    # get past the opening sequence
    skip_intro()

    # walk to mom and handle her text
    handle_mom()

    # walk to elm and do whatever he wants
    handle_elm("totodile")

    new_bark_level_grind(10, skip=False)

def skippable(func):
    """
    Makes a function skippable by saving the state before and after the
    function runs. Pass "skip=True" to the function to load the previous save
    state from when the function finished.
    """
    def wrapped_function(*args, **kwargs):
        skip = True

        if "skip" in kwargs.keys():
            skip = kwargs["skip"]
            del kwargs["skip"]

        # override skip if there's no save
        if skip:
            full_name = func.__name__ + "-end.sav"
            if not os.path.exists(os.path.join(vba.save_state_path, full_name)):
                skip = False

        return_value = None

        if not skip:
            vba.save_state(func.__name__ + "-start", override=True)
            return_value = func(*args, **kwargs)
            vba.save_state(func.__name__ + "-end", override=True)
        elif skip:
            vba.set_state(vba.load_state(func.__name__ + "-end"))

        return return_value
    return wrapped_function

@skippable
def skip_intro():
    """
    Skip the game boot intro sequence.
    """
    # copyright sequence
    vba.nstep(400)

    # skip the ditto sequence
    vba.press("a")
    vba.nstep(100)

    # skip the start screen
    vba.press("start")
    vba.nstep(100)

    # click "new game"
    vba.press("a", holdsteps=50, aftersteps=1)

    # Are you a boy? Or are you a girl?
    vba.nstep(145)

    # pick "boy"
    vba.press("a", holdsteps=50, aftersteps=1)

    # ....
    vba.crystal.text_wait()

    vba.crystal.text_wait()

    # What time is it?
    vba.crystal.text_wait()

    # DAY 10 o'clock
    vba.press("a", holdsteps=50, aftersteps=1)

    # WHAT? DAY 10 o'clock? YES/NO.
    vba.press("a", holdsteps=50, aftersteps=1)

    # How many minutes? 0 min.
    vba.press("a", holdsteps=50, aftersteps=1)

    # Whoa! 0 min.? YES/NO.
    vba.press("a", holdsteps=50, aftersteps=1)

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # People call me
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # tures that we call
    vba.crystal.text_wait()

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.crystal.text_wait()

    # everything about pokemon yet.
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # Now, what did you say your name was?
    vba.crystal.text_wait()

    # move down to "CHRIS"
    vba.press("d")
    vba.nstep(50)

    vba.press("a", holdsteps=50, aftersteps=1)

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # wait until playable
    # could be 150, but it sometimes takes longer??
    vba.nstep(200)

    return

@skippable
def handle_mom():
    """
    Walk to mom. Handle her speech and questions.
    """
    vba.press("r"); vba.nstep(50)
    vba.press("r"); vba.nstep(50)
    vba.press("r"); vba.nstep(50)
    vba.press("r"); vba.nstep(50)
    vba.press("r"); vba.nstep(50)
    vba.press("u"); vba.nstep(50)
    vba.press("u"); vba.nstep(50)
    vba.press("u"); vba.nstep(50)
    vba.press("u"); vba.nstep(50)

    # wait for next map to load
    vba.nstep(50)

    vba.press("d"); vba.nstep(50)
    vba.press("d"); vba.nstep(50)
    vba.press("d"); vba.nstep(50)

    # walk into mom's line of sight
    vba.press("d"); vba.nstep(50)

    vba.nstep(50)
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # What day is it? SUNDAY.
    vba.press("a", holdsteps=50, aftersteps=1)

    # SUNDAY, is it? YES/NO
    vba.press("a", holdsteps=50, aftersteps=1)

    vba.nstep(200)

    # is it DST now? YES/NO.
    vba.press("a", holdsteps=50, aftersteps=1)

    # 10:06 AM DST, is that OK? YES/NO.
    vba.press("a", holdsteps=50, aftersteps=1)

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # know how to use the PHONE? YES/NO.
    vba.press("a", holdsteps=50, aftersteps=1)

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.press("a", holdsteps=50, aftersteps=1)

    # have to wait for her to move back :(
    vba.nstep(50)

    # face down
    vba.press("d"); vba.nstep(50)

    return

@skippable
def handle_elm(starter_choice):
    """
    Walk to Elm's Lab and get a starter.
    """

    # walk down
    vba.press("d"); vba.nstep(50)
    vba.press("d"); vba.nstep(50)

    # face left
    vba.press("l"); vba.nstep(50)

    # walk left
    vba.press("l"); vba.nstep(50)
    vba.press("l"); vba.nstep(50)

    # face down
    vba.press("d"); vba.nstep(50)

    # walk down
    vba.press("d"); vba.nstep(50)

    # walk down to warp to outside
    vba.press("d"); vba.nstep(50)
    vba.nstep(10)

    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)

    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)

    vba.press("u", holdsteps=10, aftersteps=50)
    vba.press("u", holdsteps=10, aftersteps=50)

    # warp into elm's lab (bottom left warp)
    vba.press("u", holdsteps=5, aftersteps=50)

    # let the script play
    vba.nstep(200)

    vba.crystal.text_wait()
    # I needed to ask you a fa

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.nstep(50)

    # YES/NO.
    vba.press("a")

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.press("a")

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.press("a")
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.crystal.text_wait()

    for x in range(0, 8): # was 15
        vba.crystal.text_wait()

    vba.nstep(50)
    vba.press("a")
    vba.nstep(100)

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # Go on! Pick one.
    vba.nstep(100)
    vba.press("a"); vba.nstep(50)

    vba.press("r"); vba.nstep(50)
    vba.press("r"); vba.nstep(50)

    right = 0
    if starter_choice in [1, "cyndaquil"]:
        right = 0
    elif starter_choice in [2, "totodile"]:
        right = 1
    elif starter_choice in [3, "chikorita"]:
        right = 2
    else:
        raise Exception("bad starter")

    for each in range(0, right):
        vba.press("r"); vba.nstep(50)

    # look up
    vba.press("u", holdsteps=5, aftersteps=50)

    # get menu
    vba.press("a", holdsteps=5, aftersteps=50)

    # let the image show
    vba.nstep(100)

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # YES/NO.
    vba.press("a")

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # received.. music is playing.
    vba.press("a")
    vba.crystal.text_wait()

    # YES/NO (nickname)
    vba.crystal.text_wait()

    vba.press("b")

    # get back to elm
    vba.nstep(100)
    vba.nstep(100)

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # phone number..
    vba.press("a")
    vba.crystal.text_wait()
    vba.nstep(100)
    vba.press("a")
    vba.nstep(300)
    vba.press("a")
    vba.nstep(100)

    vba.crystal.text_wait()
    vba.crystal.text_wait()
    vba.crystal.text_wait()

    # I'm counting on you!
    vba.nstep(200)
    vba.press("a")
    vba.nstep(50)

    # look down
    vba.press("d", holdsteps=5, aftersteps=50)

    # walk down
    vba.press("d", holdsteps=10, aftersteps=50)

    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.press("a")
    vba.nstep(50)
    vba.press("a")

    vba.crystal.text_wait()
    vba.crystal.text_wait()

    vba.press("a")
    vba.nstep(50)

    vba.crystal.text_wait()
    vba.press("a")

    vba.nstep(100)

    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)

    # step outside
    vba.nstep(40)

@skippable
def new_bark_level_grind(level):
    """
    Starting just outside of Elm's Lab, do some level grinding until the first
    partymon level is equal to the given value..
    """

    # walk to the grass area
    new_bark_level_grind_walk_to_grass(skip=False)

    # TODO: walk around in grass, handle battles
    # TODO: heal at the lab, then repeat entire function

@skippable
def new_bark_level_grind_travel_to_grass():
    """
    Move to just above the grass.
    """
    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)

    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)
    vba.press("l", holdsteps=10, aftersteps=50)

    vba.press("d", holdsteps=10, aftersteps=50)
    vba.press("d", holdsteps=10, aftersteps=50)

if __name__ == "__main__":
    main()

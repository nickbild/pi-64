# Pi64

The Pi64 is a Raspberry Pi 400 that has been coerced into booting into a Commodore 64-like text mode.

<p align="center">
<img src="https://raw.githubusercontent.com/nickbild/pi-64/main/media/teaser.gif">
</p>

I *love* the retro vibes that the Raspberry Pi 400 gives off.  The all-in-one computer-in-a-keyboard design makes me feel like I'm working with a computer from my childhood.  The only problem I have is that when I look up from the keyboard, it's just another modern(-ish) computer running Linux.  I set out to fix that with the Pi64.

Inspired by the Commodore 64, the Pi64 boots into a C64-themed bash shell in text mode.  No X Server is involved.  It is not a C64 emulator, it is Raspberry Pi OS, so you can get real work done, it just extends the Pi 400's retro feel to the screen.

## How It Works

As a prerequisite, you'll need to install `tmux`, e.g.:

`sudo apt-get install tmux`

Then you'll need to append the following color codes to your `~/.bashrc` file:

```bash
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0483AAA" # DARK BLUE 
    echo -en "\e]P1867ADE" # LIGHT BLUE
    echo -en "\e]P2867ADE" # LIGHT BLUE
    echo -en "\e]P3867ADE" # LIGHT BLUE
    echo -en "\e]P4867ADE" # LIGHT BLUE
    echo -en "\e]P5867ADE" # LIGHT BLUE
    echo -en "\e]P6867ADE" # LIGHT BLUE
    echo -en "\e]P7867ADE" # LIGHT BLUE
    echo -en "\e]P8867ADE" # LIGHT BLUE
    echo -en "\e]P9867ADE" # LIGHT BLUE
    echo -en "\e]PA867ADE" # LIGHT BLUE
    echo -en "\e]PB867ADE" # LIGHT BLUE
    echo -en "\e]PC867ADE" # LIGHT BLUE
    echo -en "\e]PD867ADE" # LIGHT BLUE
    echo -en "\e]PE867ADE" # LIGHT BLUE
    echo -en "\e]PF867ADE" # LIGHT BLUE
    clear
fi
```

This replaces the standard tty colors with the RGB values for C64 light and dark blue.  Next, to set the login banner, append the following to `~/.bashrc`:

```bash
mem_total=$(cat /proc/meminfo | grep "MemTotal" | tr -s ' ' | cut -d" " -f2)
mem_total_unit=$(cat /proc/meminfo | grep "MemTotal" | tr -s ' ' | cut -d" " -f3)
mem_free=$(cat /proc/meminfo | grep "MemFree" | tr -s ' ' | cut -d" " -f2)
mem_free_unit=$(cat /proc/meminfo | grep "MemFree" | tr -s ' ' | cut -d" " -f3)

mem_total_unit=${mem_total_unit^^}
mem_free_unit=${mem_free_unit^^}

center() {
  termwidth=224
  padding="$(printf '%0.1s' ' '{1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

center "**** PI64 RASPBERRY PI OS ****"
echo ""
center "$mem_total $mem_total_unit RAM SYSTEM  $mem_free $mem_free_unit FREE"
echo ""
echo "READY."
echo ""
```

With that one-time setup in place, the Pi64 prompt can be launched by running the script:

`./pi64.sh`

It isn't super easy to get a tty to do this sort of thing, so it took a hacky sort of hack to get it working.  A highly-tweaked `tmux` session is created (see [tmux.sh](https://github.com/nickbild/pi-64/blob/main/tmux.sh)), with 7 panes laid out something like this:

```
--------------------
--       p0       --
--------------------
-- p1 -- p2 -- p3 --
--------------------
-- p4 -- p5 -- p6 --
--------------------
```

Pane `p2` in the center is the active display area, so a bash prompt is started there, and it is set as the active pane.  All of the other panes run a [bash script](ttps://github.com/nickbild/pi-64/blob/main/display_border.sh) that makes them look like a solid border, in C64 light blue.

The end result is pretty fantastic, if I do say so myself.  It looks and feels like working on a C64, but with all the conveniences of a modern Linux distribution.

## Media

YouTube: https://www.youtube.com/watch?v=WB9E4iRnDuo

After login:
![login](https://raw.githubusercontent.com/nickbild/pi-64/main/media/start.png)

Running htop:
![htop](https://raw.githubusercontent.com/nickbild/pi-64/main/media/htop.png)

Running miscellaneous commands:
![misc](https://raw.githubusercontent.com/nickbild/pi-64/main/media/misc_commands.png)

Raspberry Pi 400:
![pi400](https://raw.githubusercontent.com/nickbild/pi-64/main/media/pi400.jpg)

## Bill of Materials

1 x Raspberry Pi 400

## About the Author

[Nick A. Bild, MS](https://nickbild79.firebaseapp.com/#!/)

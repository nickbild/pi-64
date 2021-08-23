#!/bin/sh

####
## Pi64
## https://github.com/nickbild/pi-64
## Nick Bild
## August 2021
####
# 
# 1) Make sure to set up colors in ~/.bashrc, e.g.:
#
# if [ "$TERM" = "linux" ]; then
#     echo -en "\e]P0483AAA" # DARK BLUE 
#     echo -en "\e]P1867ADE" # LIGHT BLUE
#     echo -en "\e]P2867ADE" # LIGHT BLUE
#     echo -en "\e]P3867ADE" # LIGHT BLUE
#     echo -en "\e]P4867ADE" # LIGHT BLUE
#     echo -en "\e]P5867ADE" # LIGHT BLUE
#     echo -en "\e]P6867ADE" # LIGHT BLUE
#     echo -en "\e]P7867ADE" # LIGHT BLUE
#     echo -en "\e]P8867ADE" # LIGHT BLUE
#     echo -en "\e]P9867ADE" # LIGHT BLUE
#     echo -en "\e]PA867ADE" # LIGHT BLUE
#     echo -en "\e]PB867ADE" # LIGHT BLUE
#     echo -en "\e]PC867ADE" # LIGHT BLUE
#     echo -en "\e]PD867ADE" # LIGHT BLUE
#     echo -en "\e]PE867ADE" # LIGHT BLUE
#     echo -en "\e]PF867ADE" # LIGHT BLUE
#     clear
# fi
#
# 'P0' - background color
# 'Px' - text, etc. colors
#
#
# 2) Also set login banner in ~/.bashrc, e.g.:
# 
# mem_total=$(cat /proc/meminfo | grep "MemTotal" | tr -s ' ' | cut -d" " -f2)
# mem_total_unit=$(cat /proc/meminfo | grep "MemTotal" | tr -s ' ' | cut -d" " -f3)
# mem_free=$(cat /proc/meminfo | grep "MemFree" | tr -s ' ' | cut -d" " -f2)
# mem_free_unit=$(cat /proc/meminfo | grep "MemFree" | tr -s ' ' | cut -d" " -f3)
# 
# mem_total_unit=${mem_total_unit^^}
# mem_free_unit=${mem_free_unit^^}
# 
# center() {
#   termwidth=224
#   padding="$(printf '%0.1s' ' '{1..500})"
#   printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
# }
# 
# center "**** PI64 RASPBERRY PI OS ****"
# echo ""
# center "$mem_total $mem_total_unit RAM SYSTEM  $mem_free $mem_free_unit FREE"
# echo ""
# echo "READY."
# echo ""
#

# Set up the active bash prompt with the proper offsets
# for drawing a border.
./tmux.sh

#!/bin/bash
#---------folders-config
declare -a dirs=("gtk-3.0" "i3" "picom" "rofi" "xfce4" "polybar" "ranger" "rofi" "awesome" "fish")
dirsCount=${#dirs[@]}
includeBashrc="true"

#---------colors
alertColor='\033[41m'
okColor='\033[0;32m'
noColor='\033[0m'

if [ -d ".git" ]; then 
    printf "${okColor}Removing old config from git folder... ${noColor}\n"
    find -mindepth 1 -maxdepth 1 -type d -not -path '*/.git*' -print0 | xargs -r0 rm -R
else
    printf "${alertColor}NO! Be sure you running this script from proper place!${noColor}\n"
    exit 0
fi

mkdir .config
#-----folders
for (( i=0; i<dirsCount; i++ ))
do
    if [ -d ~/.config/${dirs[$i]} ]; then
        printf '%b%.32s%s%b\n' "${okColor}" "${dirs[$i]}.................................." "done!" "${noColor}";
        cp -r ~/.config/${dirs[$i]} ./.config
    else
        printf '%b%.27s%s%b\n' "${alertColor}" "${dirs[$i]}............................." "not found!" "${noColor}";
    fi
done
if [ -f ~/.bashrc ] && [ includeBashrc ]; then
    cp ~/.bashrc .
    printf '%b%.32s%s%b\n' "${okColor}" ".bashrc.................................." "done!" "${noColor}";
fi

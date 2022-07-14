#!/bin/bash
#alertColor='\033[0;31m'
dirsCount=''
alertColor='\033[41m'
okColor='\033[0;32m'
noColor='\033[0m'
padding="........................................"

if [ -d ".git" ]; then 
    printf "${okColor}Removing old config from git folder... ${noColor}\n"
    find -mindepth 1 -maxdepth 1 -type d -not -path '*/.*' -print0 | xargs -r0 rm -R
else
    printf "${alertColor}NO! Be sure you running this script from proper place!${noColor}\n"
    exit 0
fi


declare -a dirs=("gtk-3.0" "i3" "picom" "rofi" "xfce4" "huiGovno")
dirsCount=${#dirs[@]}
for (( i=0; i<dirsCount; i++ ))
do
    if [ -d ~/.config/${dirs[$i]} ]; then
        printf '%b%.32s%s%b\n' "${okColor}" "${dirs[$i]}.................................." "done!" "${noColor}";
        cp -r ~/.config/${dirs[$i]} .
    else
        printf '%b%.27s%s%b\n' "${alertColor}" "${dirs[$i]}............................." "not found!" "${noColor}";
    fi
done
#######find -mindepth 1 -maxdepth 1 -type d -not -path '*/.*' -print0 | xargs -r0 rm -R1
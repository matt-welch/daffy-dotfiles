#!/bin/bash
# found on https://askubuntu.com/questions/558280/changing-colour-of-text-and-background-of-terminal
for((i=16; i<256; i++)); do
    printf "\e[48;5;${i}m%03d" $i;
    printf '\e[0m';
    [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
done

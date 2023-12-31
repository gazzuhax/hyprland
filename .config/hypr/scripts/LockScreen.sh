#!/bin/bash
swaylock  \
       --screenshots \
       --clock \
       --timestr %T \
       --datestr %a, %x \
       --indicator \
       --indicator-radius 200 \
       --indicator-thickness 7 \
       --effect-blur 7x5 \
       --effect-vignette 0.5:0.1 \
       --ring-color 3b4252 \
       --key-hl-color 880033 \
       --line-color 00000000 \
       --inside-color 00000088 \
       --separator-color 00000000 \
       --grace 2 \
       --fade-in 0.1

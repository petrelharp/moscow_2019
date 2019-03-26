#!/bin/bash

FIGS="$(grep "\!\[" moscow-march-2019.md  | sed -e 's/.*(//' | sed -e 's/).*//')"
for x in $FIGS
do 
    if [ -e $x ]
    then
        echo "."
    else
        echo $x
    fi
done

# for x in $(./missing-figs.sh | grep auran); do cp /home/peter/teaching/talks/madison-sept-2018/$x $(dirname $x); done

# for x in $(./missing-figs.sh | grep "figs.tortoise"); do cp /home/peter/teaching/talks/evolution-jun-2016/files/$(basename $x) $(dirname $x); done

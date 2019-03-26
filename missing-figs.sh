#!/bin/bash

FIGS="$(grep "\!\[" moscow-march-2019.md  | sed -e 's/.*(//' | sed -e 's/).*//')"
MISSING=""

for x in $FIGS
do 
    if [ -e $x ]
    then
        echo "."
    elif [ -e ${x%png}.pdf ]
    then
        echo "making $x"
        make $x
    else
        MISSING="$MISSING $x"
        echo $x
    fi
done


for x in $(echo $MISSING)
do 
    if [ -e /home/peter/teaching/talks/madison-sept-2018/$x ]
    then
        mkdir -p $(dirname $x)
        cp /home/peter/teaching/talks/madison-sept-2018/$x $(dirname $x) 
    fi
done

for x in $(echo $MISSING)
do 
    if [ -e /home/peter/teaching/talks/evolution-jun-2016/files/$(basename $x) ]
    then
        mkdir -p $(dirname $x)
        cp /home/peter/teaching/talks/evolution-jun-2016/files/$(basename $x) $(dirname $x)
    fi
done

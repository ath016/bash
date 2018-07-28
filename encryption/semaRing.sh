#!/bin/bash

alph=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
sem1=(0 0 0 0 0 0 0 1 1 4 1 1 1 1 2 2 2 2 2 3 3 4 5 5 3 6)
sem2=(1 2 3 4 5 6 7 1 2 2 3 4 5 6 1 2 3 4 5 1 2 3 1 2 3 1)
current=0

function num () {
        n=0
        for i in {0..25}
        do
                if [ $1 == ${alph[$i]} ]
                then
                        n=$i
                fi
        done
}

echo -n "enter your message: "
read msg
echo -n "your encrypted message: "

len=${#msg}
x=0

while [ $x -lt $len ]
do
	if [ ! ${msg:x:1} == " " ]
	then
        	num ${msg:x:1}
                
		echo -n +
	        mov=$((${sem1[$n]} - $current))
		mov=$(($mov + 8))
		mov=$(($mov % 8))

		current=$(($current + $mov))
		current=$(($current % 8))
		echo -n $mov
		
		echo -n +
		mov=${sem2[n]}
		current=$(($current + $mov))
		current=$(($current % 8))
		echo -n $mov
	else
		current=0
		echo -n " "
	fi

	x=`expr $x + 1`
done
echo " "

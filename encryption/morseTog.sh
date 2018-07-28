#!/bin/bash

alph=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
tich=(01 1100 1111 110 0 0011 101 0000 00 0100 111 0110 10 11 100 0101 1011 011 000 1 001 0001 010 1101 1110 0010)
te=(11 0100 0111 010 1 1011 001 1000 10 1100 011 1110 00 01 000 1101 0011 111 100 0 101 1001 110 0101 0110 1010)
update=(te tich tich tich tich tich tich tich tich te te tich te tich te tich te tich tich te te te te te te tich)
temp=tich

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


msg=" "$msg
len=${#msg}
x=0

while [ $x -lt $len ]
do
        if [ ! ${msg:x:1} == " " ]
        then
                num ${msg:x:1}

		if [ $temp == "tich" ]
		then
			echo -n ${tich[n]}
			echo -n " "

			temp=${update[n]}
		else
			echo -n ${te[n]}
			echo -n " "

			temp=${update[n]}
		fi
        else
		echo " "
		echo -n $temp
                echo -n " "
        fi
        x=`expr $x + 1`
done
echo " "

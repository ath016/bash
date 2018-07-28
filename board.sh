#!/bin/bash

count=$1

while [ $count -gt 0 ]
do
	if [ `expr $count % 2` -eq 0 ]
	then
		row1="0"$row1
		row2="1"$row2
	else
		row1="1"$row1
		row2="0"$row2
	fi

	count=`expr $count - 1`
done

count=`expr $1 / 2`

while [ $count -gt 0 ]
do
	echo $row1
	echo $row2
	count=`expr $count - 1`
done

if [ `expr $1 % 2` -eq 1 ]
then
	echo $row1
fi

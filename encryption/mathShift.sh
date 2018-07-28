#!/bin/bash

function char () {
	case "$1" in
		" ")
			i=" "
			;;
		a)
			i=1
			;;
                b)
                        i=2
                        ;;
                c)
                        i=3
                        ;;
                d)
                        i=4
                        ;;
                e)
                        i=5
                        ;;
                f)
                        i=6
                        ;;
                g)
                        i=7
                        ;;
                h)
                        i=8
                        ;;
                i)
                        i=9
                        ;;
                j)
                        i=10
                        ;;
                k)
                        i=11
                        ;;
                l)
                        i=12
                        ;;
                m)
                        i=13
                        ;;
                n)
                        i=14
                        ;;
                o)
                        i=15
                        ;;
                p)
                        i=16
                        ;;
                q)
                        i=17
                        ;;
                r)
                        i=18
                        ;;
                s)
                        i=19
                        ;;
                t)
                        i=20
                        ;;
                u)
                        i=21
                        ;;
                v)
                        i=22
                        ;;
                w)
                        i=23
                        ;;
                x)
                        i=24
                        ;;
                y)
                        i=25
                        ;;
                z)
                        i=26
                        ;;
	esac
}

echo -n "enter your message: "
read msg
echo -n "your encrypted message: "


msg=" $msg"
len=`expr ${#msg} - 1`
x=0
y=1
z=" "

while [ $x -lt $len ]
do
	char ${msg:$x:1}
	this=$i
	char ${msg:$y:1}
	next=$i

	s=${msg:$x:1}
	t=${msg:$y:1}

	if [ "$s" == " " ] && [ ! "$t" == " " ]
	then
		echo -n " "
		echo -n $next
	fi

        if [ ! "$s" == " " ] && [ ! "$t" == " " ]
        then
		echo -n +
                echo -n $((($next - $this + 26) % 26))
        fi

	x=`expr $x + 1`
	y=`expr $y + 1`
done
echo $z

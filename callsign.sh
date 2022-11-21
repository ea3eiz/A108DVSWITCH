#!/bin/bash
cd /home/pi/MMDVMHost

var=$(tail -1 MMDVM-2022-11-21.log)

var=$(echo "$var" | tr -d '[[:space:]]')

var=`expr substr $var 70 6`

sudo sed -i "1c $var" /home/pi/MMDVMHost/HOLA.txt

xterm -geometry 7x+652+134 -bg black -fg white -fa ‘verdana’ -fs 19x -T ACTUALIZANDO_IMAGEN -e tail -f /home/pi/MMDVMHost/HOLA.txt


#!/bin/bash
cd /home/pi/MMDVMHost
tail -1 MMDVM-2022-11-21.log > /home/pi/MMDVMHost/INDICATIVO.txt

var=$(awk "NR==1" /home/pi/MMDVMHost/INDICATIVO.txt)
var=`expr substr $var 65 6`
sed -i "1c $var" /home/pi/MMDVMHost/HOLA.txt

xterm -geometry 76x11+652+134 -bg black -fg white -fa ‘verdana’ -fs 19x -T ACTUALIZANDO_IMAGEN -e tail -f INDICATIVO.txt


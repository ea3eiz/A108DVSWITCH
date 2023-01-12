#!/bin/bash
#mode=`grep -n -m 1 "^UARTPort=" /home/pi/MMDVMHost/MMDVMBM.ini`
#buscar=":"
#caracteres=`expr index $mode $buscar`
#caracteres_linea=`expr $caracteres - 1`
#numero_linea_port=`expr substr $mode 1 $caracteres_linea`
#mode=$(awk "NR==$numero_linea_port" /home/pi/MMDVMHost/MMDVMBM.ini)
#puerto=`expr substr $mode 15 14`
#puerto="  "$puerto
#cd /home/pi/Desktop
#sudo cp RXF_BM.desktop /home/pi
#
#frecuencia=$(awk "NR==13" /home/pi/MMDVMHost/MMDVMBM.ini)
#frecuencia=`expr substr $frecuencia 13 17`
#frecuencia=$frecuencia$puerto
#sed -i "12c Name=$frecuencia" /home/pi/RXF_BM.desktop
#
#sudo cp /home/pi/RXF_BM.desktop /home/pi/Desktop
#
#sudo rm /home/pi/RXF_BM.desktop
#
##Escribe en el fichero INFO_RXF para poner los datos en el icono INFO TXF 
#sed -i "1c $frecuencia" /home/pi/INFO_RXF
#
SCRIPTS_version=$(awk "NR==1" /home/pi/.config/autostart/version)
cd /home/pi/Desktop
sudo cp Abrir_BlueDV.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sudo sh cerrar_dump1090.sh'" /home/pi/Abrir_BlueDV.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AVION_ON.png" /home/pi/Abrir_BlueDV.desktop
sed -i "10c Name[es_ES]=Cerrar Dump1090" /home/pi/Abrir_BlueDV.desktop
#sed -i "7c MMDVMBM=ON" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_BlueDV.desktop /home/pi/Desktop
#
sudo rm /home/pi/Abrir_BlueDV.desktop
#

cd /home/pi/dump1090

puerto=$(awk "NR==42" /home/pi/status.ini)
ppm=$(awk "NR==44" /home/pi/status.ini)

net-ro-port $puerto
stick=$(awk "NR==40" /home/pi/status.ini)
if [ "$stick" = 'RSP1' ];then
xterm -geometry 88x17+22+0 -bg brown -fg white -fa ‘verdana’ -fs 9x -T DUMP1090 -e sudo ./dump1090 --enable-agc --net --interactive --dev-sdrplay --net-ro-port $puerto --ppm $ppm 
else
xterm -geometry 88x17+22+0 -bg brown -fg white -fa ‘verdana’ -fs 9x -T DUMP1090 -e sudo ./dump1090 --enable-agc --net --interactive --net-ro-port $puerto --ppm $ppm
fi













cd /home/pi/Desktop
sudo cp Abrir_BlueDV.desktop /home/pi
sed -i "4c Exec=sh -c 'cd /home/pi/$SCRIPTS_version; sh ejecutar_dump1090.sh'" /home/pi/Abrir_BlueDV.desktop
sed -i "5c Icon=/home/pi/$SCRIPTS_version/ICONO_AVION_OFF.png" /home/pi/Abrir_BlueDV.desktop
sed -i "10c Name[es_ES]=Abrir Dump1090" /home/pi/Abrir_BlueDV.desktop
#sed -i "7c MMDVMBM=OFF" /home/pi/status.ini
cd /home/pi
sudo cp Abrir_BlueDV.desktop /home/pi/Desktop
sleep 1
sudo rm /home/pi/Abrir_BlueDV.desktop
#!/bin/bash

                        #cd /home/pi
                        #sudo rm -R A108
                        #git clone http://github.com/ea3eiz/A108NEW
                        #sleep 1
                        #mv A108NEW A108
                        #sleep 1
                        #sudo chmod 777 -R A108
                        #cd /home/pi/A108
                        #./qt_imagen_actualizada

                        

                        cd /home/pi/.local
                        sudo rm -R A108
                        git clone http://github.com/ea3eiz/A108
                        sleep 2
                        if [ -f /home/pi/.local/A108/aviso ]
                        then
                        sudo rm -R /home/pi/A108
                        cp -R /home/pi/.local/A108 /home/pi
                        cd /home/pi
                        sudo chmod 777 -R A108
                        cd /home/pi/.local
                        sudo rm -R A108
                        else
                        clear
                        echo "${VERDE}"
                        echo "***********************************"
                        echo -n "${ROJO}"
                        echo "           ERROR DE RED            "
                        echo -n "${VERDE}"
                        echo "***********************************"
                        sudo rm -R /home/pi/.local/A108
                        echo "${GRIS}"
                        sleep 5
                        exit
                        fi





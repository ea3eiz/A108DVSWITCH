#!/bin/bash

                        cd /home/pi
                        sudo rm -R A108
                        git clone http://github.com/ea3eiz/A108DVSWITCH
                        sleep 1
                        mv A108DVSWITCH A108
                        sleep 1
                        sudo chmod 777 -R A108
                        cd /home/pi/A108
                        ./qt_imagen_actualizada
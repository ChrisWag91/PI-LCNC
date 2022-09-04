#!/bin/bash

curl -O https://raw.githubusercontent.com/ChrisWag91/rpi_level_shifter_hat/master/Examples/enable_rpi_logic_level_shifter.py
sudo mkdir /usr/share/pi-lcnc/
sudo mv enable_rpi_logic_level_shifter.py /usr/share/pi-lcnc/enable_rpi_logic_level_shifter.py

if ! grep -q "python /usr/share/pi-lcnc/enable_rpi_logic_level_shifter.py &" /etc/rc.local; then
  	# find last occorence of exit 0 an get line nr 
	NR=$(grep "exit 0" /etc/rc.local -n | tail -1 | cut -d : -f 1)
	# insert to /etc/rc.local
	sudo sed -i "$NR i python /usr/share/pi-lcnc/enable_rpi_logic_level_shifter.py &" /etc/rc.local
fi

curl -O https://raw.githubusercontent.com/ChrisWag91/PI-LCNC/master/utility/stepconf_patch/build_HAL_2_8.py
#Default file for lcnc 2.8
#curl -O https://raw.githubusercontent.com/LinuxCNC/linuxcnc/master/src/emc/usr_intf/stepconf/build_HAL.py
sudo mv build_HAL_2_8.py /usr/lib/python2.7/dist-packages/stepconf/build_HAL.py

curl -O https://raw.githubusercontent.com/ChrisWag91/PI-LCNC/master/utility/stepconf_patch/stepconf_2_8.py
#Default file for lcnc 2.8
#curl -O https://raw.githubusercontent.com/LinuxCNC/linuxcnc/2.8/src/emc/usr_intf/stepconf/stepconf.py
sudo mv stepconf_2_8.py /usr/lib/python2.7/dist-packages/stepconf/stepconf.py
# Gmoccapy modification for 1024x600 touch screen

THIS PROJECT IS WORK IN PROGRESS.
USE AT YOUR OWN RISK.

This folder contains modified UI files in order to run Gmoccapy with a small touch screen.

## Installation
- Set the resolution (only needed if not automatically detected):
    edit /boot/config.txt:
    
    ```console
    sudo nano /boot/config.txt
    ```
    change / add the following lines in the file:

    ```console
    hdmi_cvt=1024 600 60 6
    hdmi_group=2
    hdmi_mode=87
    hdmi_drive=2
    ```
- Copy the content of this folder to your Raspberry
- Execute deploy_tiny_gmoccapy.sh
    ```console
    cd /[Path to the folder you copied the files to]
    sudo chmod +x deploy_tiny_gmoccapy.sh
    sudo ./deploy_tiny_gmoccapy.sh
    ```
- You may need to change the DRO size parameter under "Settings - DRO - Size"

Result:

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Gmoccapy%20configuration%20files/small%20screen%20mod%201024x600/tiny_gmoccapy_screenshot.png?raw=true"
height="500" border="0" /></a>

 
# PI-LCNC

*THIS REPOSITORY IS WORK IN PROGRESS*

An open source project to use a Raspberry Pi 4 as a CNC controller using LinuxCNC.

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/F013_PI-LCNC.jpg?raw=true"
height="200" border="0" /></a>

You can find further information about the concept in this Youtube video:

<a href="https://youtu.be/qL530kJUmII
" target="_blank"><img src="http://img.youtube.com/vi/qL530kJUmII/0.jpg"
alt="Detailed Youtube Video" width="240" border="10" /></a>

It is designed to work combined with the [*RPI Levelshifter Hat*](https://github.com/ChrisWag91/rpi_level_shifter_hat) and a *CNC Breakout Board* with a parallel interface.

RPI 4 <==> [RPI Levelshifter Hat](https://github.com/ChrisWag91/rpi_level_shifter_hat) <==> PI-LCNC <==> [CNC-BOB (=Break out Board)](https://www.aliexpress.com/wholesale?catId=0&initiative_id=SB_20210102040047&SearchText=cnc+breakout+board+5+axis)

*Concept:*

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/F013_PI-LCNC_Concept.png?raw=true"
height="200" border="0" /></a>

This repository contains the manufacturing data for the PI-LCNC adapter PCB as well as configuration instructions and files for Linux CNC.

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/PI-F013_LCNC_Board_Assembled.jpg?raw=true"
height="200" border="0" /></a>


Make sure to check the steps given under *Usage & Setup*

## Features
- DC-DC Power Supply for Rapspberry Pi (Input Voltage 8-36V)
- Adapter for LPT connector
- Pin header for additional 5V signals from the Raspberry Pi

## Limitations
- 15000 Steps / s max due to Jitter of RPI

## Get PCB kits here:
Please contact me under christoph.wagner91@gmail.com if you want to bux a kit containing the PCBs and the hardware.

## Required Hardware
- 1pcs  Raspberry Pi 4 (4GB or 8GB)
- 1pcs  [RPI Levelshifter Hat](https://github.com/ChrisWag91/rpi_level_shifter_hat)
- 2pcs  40 Pin Header Female (20x2 Pins)
- 2pcs  40 Pin Header Male (20x2 Pins) (optionally 1)
- 3pcs  screw Terminal P= 5mm (optional)
- 8pcs  M2.5 x 12mm Standoffs
- 4pcs  M2.5 x 5mm Screws
- optional mounting bracket

## Usage

### Electrical Setup
1. Solder up the RPI Levelshifter Hat as shown here: https://github.com/ChrisWag91/rpi_level_shifter_hat 
2. Solder up the PI-LCNC board as shown aboth
3. Remove the retaining standoffs from the LPT connector on the PI-LCNC board
4. Attach Raspberry Pi to RPI Levelshifter Hat using Standoffs
5. Attach PI-LCNC on top to RPI Levelshifter Hat as shown here:

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/F013_RPI_Stack.png?raw=true"
height="200" border="0" /></a>

**Attention** Don’t attach the PI-LCNC Board directly to your Raspberry - It will short the 3.3V and 5V rails.

6. Plug the CNC-BOB into the LPT Connector on the PI-LCNC Board
    
    Remove the studs on the female LPT Connector in order to fit the Connector of the BOB directly.
    Alternatively a LPT Extension cable can be used.

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/F013_CNC_Controller_Assembly.jpg?raw=true"
height="200" border="0" /></a>

7. Wire the 5V output on PI-LCNC into the "PC5V" and "PCGND" on CNC-BOB
8. Wire the 8-36V input on PI-LCNC into the power supply of your machine

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/F013_CNC_Controller_Assembly_Wiring.jpg?raw=true"
height="200" border="0" /></a>

9. Wire the CNC-BOB into your Machine

### Software Setup
#### The easy way
1. Download a prepared Raspberry Os from [here](https://www.dropbox.com/sh/l94gdvck4vsez5p/AADse_YKg0QH7fYXPkOonCiGa?dl=0).
This image has the specific changes for the RPI-Levelshifter and for the PI-LCNC board already integrated. I ships with a 3 axis configuration for a cnc router.
2. Flash the image to an sd card
3. Change the .ini and .hal files according to your setup. (watch this space for further details)

#### The hard way
1. Flash realtime capable version of Raspberry Os onto an sd card.
You can download a precompiled RT-Raspberry Os with Linux CNC already pre installed from this link: 
http://www.linuxcnc.org/iso/
(use one of the -pi4 vaiants, tested with 2.8.0)

2. Now we need to automatically enable the RPI Level Shifter Hat on boot: 

    Copy the script "enable_rpi_logic_level_shifter.py" from [here](https://github.com/ChrisWag91/rpi_level_shifter_hat/tree/master/Examples) to a local directory on your raspberry and add it to the autostart file as follows:

    ```console	
    sudo nano /etc/rc.local
    ```

    Add the following line before "exit 0":

    ```console	
    python /[insert local path to the enable script]/enable_rpi_logic_level_shifter.py &
    ```

2. Generate a new machine configuration according to your hardware using the Stepconf wizard

    Make sure to choose **Use Gmoccapy Screen** in the tab Options
    This configuration will not start out of the Box, because it expects the parport hardware to be present.
    It should run as soon as the next step is done.

3. Change the pinout according to the [example hal and ini file](https://github.com/ChrisWag91/PI-LCNC/tree/master/Linux%20CNC%20mod%20files) found in this repository.

    I would advise to copy the files from this repo and change the machine parameters to fit your machine.
    The files need to be named to [Name of your machine].ini and [Name of your machine].hal.
    All references to "my-mill" in [Name of your machine].ini need to be changed to [Name of your machine].
    Make sure to backup the automatically generated files before replacing them, since you can copy the machine parameters from there to the new files.

4. Launch Linux-CNC

    You should end up with something like that:

    <a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Graphics/LCNC_Screeenshot.png?raw=true"
    height="200" border="0" /></a>

 
*******************************************************************************************************************************

## Warning
This design is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY. Without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

## License
<a href="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-nc.png
" target="_blank"><img src="https://mirrors.creativecommons.org/presskit/buttons/88x31/png/by-nc.png"
width="88" height="31" border="2" /></a>


License text: 
https://creativecommons.org/licenses/by-nc/3.0/

*******************************************************************************************************************************

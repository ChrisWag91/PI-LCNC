# HAL Configuration for common chinese breakout board

This HAL file is configured to work with boards like shown below:

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Linux CNC mod files/HAL_homing_switches/cnc-breakout-board.jpg?raw=true"
height="400" border="0" /></a>

Adaptation of these files according to the machine configuration will be necessary. This is just a starting point.

# Homing / Limit Switches

If you use the optocouplers on the breakout board (P12-P15) for limit / homing switches you need to add pullup resistors to the corresponding channels as shown below. The resistors can be added on the extension header of the PI-LCNC board.

<a target="_blank"><img src="https://github.com/ChrisWag91/PI-LCNC/blob/master/Linux CNC mod files/HAL_homing_switches/Pullup_Resistors_for_Homing_Limit_Sw.png?raw=true"
height="400" border="0" /></a>

Alternatively you can use the pins on the GPIO extension header directly for limit switches.



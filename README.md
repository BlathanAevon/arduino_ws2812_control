# arduino_ws2812_control
Desktop program on processing language for controlling ws2812 strip.

# Installation

1. Install [Arduino IDE](https://www.arduino.cc/en/software/)
2. Install [Processing IDE](https://processing.org/download/)
3. Install all additional components for your system (MacOS, Windows, Linux)
4. Open `Arduino IDE`
5. Open `Processing IDE`
6. Open main.pde in `Processing IDE`
7. Open stripModes.ino in `Arduino IDE`
8. Connect your `Arduino Board` to computer (I am using Arduino Micro)
9. Connect your `ws2812` strip to arduino, 5V to `VCC`, GND to `GND`, D+ to `2` (pin number 2 on the board)
10. Choose the right `COM PORT` in the `Arduino IDE`
11. Press `Upload`
12. Make sure that you set correct COM PORT in `main.pde` (differs for different OS)
13. Press `Run`


### You are set up! Now you should be able to control your LED strip with desktop app!

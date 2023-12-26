import processing.serial.*;
import controlP5.*;

ControlP5 cp5;
Serial serial;
int baud = 921600;
int lastSentTime = 0;

void setup() {
  size(800, 400);
  cp5 = new ControlP5(this);
  cp5.addColorWheel("c", 250, 10, 200).setRGB(color(128, 0, 255));

  cp5.addSlider("brt")
    .setPosition(600, 10)
    .setSize(20, 100)
    .setRange(0, 255)
    .setNumberOfTickMarks(255);

  // Adjust the serial port based on your setup
  // For example, on Windows, it might be "COM3"
  // On macOS, it might be "/dev/cu.usbmodem141101"
  // Adjust accordingly.
  serial = new Serial(this, "/dev/cu.usbmodem141101", baud);

  noStroke();
}

void draw() {
  background(50);
  fill(cp5.get(ColorWheel.class, "c").getRGB());
  rect(0, 240, width, 200);

  int r = (int) red(cp5.get(ColorWheel.class, "c").getRGB());
  int g = (int) green(cp5.get(ColorWheel.class, "c").getRGB());
  int b = (int) blue(cp5.get(ColorWheel.class, "c").getRGB());
  int brt = (int) cp5.get(Slider.class, "brt").getValue();

  // Concatenate RGB and brightness values into a single string
  String dataString = r + "," + g + "," + b + "," + brt + ";";

  serial.write(dataString);

}

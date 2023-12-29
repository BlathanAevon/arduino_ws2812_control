import processing.serial.*;
import controlP5.*;

ControlP5 cp5;
Serial serial;

int baud = 921600;
int lastSentTime = 0;

CheckBox checkbox;

void setup() {
  size(500, 250);
  cp5 = new ControlP5(this);
  cp5.addColorWheel("c", 0, 0, 200).setRGB(color(255, 255, 255)).setLabel("Color");

  cp5.setFont(createFont("Arial", 20));

  cp5.addSlider("brt")
    .setPosition(210, 50)
    .setSize(20, 150)
    .setRange(0, 236)
    .setNumberOfTickMarks(255)
    .setValue(236)
    .setLabel("Brightness");

  checkbox = cp5.addCheckBox("checkBox")
    .setPosition(210, 0)
    .setSize(40, 40)
    .setItemsPerRow(3)
    .setSpacingColumn(30)
    .setSpacingRow(20)
    .addItem("Follow Daytime", 0)
    .activate("checkBox")
    ;
    
  checkbox.activate(0);

  serial = new Serial(this, "/dev/cu.usbmodem141101", baud);

  noStroke();
};


void draw() {
  background(50);
  fill(cp5.get(ColorWheel.class, "c").getRGB());

  int r = (int) red(cp5.get(ColorWheel.class, "c").getRGB());
  int g = (int) green(cp5.get(ColorWheel.class, "c").getRGB());
  int b = (int) blue(cp5.get(ColorWheel.class, "c").getRGB());
  int brt = (int) cp5.get(Slider.class, "brt").getValue();

  //Check if the interval has passed since the last data sent
  int h = hour();

  if (int(checkbox.getArrayValue()[0]) == 1) {
    switch(h) {
    case 0:
      r = 0;
      g = 0;
      b = 50;
      brt = 50;
      break;
    case 1:
      r = 8;
      g = 52;
      b = 138;
      brt = 100;
      break;
    case 2:
      r = 21;
      g = 101;
      b = 192;
      brt = 130;
      break;
    case 3:
      r = 32;
      g = 119;
      b = 179;
      brt = 150;
      break;
    case 4:
      r = 64;
      g = 128;
      b = 128;
      brt = 170;
      break;
    case 5:
      r = 128;
      g =128;
      b = 0;
      brt = 190;
      break;
    case 6:
      r = 255;
      g =165;
      b = 0;
      brt = 210;
      break;
    case 7:
      r = 255;
      g =204;
      b = 51;
      brt = 220;
      break;
    case 8:
      r = 255;
      g =200;
      b = 102;
      brt = 230;
      break;
    case 9:
      r = 255;
      g =200;
      b = 200;
      brt = 236;
      break;
    case 10:
      r = 255;
      g =200;
      b = 255;
      brt = 236;
      break;
    case 11:
      r = 255;
      g =200;
      b = 255;
      brt = 236;
      break;
    case 12:
      r = 255;
      g =255;
      b = 255;
      brt = 236;
      break;
    case 13:
      r = 255;
      g =255;
      b = 255;
      brt = 236;
      break;
    case 14:
      r = 255;
      g =255;
      b = 255;
      brt = 236;
      break;
    case 15:
      r = 255;
      g =255;
      b = 255;
      brt = 236;
      break;
    case 16:
      r = 255;
      g =255;
      b = 255;
      brt = 236;
      break;
    case 17:
      r = 255;
      g =200;
      b = 200;
      brt = 230;
      break;
    case 18:
      r = 255;
      g =200;
      b = 51;
      brt = 210;
      break;
    case 19:
      r = 255;
      g =165;
      b = 0;
      brt = 190;
      break;
    case 20:
      r = 128;
      g =128;
      b = 0;
      brt = 170;
      break;
    case 21:
      r = 64;
      g = 119;
      b = 119;
      brt = 150;
      break;
    case 22:
      r = 32;
      g = 101;
      b = 168;
      brt = 130;
      break;
    case 23:
      r = 21;
      g = 52;
      b = 141;
      brt = 100;
      break;
    }
  }

  //Concatenate RGB and brightness values into a single string
  String dataString = r + "," + g + "," + b + "," + brt + ";";
  //Send the string over serial
  serial.write(dataString);
}

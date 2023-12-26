#include <microLED.h>

#define STRIP_PIN 2    // LED strip pin
#define NUM_LEDS 150    // Number of LEDs
#define COLOR_DEPTH 3  // 3 bytes per color (RGB)

microLED<NUM_LEDS, STRIP_PIN, MLED_NO_CLOCK, LED_WS2818, ORDER_GRB, CLI_AVER> strip;

void setup() {
  Serial.begin(921600);
  strip.setBrightness(255);  // Set maximum brightness

  strip.clear();
  strip.show();  // Update the LED strip
  delay(1);
}
int prev_r, prev_g, prev_b, prev_brt;

void loop() {
  String dataString = Serial.readStringUntil(';');

  int r, g, b, brt;

  sscanf(dataString.c_str(), "%d,%d,%d,%d", &r, &g, &b, &brt);

  if (r != prev_r || g != prev_g || b != prev_b) {
    strip.fill(mRGB(r, g, b));
    strip.show();

    prev_r = r;
    prev_g = g;
    prev_b = b;
  }

  if (brt != prev_brt) {
    strip.setBrightness(brt);  // Set brightness
    strip.show();

    prev_brt = brt;
  }
}

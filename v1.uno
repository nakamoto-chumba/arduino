#include <LiquidCrystal.h>
#include <NewPing.h>

// Define LCD pins
const int rs = 9, en = 8, d4 = 10, d5 = 11, d6 = 12, d7 = 13;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

// Define ultrasonic sensor pins
#define TRIGGER_PIN 7
#define ECHO_PIN 6
#define MAX_DISTANCE 200 // Maximum distance we want to sense (in centimeters). Maximum HC-SR04 range is 400cm.

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE); // Create a NewPing object

void setup() {
  Serial.begin(9600); // Initialize serial communication
  lcd.begin(16, 2); // Initialize the LCD
  //lcd.setContrast(50); // Set the initial contrast value to maximum (adjust as needed)
  lcd.print("Distance:"); // Print a message on the LCD
}

void loop() {
  delay(100); // Delay for stability
  
  Serial.println("testing...."); // Print a test message to Serial Monitor
  
  // Measure distance using the ultrasonic sensor
  unsigned int distance = sonar.ping_cm();
  
  // If the distance is greater than the maximum allowed distance, set it to the maximum distance
  if (distance > MAX_DISTANCE) {
    distance = MAX_DISTANCE;
  }
  
  // Clear the LCD
  lcd.clear();
  
  // Print distance on the LCD
  lcd.setCursor(0, 0); // Set cursor to the first row
  lcd.print("Distance:");
  lcd.setCursor(0, 1); // Set cursor to the second row
  lcd.print(distance); // Print distance in centimeters
  
  delay(500); // Delay before next measurement
}

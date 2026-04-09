#include <Arduino.h>

#define HOSE_VENT_PIN A1
#define DECOUPLER_PIN A2
#define ENABLE_CAMERAS_PIN A3
#define DUMP_PIN A4
#define ARM_DISARM_PIN A5
#define TANK_VENT_PIN A6
#define IGNITION_PIN A7
#define TARE_ROCKET A8
#define TARE_OXIDIZER A9
#define FEED_VALVE_PIN_LEFT A11
#define FEED_VALVE_PIN_RIGHT A12
#define ABORT_PIN 0


struct Switches {
  bool abort = false;

  uint8_t valve_feed_oxidizer = 1; // 0=lewo, 1=środek, 2=prawo
  bool valve_feed_pressurizer = false;

  bool valve_vent_oxidizer = false;
  bool valve_vent_pressurizer = false;

  bool decoupler_oxidizer = false;
  bool decoupler_pressurizer = false;

  bool tank_vent = false;
  bool ignition = false;
  bool arm_disarm = false;
  bool dump = false;
  bool enable_cameras = false;

  bool tare_rocket = false;
  bool tare_oxidizer = false;
  bool tare_pressurizer = false;
};
Switches structToSend;

const uint8_t pins[] = {
  A0, A1, A2, A3, A4, A5, A6, A7,
  A8, A9, A10, A11, A12, A13, A14, A15
};

const uint8_t numPins = sizeof(pins) / sizeof(pins[0]);

void setup() {
  for (uint8_t i = 0; i < numPins; i++) {
    pinMode(pins[i], INPUT_PULLUP);
  }
  Serial.begin(57600);
}

void readSwitchPins(Switches &switchesState) {
  
  if (digitalRead(FEED_VALVE_PIN_LEFT) == HIGH) switchesState.valve_feed_oxidizer = 0;
  else if (digitalRead(FEED_VALVE_PIN_RIGHT) == HIGH) switchesState.valve_feed_oxidizer = 1;
  else switchesState.valve_feed_oxidizer = 2;

  switchesState.decoupler_oxidizer = digitalRead(DECOUPLER_PIN) == LOW;
  switchesState.valve_vent_oxidizer = digitalRead(HOSE_VENT_PIN) == LOW;

  switchesState.tank_vent = digitalRead(TANK_VENT_PIN) == LOW;
  switchesState.ignition = digitalRead(IGNITION_PIN) == LOW;
  switchesState.arm_disarm = digitalRead(ARM_DISARM_PIN) == LOW;
  switchesState.abort = digitalRead(ABORT_PIN) == LOW;
  
  switchesState.dump = digitalRead(DUMP_PIN) == LOW;
  switchesState.enable_cameras = digitalRead(ENABLE_CAMERAS_PIN) == LOW;

  switchesState.tare_rocket = digitalRead(TARE_ROCKET) == LOW;
  switchesState.tare_oxidizer = digitalRead(TARE_OXIDIZER) == LOW;
}

uint16_t sendSwitchToDisplay(void) {
  uint16_t states = 0;

  states |= (structToSend.valve_feed_oxidizer & 0b11) << 0; 

  states |= structToSend.valve_vent_oxidizer << 2;
  states |= structToSend.decoupler_oxidizer << 3;

  states |= structToSend.valve_feed_pressurizer << 4;
  states |= structToSend.valve_vent_pressurizer << 5;
  states |= structToSend.decoupler_pressurizer << 6;

  states |= structToSend.arm_disarm << 7;
  states |= structToSend.tank_vent << 8;
  states |= structToSend.ignition << 9;
  states |= structToSend.abort << 10;
  states |= structToSend.dump << 11;
  states |= structToSend.enable_cameras << 12;

  states |= structToSend.tare_rocket << 13;
  states |= structToSend.tare_oxidizer << 14;
  states |= structToSend.tare_pressurizer << 15;

  return states;
}

void loop() {
    Switches newStruct;
    readSwitchPins(newStruct);
    structToSend = newStruct;
    Serial.println(sendSwitchToDisplay());

  delay(100);
}

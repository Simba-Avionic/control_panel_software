#include <Arduino.h>

#define DECOUPLER_PIN A10
#define FEED_VALVE_PIN A14
#define HOSE_VENT_PIN A8
#define TANK_VENT_PIN A5
#define IGNITION_PIN A3
#define ARM_DISARM_PIN A0
#define SWITCH_FEED_PIN A12
#define ABORT_PIN A4

#define TARE_ROCKET A13
#define TARE_OXIDIZER A11
#define TARE_PRESSURIZER A9

bool switchFeed = false;

struct Switches {
  // ground segment section
  bool valve_feed_oxidizer = false;
  bool valve_feed_pressurizer = false;

  bool valve_vent_oxidizer = false;
  bool valve_vent_pressurizer = false;

  bool decoupler_oxidizer = false;
  bool decoupler_pressurizer = false;

  // rocket section
  bool tank_vent = false;
  bool ignition = false;
  bool abort = false;
  bool arm_disarm = false;

  // load cells
  bool tare_rocket = false;
  bool tare_oxidizer = false;
  bool tare_pressurizer = false;
};
Switches structToSend;

const uint8_t analogPins[] = {
  A0, A1, A2, A3, A4, A5, A6, A7,
  A8, A9, A10, A11, A12, A13, A14, A15
};

const uint8_t numPins = sizeof(analogPins) / sizeof(analogPins[0]);

void setup() {
  pinMode(DECOUPLER_PIN, INPUT_PULLUP);
  pinMode(FEED_VALVE_PIN, INPUT_PULLUP);
  pinMode(HOSE_VENT_PIN, INPUT_PULLUP);
  pinMode(TANK_VENT_PIN, INPUT_PULLUP);
  pinMode(IGNITION_PIN, INPUT_PULLUP);
  pinMode(ARM_DISARM_PIN, INPUT_PULLUP);
  pinMode(SWITCH_FEED_PIN, INPUT_PULLUP);
  pinMode(ABORT_PIN, INPUT_PULLUP);

  for (uint8_t i = 0; i < numPins; i++) {
    pinMode(analogPins[i], INPUT_PULLUP);
  }

  Serial.begin(57600);
}

void readSwitchPins(Switches &switchesState) {
  switchFeed = digitalRead(SWITCH_FEED_PIN) == LOW;

  // pressurizer valves
  if (switchFeed) {
    switchesState.decoupler_pressurizer = digitalRead(DECOUPLER_PIN) == LOW;
    switchesState.valve_feed_pressurizer = digitalRead(FEED_VALVE_PIN) == LOW;
    switchesState.valve_vent_pressurizer = digitalRead(HOSE_VENT_PIN) == LOW;
  }
  // oxidizer valves
  else {
    switchesState.decoupler_oxidizer = digitalRead(DECOUPLER_PIN) == LOW;
    switchesState.valve_feed_oxidizer = digitalRead(FEED_VALVE_PIN) == LOW;
    switchesState.valve_vent_oxidizer = digitalRead(HOSE_VENT_PIN) == LOW;
  }

  switchesState.tank_vent = digitalRead(TANK_VENT_PIN) == LOW;
  switchesState.ignition = digitalRead(IGNITION_PIN) == LOW;
  switchesState.arm_disarm = digitalRead(ARM_DISARM_PIN) == LOW;
  switchesState.abort = digitalRead(ABORT_PIN) == LOW;

  switchesState.tare_rocket = digitalRead(TARE_ROCKET) == LOW;
  switchesState.tare_oxidizer = digitalRead(TARE_OXIDIZER) == LOW;
  switchesState.tare_pressurizer = digitalRead(TARE_PRESSURIZER) == LOW;
}

uint16_t sendSwitchToDisplay(void) {
  uint16_t states = 0;

  states |= structToSend.valve_feed_oxidizer << 0;
  states |= structToSend.valve_vent_oxidizer << 1;
  states |= structToSend.decoupler_oxidizer << 2;

  states |= structToSend.valve_feed_pressurizer << 3;
  states |= structToSend.valve_vent_pressurizer << 4;
  states |= structToSend.decoupler_pressurizer << 5;

  states |= structToSend.arm_disarm << 6;
  states |= structToSend.tank_vent << 7;
  states |= structToSend.ignition << 8;
  states |= structToSend.abort << 9;

  states |= structToSend.tare_rocket << 10;
  states |= structToSend.tare_oxidizer << 11;
  states |= structToSend.tare_pressurizer << 12;

  return states;
}

void loop() {
    Switches newStruct;
    readSwitchPins(newStruct);
    structToSend = newStruct;
    Serial.println(sendSwitchToDisplay());

//   for (uint8_t i = 0; i < numPins; i++) {
//     int value = !digitalRead(analogPins[i]);
//     Serial.print("A");
//     Serial.print(i);
//     Serial.print(": ");
//     Serial.print(value);
//     Serial.print("\t");
//   }
//   Serial.println();

  delay(100);
}

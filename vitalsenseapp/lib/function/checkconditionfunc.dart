import 'package:flutter/material.dart';
import 'package:vitalsenseapp/card/historycard.dart';

String checkcondition(String name, int value) {
  String condition = '';

  switch (name) {
    case 'Heart Rate':
      if (value >= 51 && value <= 90) {
        condition = 'Normal';
      } else if ((value >= 91 && value <= 130) ||
          (value >= 41 && value <= 50)) {
        condition = 'Warning';
      } else if (value <= 40 || value <= 131) {
        condition = 'Danger';
      }
      break;

    case 'SpO2':
      if (value >= 96) {
        condition = 'Normal';
      } else if (value >= 92 && value <= 95) {
        condition = 'Warning';
      } else if (value <= 91) {
        condition = 'Danger';
      }
      break;

    case 'Respiratory Rate':
      if (value >= 12 && value <= 20) {
        condition = 'Normal';
      } else if ((value >= 9 && value <= 11) || (value >= 21 && value <= 24)) {
        condition = 'Warning';
      } else if (value <= 8 || value >= 25) {
        condition = 'Danger';
      }
      break;

    case 'Skin Temperature':
      if (value >= 33 && value <= 38) {
        condition = 'Normal';
      } else if (value == 32 || (value >= 38 && value <= 39)) {
        condition = 'Warning';
      } else if (value < 32 || value > 39) {
        condition = 'Danger';
      }
      break;

    default:
      condition = 'null';
  }
  return condition;
}

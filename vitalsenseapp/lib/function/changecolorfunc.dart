import 'package:flutter/material.dart';

var colorlist = [
  const Color.fromRGBO(152, 201, 122, 1),
  const Color.fromRGBO(252, 200, 66, 1),
  const Color.fromRGBO(241, 66, 57, 1),
  const Color.fromRGBO(115, 169, 173, 1)
];

Color changeColor(String name, int value) {
  int color = 0;

  switch (name) {
    case 'Heart Rate':
      if (value >= 51 && value <= 90) {
        color = 0;
      } else if ((value >= 91 && value <= 130) ||
          (value >= 41 && value <= 50)) {
        color = 1;
      } else if (value <= 40 || value <= 131) {
        color = 2;
      }
      break;

    case 'SpO2':
      if (value >= 96) {
        color = 0;
      } else if (value >= 92 && value <= 95) {
        color = 1;
      } else if (value <= 91) {
        color = 2;
      }
      break;

    case 'Respiratory Rate':
      if (value >= 12 && value <= 20) {
        color = 0;
      } else if ((value >= 9 && value <= 11) || (value >= 21 && value <= 24)) {
        color = 1;
      } else if (value <= 8 || value >= 25) {
        color = 2;
      }
      break;

    case 'Skin Temperature':
      if (value >= 36 && value <= 38) {
        color = 0;
      } else if (value == 35 || value == 39) {
        color = 1;
      } else if (value < 35 || value > 39) {
        color = 2;
      }
      break;

    default:
      color = 3;
  }
  return colorlist[color];
}
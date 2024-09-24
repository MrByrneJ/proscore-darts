import 'package:flutter/material.dart';

import 'enums.dart';

const title = 'ProScore Darts';
const scoreBoxHeight = 80.0;

const primaryRed = Color.fromARGB(255, 208, 49, 37);
const secondaryRed = Color.fromARGB(255, 237, 143, 137);
const primaryGreen = Colors.green;
const secondaryGreen = Color.fromARGB(255, 121, 154, 122);
const primaryWhite = Color.fromARGB(255, 243, 243, 243);
const secondaryWhite = Color.fromARGB(255, 179, 179, 179);
const primaryGrey = Color.fromARGB(255, 74, 74, 74);
const primaryBlack = Color.fromARGB(255, 44, 44, 44);
const secondaryBlack = Color.fromARGB(255, 49, 49, 49);
const darkShadowColor = Color.fromARGB(185, 0, 0, 0);
const inactiveColor = Color.fromARGB(143, 185, 185, 185);
const highlightColor = Color.fromARGB(206, 145, 197, 147);

int getNewTurn({required int length, required int currentIndex}) =>
    currentIndex == length - 1 ? 0 : currentIndex + 1;

String getIcon(int hits) {
  if (hits > 2) return getScoreIcon(ScoreIcon.circleWithCross);
  if (hits > 1) return getScoreIcon(ScoreIcon.cross);
  if (hits > 0) return getScoreIcon(ScoreIcon.line);
  return '';
}

String getScoreIcon(ScoreIcon icon) {
  switch (icon) {
    case ScoreIcon.circleWithCross:
      return '\u29BB';
    case ScoreIcon.circleWithLine:
      return '\u2298';
    case ScoreIcon.circle:
      return '\u25EF';
    case ScoreIcon.cross:
      return '\u0058';
    case ScoreIcon.line:
      return '\u005C';
    case ScoreIcon.dash:
      return '\u2014';
  }
}

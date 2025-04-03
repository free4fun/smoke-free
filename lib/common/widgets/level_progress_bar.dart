import 'package:flutter/material.dart';
import 'package:no_more_smoke/common/colors.dart';

class LevelProgressBar extends StatelessWidget {
  final int currentLevel;

  const LevelProgressBar({super.key, required this.currentLevel});

  @override
  Widget build(BuildContext context) {
    Color color;
    double width;
    if (currentLevel < 10) {
      color = CustomColors.darkRed;
      width = 0.1;
    } else if (currentLevel < 20) {
      color = CustomColors.brightRed;
      width = 0.2;
    } else if (currentLevel < 30) {
      color = CustomColors.red;
      width = 0.3;
    } else if (currentLevel < 40) {
      color = CustomColors.vermilion;
      width = 0.4;
    } else if (currentLevel < 50) {
      color = CustomColors.orange;
      width = 0.5;
    } else if (currentLevel < 60) {
      color = CustomColors.yellow;
      width = 0.6;
    } else if (currentLevel < 70) {
      color = CustomColors.yellowGreen;
      width = 0.7;
    } else if (currentLevel < 80) {
      color = CustomColors.limeGreen;
      width = 0.8;
    } else if (currentLevel < 90) {
      color = CustomColors.greenYellow;
      width = 0.9;
    } else {
      color = CustomColors.primary;
      width = 1.0;
    }

    return LinearProgressIndicator(
      value: width,
      backgroundColor: color.withOpacity(0.2),
      valueColor: AlwaysStoppedAnimation<Color>(color),
      minHeight: 12,
    );
  }
}

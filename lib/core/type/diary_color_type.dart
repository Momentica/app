import 'package:flutter/material.dart';
import 'package:momentica/core/di/momentica_style.dart';

enum DiaryColorType {
  pink(
    color: MomenticaColor.pink20,
  ),
  red(
    color: MomenticaColor.red20,
  ),
  orange(
    color: MomenticaColor.orange20,
  ),
  yellow(
    color: MomenticaColor.yellow20,
  ),
  green(
    color: MomenticaColor.green20,
  ),
  blue(
    color: MomenticaColor.blue20,
  ),
  navy(
    color: MomenticaColor.navy20,
  ),
  purple(
    color: MomenticaColor.purple20,
  ),
  brown(
    color: MomenticaColor.brown20,
  ),
  grey(
    color: MomenticaColor.grey20,
  );

  final Color color;

  const DiaryColorType({
    required this.color,
  });
}

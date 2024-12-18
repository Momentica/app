import 'package:flutter/material.dart';

const wantedSans = "WantedSans";

class MomenticaTextStyle {
  MomenticaTextStyle._();

  static TextStyle title1({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 42,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.192,
    );
  }

  static TextStyle title2({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 32,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.193,
    );
  }

  static TextStyle title3({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 24,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.500,
    );
  }

  static TextStyle title4({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 20,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.195,
    );
  }

  static TextStyle title3Regular({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 24,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w400,
      decoration: decoration,
      decorationColor: color,
      height: 1.191,
    );
  }

  static TextStyle subTitle1({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 18,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.194,
    );
  }

  static TextStyle subTitle2({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 16,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.193,
    );
  }

  static TextStyle subTitle3({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 14,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.192,
    );
  }

  static TextStyle body1({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 14,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w500,
      decoration: decoration,
      decorationColor: color,
      height: 1.192,
    );
  }

  static TextStyle body2({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 12,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w500,
      decoration: decoration,
      decorationColor: color,
      height: 1.441,
    );
  }

  static TextStyle caption1({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 16,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w400,
      decoration: decoration,
      decorationColor: color,
      height: 1.193,
    );
  }

  static TextStyle caption2({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 14,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w400,
      decoration: decoration,
      decorationColor: color,
      height: 1.192,
    );
  }

  static TextStyle caption3({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 12,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w400,
      decoration: decoration,
      decorationColor: color,
      height: 1.275,
    );
  }

  static TextStyle label1({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 14,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w500,
      decoration: decoration,
      decorationColor: color,
      height: 1.192,
    );
  }

  static TextStyle label2({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 12,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w500,
      decoration: decoration,
      decorationColor: color,
      height: 1.191,
    );
  }

  static TextStyle button1({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 16,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.193,
    );
  }

  static TextStyle button2({
    required Color color,
    TextOverflow overflow = TextOverflow.visible,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color,
      overflow: overflow,
      fontSize: 12,
      fontFamily: wantedSans,
      fontWeight: FontWeight.w600,
      decoration: decoration,
      decorationColor: color,
      height: 1.191,
    );
  }
}

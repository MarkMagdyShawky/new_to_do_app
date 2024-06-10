// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'colorManager.dart';

class DarkTextManager extends StatelessWidget {
  final String text;
  final double fontSize;
  const DarkTextManager({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: MarkPrimaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}

class BrightTextManager extends StatelessWidget {
  final String text;
  final double fontSize;
  const BrightTextManager({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: MarkThirdColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}


class GoldTextManager extends StatelessWidget {
  final String text;
  final double fontSize;
  const GoldTextManager({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: MarkSecondaryColor,
          fontSize: fontSize,
          fontWeight: FontWeight.bold),
    );
  }
}

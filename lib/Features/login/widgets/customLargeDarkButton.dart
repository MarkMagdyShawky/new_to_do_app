
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/textManager.dart';

import '../../../core/resources/colorManager.dart';

class CustomLargeDarkButton extends StatelessWidget {
  final String btnName;
  final String nextPage;
  final VoidCallback? onPressed;

  CustomLargeDarkButton({required this.btnName, required this.nextPage, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 60, right: 60),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
          BoxShadow(
            color: MarkThirdColor.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
          ),
        ]),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: double.infinity,
          height: 60,
          color: MarkPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: BrightTextManager(text: btnName, fontSize: 20),
        ),
      ),
    );
  }
}

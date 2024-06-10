// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/stringManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

import '../../../core/resources/colorManager.dart';

class HomePageWelcome extends StatelessWidget {
  const HomePageWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: BrightTextManager(text: StringManager.OnboardingWelcome, fontSize: 22),
        ),
        SizedBox(
          height: 15,
        ),
        Center(
          child: BrightTextManager(text: StringManager.OnboardingStart, fontSize: 22),
        ),
      ],
    );
  }
}

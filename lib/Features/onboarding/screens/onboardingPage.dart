// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/Features/onboarding/widgets/customOnboradingImage.dart';
import 'package:to_do_app/Features/onboarding/widgets/homePageWelcome.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/imageManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

import '../widgets/customLargeButton.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});
  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MarkPrimaryColor,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: pageHeight,
                  child: Stack(
                    children: [
                      CustomOnboardingImage(
                        image: ImageManager.HomeBackground,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HomePageWelcome(),
                          SizedBox(height: 60),
                          CustomLargeButton(btnName: "Login", nextPage: "Login"),
                          SizedBox(height: 15),
                          Center(child: BrightTextManager(text: "OR", fontSize: 18)),
                          SizedBox(height: 15),
                          CustomLargeButton(btnName: "Sign UP", nextPage: "Signup"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

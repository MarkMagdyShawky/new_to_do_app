// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CustomTaskCard extends StatelessWidget {
  final String mainTitle;
  final String div;
  final double precentage;
  final String image;
  final String nextPage;

  const CustomTaskCard({
    super.key,
    required this.mainTitle,
    required this.div,
    required this.precentage,
    required this.image,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: MarkBackgroundColor,
      shadowColor: MarkPrimaryColor,
      elevation: 7,
      surfaceTintColor: MarkBackgroundColor,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Column(
          children: [
            SizedBox(height: 5),
            SvgPicture.asset(
              image,
              height: 40,
              width: 40,
            ),
            SizedBox(height: 7),
            Text(
              mainTitle,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MarkPrimaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 7),
            Text(
              div,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MarkPrimaryColor),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            //Linear Indicator
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: 125,
              barRadius: Radius.circular(30),
              animation: true,
              lineHeight: 20.0,
              animationDuration: 2000,
              percent: precentage,
              progressColor: MarkSecondaryColor,
            ),
          ],
        ),
        onTap: () {
          Navigator.of(context).pushNamed(nextPage);
        },
      ),
    );
  }
}

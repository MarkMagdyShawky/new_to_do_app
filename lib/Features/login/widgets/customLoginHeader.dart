// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomLoginHeader extends StatelessWidget {
  late final String pageTitle;
  late final String subtitle;
  late final String imageLocation;

  CustomLoginHeader({
    super.key,
    required this.pageTitle,
    required this.imageLocation,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DarkTextManager(text: pageTitle, fontSize: 35),
        SvgPicture.asset(
          imageLocation,
          width: 400,
          height: 350,
        ),
        SizedBox(
          height: 10,
        ),
        DarkTextManager(text: subtitle, fontSize: 18),
      ],
    );
  }
}

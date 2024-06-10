import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomOnboardingImage extends StatelessWidget {
  final String image;
  const CustomOnboardingImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      fit: BoxFit.cover,
    );
  }
}

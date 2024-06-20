import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/core/resources/imageManager.dart';

class CustomGoogleBtn extends StatelessWidget {
  final VoidCallback? signInWithGoogle;

  const CustomGoogleBtn({super.key, this.signInWithGoogle});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: signInWithGoogle,
      color: Color.fromARGB(255, 255, 118, 108),
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      height: 30,
      minWidth: 255,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Continue With Google ",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          SvgPicture.asset(
            ImageManager.googleImage,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }
}

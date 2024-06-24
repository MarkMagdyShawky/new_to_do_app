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
      color: Color.fromARGB(255, 255, 78, 66),
      height: 55,
      minWidth: 270,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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

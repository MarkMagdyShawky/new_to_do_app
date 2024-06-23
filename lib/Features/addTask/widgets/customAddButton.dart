import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomAddButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomAddButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40, right: 40),
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
          child: BrightTextManager(text: "Add Task", fontSize: 18),
        ),
      ),
    );
  }
}

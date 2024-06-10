
import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/textManager.dart';

import '../../../core/resources/colorManager.dart';

class CustomLargeButton extends StatelessWidget {
  final String btnName;
  final String nextPage;
  CustomLargeButton({required this.btnName, required this.nextPage});

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
          onPressed: () {
            Navigator.of(context).pushNamed(nextPage);
          },
          minWidth: double.infinity,
          height: 60,
          color: MarkThirdColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          child: DarkTextManager(text: btnName, fontSize: 20),
        ),
      ),
    );
  }
}

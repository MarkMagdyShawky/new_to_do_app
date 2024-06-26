// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomLoginFooter extends StatelessWidget {
  final String question;
  final String nextPage;
  final String btnName;
  CustomLoginFooter({
    super.key,
    required this.question,
    required this.nextPage,
    required this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DarkTextManager(text: question, fontSize: 22),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushNamed(nextPage);
          },
          child: GoldTextManager(text: btnName, fontSize: 21),
        ),
      ],
    );
  }
}

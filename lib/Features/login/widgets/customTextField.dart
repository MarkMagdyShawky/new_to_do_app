// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../core/resources/colorManager.dart';

class CustomTextField extends StatelessWidget {
  final String textName;
  final TextEditingController controllerName;
  final String hintName;
  final FocusNode focusNode;
  final IconData iconss;

  const CustomTextField({
    super.key,
    required this.textName,
    required this.controllerName,
    required this.hintName,
    required this.focusNode,
    required this.iconss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        key: key,
        focusNode: focusNode,
        controller: controllerName,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your $textName';
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: hintName,
            prefixIcon: Icon(
              iconss,
              color: focusNode.hasFocus ? MarkSecondaryColor : MarkPrimaryColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: MarkPrimaryColor.withAlpha(50),
            filled: true,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: MarkSecondaryColor, width: 2.0))),
      ),
    );
  }
}

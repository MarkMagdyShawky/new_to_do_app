import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomTextFiled extends StatelessWidget {
  final TextEditingController taskNameController;
  final int maxLiens;
  final String fieldName;

  const CustomTextFiled({
    super.key,
    required this.taskNameController,
    required this.maxLiens,
    required this.fieldName,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: taskNameController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $fieldName';
        }
        return null;
      },
      maxLines: maxLiens,
      decoration: InputDecoration(
        hintText: fieldName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: MarkPrimaryColor),
        ),
        fillColor: MarkPrimaryColor.withAlpha(50),
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: MarkSecondaryColor, width: 2.0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomListTitle extends StatelessWidget {
  final VoidCallback? handleCheckboxChange;
  final bool isChecked;
  final String taskName;
  final String description;
  final VoidCallback? onPressed;
  const CustomListTitle({
    super.key,
    required this.handleCheckboxChange,
    required this.isChecked,
    required this.taskName,
    required this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MarkBackgroundColor,
        border: Border.all(color: Mark4Color.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: MarkSecondaryColor.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: GoldTextManager(text: taskName, fontSize: 18),
        subtitle: Text(description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                if (handleCheckboxChange != null) {
                  handleCheckboxChange!();
                }
              },
              activeColor: MarkPrimaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.close,
              ),
              color: MarkPrimaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

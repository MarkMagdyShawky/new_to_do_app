import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomListTitleForFinishedTasks extends StatelessWidget {
  final VoidCallback? handleCheckboxChange;
  final bool isChecked;
  final String taskName;
  final String description;
  final String parentCollection;
  final VoidCallback? onPressed;

  const CustomListTitleForFinishedTasks(
      {super.key,
      required this.handleCheckboxChange,
      required this.isChecked,
      required this.taskName,
      required this.description,
      required this.parentCollection,
      required this.onPressed,
      required});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 254, 231),
        border: Border.all(color: MarkPrimaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          //Left part:
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DarkTextManager(text: taskName, fontSize: 18),
                Text(
                  description,
                ),
              ],
            ),
          ),
          //Right part:

          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: <Widget>[
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
              GoldTextManager(text: parentCollection, fontSize: 14)
            ],
          )
        ],
      ),
    );
  }
}

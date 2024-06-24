import 'package:flutter/material.dart';
import 'package:to_do_app/Features/addTask/screens/addTaskPage.dart';
import 'package:to_do_app/core/resources/colorManager.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String collectionName;
  const CustomFloatingActionButton({super.key, required this.collectionName});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddTaskPage(collectionName: collectionName),
          ),
        );
      },
      backgroundColor: MarkPrimaryColor,
      child: Icon(
        Icons.add,
        color: MarkBackgroundColor,
        size: 30,
      ),
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(40)),
      elevation: 3,
    );
  }
}

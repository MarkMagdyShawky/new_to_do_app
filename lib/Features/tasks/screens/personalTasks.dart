import 'package:flutter/material.dart';
import 'package:to_do_app/Features/addTask/screens/addTaskPage.dart';
import 'package:to_do_app/core/resources/MarkDrawer.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class PersonalTasks extends StatefulWidget {
  const PersonalTasks({super.key});

  @override
  State<PersonalTasks> createState() => _PersonalTasksState();
}

class _PersonalTasksState extends State<PersonalTasks> {
  bool _isChecked = false;
  void _handleCheckboxChange(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarkBackgroundColor,
      endDrawerEnableOpenDragGesture: true,
      drawerScrimColor: MarkPrimaryColor.withOpacity(0.2),
      appBar: AppBar(
        title: DarkTextManager(
          text: "Personal Taskes",
          fontSize: 25,
        ),
        centerTitle: true,
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: MarkPrimaryColor, weight: 600, size: 30),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskPage(collectionName: "PersonalTasks"),
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
      ),
      drawer: MarkDrawer(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: MarkBackgroundColor,
                border: Border.all(color: Mark4Color.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: MarkSecondaryColor.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: GoldTextManager(text: "Task 1", fontSize: 18),
                subtitle: Text("ijwiuohgjftft ghcgcytc hvkuyv hjvhvvvvvvvvvvvvhjgvvvvvvvvvvv hv"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: _handleCheckboxChange,
                      activeColor: MarkPrimaryColor,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                      ),
                      color: MarkPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

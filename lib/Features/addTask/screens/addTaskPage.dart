import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/addTask/widgets/customAddButton.dart';
import 'package:to_do_app/Features/addTask/widgets/customTextField.dart';
import 'package:to_do_app/Features/singup/widgets/customAwesomeDialog.dart';
import 'package:to_do_app/Features/tasks/screens/tasksPage.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class AddTaskPage extends StatefulWidget {
  final String collectionName;
  const AddTaskPage({super.key, required this.collectionName});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController taskName = TextEditingController();
  TextEditingController taskDescription = TextEditingController();
  bool isChecked = false;
  late CollectionReference personalTasks;
  void initState() {
    super.initState();
    personalTasks = FirebaseFirestore.instance.collection(widget.collectionName);
  }

  addTask() async {
    if (formState.currentState!.validate()) {
      try {
        DocumentReference response = await personalTasks.add({
          "taskName": taskName.text,
          "taskDescription": taskDescription.text,
          "isChecked": isChecked,
          "timestamp": FieldValue.serverTimestamp(),
        });
        showSuccessDialog(context);
        print("Task added with ID: ${response.id}");
      } catch (e) {
        print("Error adding task: $e");
        CustomAwesomeDialog().showErrorDialog(
          context,
          "Failed to Add Task",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DarkTextManager(text: "Add Task", fontSize: 20),
        centerTitle: true,
        toolbarHeight: 80,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
                key: formState,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    CustomTextFiled(
                      taskNameController: taskName,
                      maxLiens: 1,
                      fieldName: "Task Name",
                    ),
                    SizedBox(height: 30),
                    CustomTextFiled(
                      taskNameController: taskDescription,
                      maxLiens: 5,
                      fieldName: "Description",
                    ),
                    SizedBox(height: 60),
                    CustomAddButton(
                      onPressed: () {
                        addTask();
                      },
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void showSuccessDialog(BuildContext context) async {
    return AwesomeDialog(
      btnOkIcon: CupertinoIcons.airplane,
      showCloseIcon: true,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Success',
      desc: "Task Added Successfully",
      btnOkOnPress: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TasksPage(collectionName: widget.collectionName, currentPageName: widget.collectionName),
          ),
        );
      },
    ).show();
  }
}

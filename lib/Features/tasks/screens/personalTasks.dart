import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/addTask/screens/addTaskPage.dart';
import 'package:to_do_app/Features/tasks/widgets/customFloatingActionButton.dart';
import 'package:to_do_app/Features/tasks/widgets/customListTitleWidget.dart';
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

  void _handleCheckboxChange() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  List<QueryDocumentSnapshot> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("PersonalTasks").get();
    setState(() {
      data = querySnapshot.docs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MarkBackgroundColor,
      endDrawerEnableOpenDragGesture: true,
      drawerScrimColor: MarkPrimaryColor.withOpacity(0.2),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MarkBackgroundColor,
        title: DarkTextManager(
          text: "Personal Tasks",
          fontSize: 25,
        ),
        centerTitle: true,
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: MarkPrimaryColor, weight: 600, size: 30),
      ),
      floatingActionButton: CustomFloatingActionButton(collectionName: "PersonalTasks"),
      drawer: MarkDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 30,
          ),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return CustomListTitle(
              handleCheckboxChange: _handleCheckboxChange,
              isChecked: _isChecked,
              taskName: data[i]["taskName"],
              description: data[i]["taskDescription"],
            );
          },
        ),
      ),
    );
  }
}

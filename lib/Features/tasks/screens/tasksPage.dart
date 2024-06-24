import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/tasks/widgets/customFloatingActionButton.dart';
import 'package:to_do_app/Features/tasks/widgets/customListTitleWidget.dart';
import 'package:to_do_app/core/resources/MarkDrawer.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class TasksPage extends StatefulWidget {
  final String collectionName;
  final String currentPageName;
  const TasksPage({super.key, required this.collectionName, required this.currentPageName});

  @override
  State<TasksPage> createState() => _TasksPage();
}

class _TasksPage extends State<TasksPage> {
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
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(widget.collectionName).get();
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
          text: widget.currentPageName,
          fontSize: 25,
        ),
        centerTitle: true,
        toolbarHeight: 80,
        iconTheme: IconThemeData(color: MarkPrimaryColor, weight: 600, size: 30),
      ),
      floatingActionButton: CustomFloatingActionButton(collectionName: widget.collectionName),
      drawer: MarkDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: data.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
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
                    onPressed: () {
                      AwesomeDialog(
                        btnOkIcon: CupertinoIcons.airplane,
                        showCloseIcon: true,
                        context: context,
                        dialogType: DialogType.info,
                        animType: AnimType.scale,
                        title: 'Alert',
                        desc: "Delete task?",
                        btnCancelOnPress: () {
                          print("cancele");
                        },
                        btnOkOnPress: () async {
                          await FirebaseFirestore.instance
                              .collection(widget.collectionName)
                              .doc(data[i].id)
                              .delete();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TasksPage(
                                  collectionName: widget.collectionName,
                                  currentPageName: widget.collectionName),
                            ),
                          );
                        },
                      ).show();
                    },
                  );
                },
              ),
      ),
    );
  }
}

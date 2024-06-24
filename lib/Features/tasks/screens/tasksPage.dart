import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool isLoading = true;

  List<QueryDocumentSnapshot> data = [];
  List<bool> dataCheck = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection(widget.collectionName)
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isChecked', isEqualTo: false)
        .get();
    setState(() {
      data = querySnapshot.docs;
      dataCheck = List.filled(data.length, false);
      isLoading = false;
    });
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      dataCheck[index] = !dataCheck[index];
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
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : data.isEmpty
                ? Center(child: DarkTextManager(text: "No tasks yet", fontSize: 30))
                : ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 30,
                    ),
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return CustomListTitle(
                        handleCheckboxChange: () => _handleCheckboxChange(i),
                        isChecked: dataCheck[i],
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

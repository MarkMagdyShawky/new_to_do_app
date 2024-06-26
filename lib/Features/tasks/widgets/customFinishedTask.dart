import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/tasks/screens/tasksPage.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/textManager.dart';

class CustomFinishedTasks extends StatefulWidget {
  final int indexx;
  final VoidCallback? onPressed;
  final String collectionName;
  final String currentPageName;

  const CustomFinishedTasks({
    super.key,
    this.onPressed,
    required this.collectionName,
    required this.currentPageName,
    required this.indexx,
  });

  @override
  State<CustomFinishedTasks> createState() => _CustomFinishedTasksState();
}

class _CustomFinishedTasksState extends State<CustomFinishedTasks> {
  bool isLoading = true;
  List<QueryDocumentSnapshot> data = [];
  List<bool> dataCheck = [];
  late CollectionReference tasks;

  @override
  void initState() {
    super.initState();
    tasks = FirebaseFirestore.instance.collection(widget.collectionName);
    getData();
  }

  getData() async {
    QuerySnapshot querySnapshot = await tasks
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isChecked', isEqualTo: true)
        .get();
    setState(() {
      data = querySnapshot.docs;
      dataCheck = List.filled(data.length, true);
      isLoading = false;
    });
  }

  void _handleCheckboxChange(int index) {
    setState(() {
      dataCheck[index] = !dataCheck[index];
      updateCheckedValue(index);
    });
  }

  updateCheckedValue(int index) async {
    String docId = data[index].id;
    await tasks.doc(docId).update({'isChecked': dataCheck[index]});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            TasksPage(collectionName: widget.collectionName, currentPageName: widget.collectionName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : widget.indexx < data.length
            ? Container(
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
                  title: GoldTextManager(
                    text: data[widget.indexx]["taskName"],
                    fontSize: 18,
                  ),
                  subtitle: Text(data[widget.indexx]["taskDescription"]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(
                        value: dataCheck[widget.indexx],
                        onChanged: (bool? value) {
                          _handleCheckboxChange(widget.indexx);
                        },
                        activeColor: MarkPrimaryColor,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      IconButton(
                        onPressed: widget.onPressed,
                        icon: Icon(Icons.close),
                        color: MarkPrimaryColor,
                      ),
                    ],
                  ),
                ),
              )
            : Center(child: Text(''));
  }
}

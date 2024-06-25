// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/toDoHome/widgets/customFinalCard.dart';
import 'package:to_do_app/Features/toDoHome/widgets/customTaskCard.dart';
import 'package:to_do_app/core/resources/MarkDrawer.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/imageManager.dart';
import 'package:to_do_app/core/resources/stringManager.dart';

class ToDoHomeScreen extends StatefulWidget {
  const ToDoHomeScreen({super.key});

  @override
  State<ToDoHomeScreen> createState() => _ToDoHomeScreenState();
}

class _ToDoHomeScreenState extends State<ToDoHomeScreen> {
  List<QueryDocumentSnapshot> allDataquerySnapshotPeronalTask = [];
  List<QueryDocumentSnapshot> specificDataquerySnapshotPeronalTask = [];

  List<QueryDocumentSnapshot> allDataquerySnapshotWorkTask = [];
  List<QueryDocumentSnapshot> specificDataquerySnapshotWorkTask = [];

  List<QueryDocumentSnapshot> allDataquerySnapshotDailyTask = [];
  List<QueryDocumentSnapshot> specificDataquerySnapshotDailyTask = [];

  List<QueryDocumentSnapshot> allDataquerySnapshotShoppignTask = [];
  List<QueryDocumentSnapshot> specificDataquerySnapshotShoppingTask = [];
  int index = 0;

  List<String> collectionsNames = ['PersonalTasks', 'WorkTasks', 'DailyTasks', 'ShoppingTasks'];

  getAllData() async {
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection(collectionsNames[0])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
        .collection(collectionsNames[1])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    QuerySnapshot querySnapshot3 = await FirebaseFirestore.instance
        .collection(collectionsNames[2])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    QuerySnapshot querySnapshot4 = await FirebaseFirestore.instance
        .collection(collectionsNames[3])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      allDataquerySnapshotPeronalTask = querySnapshot1.docs;

      allDataquerySnapshotWorkTask = querySnapshot2.docs;

      allDataquerySnapshotDailyTask = querySnapshot3.docs;

      allDataquerySnapshotShoppignTask = querySnapshot4.docs;
    });
  }

  getSpecificData() async {
    QuerySnapshot querySnapshot1 = await FirebaseFirestore.instance
        .collection(collectionsNames[0])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isChecked', isEqualTo: true)
        .get();

    QuerySnapshot querySnapshot2 = await FirebaseFirestore.instance
        .collection(collectionsNames[1])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isChecked', isEqualTo: true)
        .get();

    QuerySnapshot querySnapshot3 = await FirebaseFirestore.instance
        .collection(collectionsNames[2])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isChecked', isEqualTo: true)
        .get();

    QuerySnapshot querySnapshot4 = await FirebaseFirestore.instance
        .collection(collectionsNames[3])
        .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('isChecked', isEqualTo: true)
        .get();

    setState(() {
      specificDataquerySnapshotPeronalTask = querySnapshot1.docs;
      specificDataquerySnapshotWorkTask = querySnapshot2.docs;
      specificDataquerySnapshotDailyTask = querySnapshot3.docs;
      specificDataquerySnapshotShoppingTask = querySnapshot4.docs;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllData();
    getSpecificData();
  }

  double calculatePercentage(int specificCount, int allCount) {
    if (allCount == 0)
      return 0.0;
    else
      return specificCount / allCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MarkDrawer(),
      backgroundColor: MarkBackgroundColor,
      appBar: AppBar(
        backgroundColor: MarkPrimaryColor,
        toolbarHeight: 60,
        elevation: 0,
        foregroundColor: MarkPrimaryColor,
        excludeHeaderSemantics: true,
        iconTheme: IconThemeData(color: MarkBackgroundColor, size: 30),
      ),
      body: Stack(
        children: [
          // Image background
          ClipRRect(
            borderRadius:
                BorderRadius.only(bottomLeft: Radius.circular(300), bottomRight: Radius.circular(300)),
            child: Image.asset(ImageManager.toDoHomeBackground),
          ),

          Container(
            margin: EdgeInsets.only(
              top: 30,
            ),
            alignment: Alignment.topCenter,
            child: Text(
              StringManager.toDoHomeTitle,
              style: TextStyle(fontSize: 26, color: MarkBackgroundColor, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
              textDirection: TextDirection.ltr,
            ),
          ),
          // /////////////////////////
          GridView(
            padding: EdgeInsets.only(top: 200, left: 15, right: 15),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
            children: [
              // Cards:
              // Personal card tasks
              CustomTaskCard(
                mainTitle: "Personal",
                div:
                    "${specificDataquerySnapshotPeronalTask.length}/${allDataquerySnapshotPeronalTask.length}",
                precentage: calculatePercentage(
                    specificDataquerySnapshotPeronalTask.length, allDataquerySnapshotPeronalTask.length),
                image: ImageManager.personalCard,
                pageName: 'Personal Tasks',
                collectionName: 'PersonalTasks',
              ),

              // Work card tasks
              CustomTaskCard(
                mainTitle: "Work",
                div: "${specificDataquerySnapshotWorkTask.length}/${allDataquerySnapshotWorkTask.length}",
                precentage: calculatePercentage(
                    specificDataquerySnapshotWorkTask.length, allDataquerySnapshotWorkTask.length),
                image: ImageManager.workCard,
                pageName: 'Work Tasks',
                collectionName: 'WorkTasks',
              ),

              // Daily card tasks
              CustomTaskCard(
                mainTitle: "Daily",
                div: "${specificDataquerySnapshotDailyTask.length}/${allDataquerySnapshotDailyTask.length}",
                precentage: calculatePercentage(
                    specificDataquerySnapshotDailyTask.length, allDataquerySnapshotDailyTask.length),
                image: ImageManager.calendarCard,
                pageName: 'Daily Tasks',
                collectionName: 'DailyTasks',
              ),

              // Shopping card tasks
              CustomTaskCard(
                mainTitle: "Shopping",
                div:
                    "${specificDataquerySnapshotShoppingTask.length}/${allDataquerySnapshotShoppignTask.length}",
                precentage: calculatePercentage(
                    specificDataquerySnapshotShoppingTask.length, allDataquerySnapshotShoppignTask.length),
                image: ImageManager.shoppingCard,
                pageName: 'Shopping',
                collectionName: 'ShoppingTasks',
              ),

              CustomFinalCard(),
            ],
          ),
        ],
      ),
    );
  }
}

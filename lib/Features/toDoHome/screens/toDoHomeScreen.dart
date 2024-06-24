// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
                div: "5/5",
                precentage: 1,
                image: ImageManager.personalCard,
                pageName: 'Personal Tasks',
                collectionName: 'PersonalTasks',
              ),

              // Work card tasks
              CustomTaskCard(
                mainTitle: "Work",
                div: "1/4",
                precentage: 0.25,
                image: ImageManager.workCard,
                pageName: 'Work Tasks',
                collectionName: 'WorkTasks',
              ),

              // Daily card tasks
              CustomTaskCard(
                mainTitle: "Daily",
                div: "3/6",
                precentage: 0.5,
                image: ImageManager.calendarCard,
                pageName: 'Daily Tasks',
                collectionName: 'DailyTasks',
              ),

              // Shopping card tasks
              CustomTaskCard(
                mainTitle: "Shopping",
                div: "1/6",
                precentage: 0.166,
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

// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/core/resources/colorManager.dart';

class MarkDrawer extends StatelessWidget {
  const MarkDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: MarkPrimaryColor,
      elevation: 3,
      semanticLabel: NativeRuntime.buildId,
      backgroundColor: MarkBackgroundColor,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Text(
            "Wellcome",
            style: TextStyle(color: MarkPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold),
          )),
          ListTile(
            leading: Icon(
              Icons.home,
              color: MarkPrimaryColor,
            ),
            title: Text(
              "Home",
              style: TextStyle(color: MarkPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.done_outline_outlined,
              color: MarkPrimaryColor,
            ),
            title: Text(
              "Finished Tasks",
              style: TextStyle(color: MarkPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_back,
              color: MarkPrimaryColor,
            ),
            title: Text(
              "Logout",
              style: TextStyle(color: MarkPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}

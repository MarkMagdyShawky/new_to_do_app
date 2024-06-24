// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do_app/core/resources/colorManager.dart';

class MarkDrawer extends StatelessWidget {
  const MarkDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () {
              Navigator.popAndPushNamed(context, "ToDoHome");
            },
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
            onTap: () async {
              FirebaseAuth auth = FirebaseAuth.instance;
              User? user = auth.currentUser;

              try {
                if (user != null && !user.isAnonymous) {
                  if (user.providerData.any((userInfo) => userInfo.providerId == 'google.com')) {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    await googleSignIn.disconnect();
                  }
                }
              } catch (e) {
                print('Error disconnecting Google account: $e');
              }
              await auth.signOut();
              Navigator.popAndPushNamed(context, "Login");
            },
          )
        ],
      ),
    );
  }
}

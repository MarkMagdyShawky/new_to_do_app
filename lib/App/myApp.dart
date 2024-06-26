// ignore_for_file: avoid_print
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/onboarding/screens/onboardingPage.dart';
import 'package:to_do_app/Features/toDoHome/screens/toDoHomeScreen.dart';
import 'package:to_do_app/core/resources/colorManager.dart';
import 'package:to_do_app/core/resources/routsManager.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('====================>>> User is currently signed out!');
      } else {
        print('====================>>> User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Acme-Regular"),
      debugShowCheckedModeBanner: false,
      color: MarkBackgroundColor,
      routes: RoutManager.PageRoute,
      home: AnimatedSplashScreen(
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 200,
        duration: 400,
        splash: CircleAvatar(
          backgroundImage: AssetImage("assets/images/logo88.png"),
          radius: 90,
        ),
        nextScreen: (FirebaseAuth.instance.currentUser != null) ? ToDoHomeScreen() : OnboardingPage(),
      ),
      // initialRoute: (FirebaseAuth.instance.currentUser != null) ? "ToDoHome" : "Onboarding",
    );
  }
}

import 'package:flutter/material.dart';
import 'package:to_do_app/Features/login/screens/loginPage.dart';
import 'package:to_do_app/Features/onboarding/screens/onboardingPage.dart';
import 'package:to_do_app/Features/singup/screens/signupPage.dart';
import 'package:to_do_app/Features/tasks/screens/doneTasks.dart';
import 'package:to_do_app/Features/tasks/screens/personalTasks.dart';
import 'package:to_do_app/Features/toDoHome/screens/toDoHomeScreen.dart';

class RoutManager {
  static Map<String, WidgetBuilder> PageRoute = {
    "Onboarding": (context) => OnboardingPage(),
    "Login": (context) => LoginPage(),
    "Signup": (context) => SignupPage(),
    "ToDoHome": (context) => ToDoHomeScreen(),
    "PersonalTasks": (context) => PersonalTasks(),
    "DoneTasks": (context) => DoneTasks(),
  };
}

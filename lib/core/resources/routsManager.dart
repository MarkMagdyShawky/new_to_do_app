import 'package:flutter/material.dart';
import 'package:to_do_app/Features/login/screens/loginPage.dart';
import 'package:to_do_app/Features/onboarding/screens/onboardingPage.dart';
import 'package:to_do_app/Features/singup/screens/signupPage.dart';

class RoutManager {
  static Map<String, WidgetBuilder> PageRoute = {
    "Onboarding": (context) => OnboardingPage(),
    "Login" :(context) => LoginPage(),
    "Signup" : (context) => SignupPage(),
  };
}

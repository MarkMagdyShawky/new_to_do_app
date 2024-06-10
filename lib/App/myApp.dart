import 'package:flutter/material.dart';
import 'package:to_do_app/Features/onboarding/screens/onboardingPage.dart';
import 'package:to_do_app/core/resources/routsManager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Acme-Regular"),
      debugShowCheckedModeBanner: false,
      routes: RoutManager.PageRoute,
      initialRoute: "Onboarding",
    );
  }
}

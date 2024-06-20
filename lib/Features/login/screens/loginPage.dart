// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/Features/login/widgets/customLoginHeader.dart';
import 'package:to_do_app/Features/onboarding/widgets/customLargeButton.dart';
import 'package:to_do_app/core/resources/imageManager.dart';
import 'package:to_do_app/core/resources/stringManager.dart';
import '../widgets/customLargeDarkButton.dart';
import '../widgets/customLoginFooter.dart';
import '../widgets/customTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (formState.currentState?.validate() ?? false) {
      Navigator.of(context).pushNamed("Onboarding");
      print('Form is valid');
    } else {
      // If the form is invalid, display the error messages
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, bottom: 40),
            child: Column(
              children: [
                // Login Header
                CustomLoginHeader(
                    pageTitle: StringManager.LoginTitle,
                    imageLocation: ImageManager.LoginImage,
                    subtitle: StringManager.LoginSubtitle),
                // Login Buttons
                Container(
                  child: Form(
                    key: formState,
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        CustomTextField(
                          textName: "email",
                          controllerName: email,
                          hintName: StringManager.emailHint,
                          focusNode: focusNode1,
                          iconss: Icons.email,
                        ),
                        CustomTextField(
                          textName: "password",
                          controllerName: password,
                          hintName: StringManager.passwordHint,
                          focusNode: focusNode2,
                          iconss: Icons.password,
                        ),
                        SizedBox(height: 30),
                        CustomLargeDarkButton(
                          btnName: StringManager.LoginBtnName,
                          nextPage: "ToDoHome",
                          onPressed: _submitForm,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                // Login Footer
                CustomLoginFooter(
                    question: StringManager.LoginFooterQ,
                    nextPage: "Signup",
                    btnName: StringManager.SignupBtnName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

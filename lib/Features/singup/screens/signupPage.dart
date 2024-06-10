// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/Features/login/widgets/customLargeDarkButton.dart';
import 'package:to_do_app/Features/login/widgets/customLoginFooter.dart';
import 'package:to_do_app/Features/login/widgets/customLoginHeader.dart';
import 'package:to_do_app/Features/login/widgets/customTextField.dart';
import 'package:to_do_app/Features/onboarding/widgets/customLargeButton.dart';
import 'package:to_do_app/core/resources/imageManager.dart';
import 'package:to_do_app/core/resources/stringManager.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });
    focusNode2.addListener(() {
      setState(() {});
    });
    focusNode3.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          padding: EdgeInsets.only(top: 40, bottom: 40),
          child: Column(
            children: [
              // Login Header
              CustomLoginHeader(
                pageTitle: StringManager.signupTitle,
                imageLocation: ImageManager.signupImage,
                subtitle: StringManager.signupSubtitle,
              ),
              // Login Buttons
              Container(
                child: Form(
                    key: formState,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        CustomTextField(
                          textName: "username",
                          controllerName: username,
                          hintName: StringManager.usernameHint,
                          focusNode: focusNode1,
                          iconss: Icons.person,
                        ),
                        CustomTextField(
                          textName: "email",
                          controllerName: email,
                          hintName: StringManager.emailHint,
                          focusNode: focusNode2,
                          iconss: Icons.email,
                        ),
                        CustomTextField(
                          textName: "password",
                          controllerName: password,
                          hintName: StringManager.passwordHint,
                          focusNode: focusNode3,
                          iconss: Icons.password,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomLargeDarkButton(
                            btnName: StringManager.SignupBtnName, nextPage: "Login")
                      ],
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              // Login Footer
              CustomLoginFooter(
                  question: StringManager.signupFooterQ,
                  nextPage: "Login",
                  btnName: StringManager.LoginBtnName)
            ],
          ),
        )
      ]),
    );
  }
}

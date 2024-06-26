// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/Features/login/widgets/customLargeDarkButton.dart';
import 'package:to_do_app/Features/login/widgets/customLoginFooter.dart';
import 'package:to_do_app/Features/login/widgets/customLoginHeader.dart';
import 'package:to_do_app/Features/login/widgets/customTextField.dart';
import 'package:to_do_app/Features/singup/widgets/customAwesomeDialog.dart';
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

  void _submitForm() async {
    if (formState.currentState?.validate() ?? false) {
      try {
        // ignore: unused_local_variable
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        CustomAwesomeDialog().showSuccessDialog(context, StringManager.signinSucc, "Login");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('=========>> ${StringManager.weakPassword}');
          CustomAwesomeDialog().showInfoDialog(context, StringManager.alert, StringManager.weakPassword);
        } else if (e.code == 'email-already-in-use') {
          print('=========>> ${StringManager.emailAlreadyExist}.');
          CustomAwesomeDialog().showInfoDialog(context, StringManager.alert, StringManager.emailAlreadyExist);
        } else if (e.code == 'invalid-email') {
          print('=========>> The email address is not valid.');
          CustomAwesomeDialog().showInfoDialog(context, StringManager.alert, StringManager.emailBadlyFormat);
        }
      } catch (e) {
        print(e);
        CustomAwesomeDialog().showInfoDialog(context, StringManager.alert, StringManager.errorMessage);
      }
    } else {
      print('Form is invalid');
    }
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
                          btnName: StringManager.SignupBtnName,
                          nextPage: "Login",
                          onPressed: _submitForm,
                        )
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
                btnName: StringManager.LoginBtnName,
              )
            ],
          ),
        )
      ]),
    );
  }
}

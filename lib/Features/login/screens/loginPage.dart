// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do_app/Features/login/widgets/customGoogleBtn.dart';
import 'package:to_do_app/Features/login/widgets/customLoginHeader.dart';
import 'package:to_do_app/Features/singup/widgets/customAwesomeDialog.dart';
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

  void _submitForm() async {
    if (formState.currentState?.validate() ?? false) {
      try {
        // ignore: unused_local_variable
        final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
        CustomAwesomeDialog().showSuccessDialog(context, StringManager.loginSucc, "ToDoHome");
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print("=========>> ${StringManager.userNotFound}");
          CustomAwesomeDialog().showErrorDialog(context, StringManager.userNotFound);
        } else if (e.code == 'wrong-password') {
          print('=========>> ${StringManager.wrongPassword}');
          CustomAwesomeDialog().showErrorDialog(context, StringManager.wrongPassword);
        }
      }
      print('Form is valid');
    } else {
      // If the form is invalid, display the error messages
      print('Form is invalid');
    }
  }

  //////****Login With Google Account*******/////
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    if (googleUser == null) {
      return; // if user enter null value or cancel login will get out
    }
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    // if login success show diagonal from package
    setState(() {
      CustomAwesomeDialog().showSuccessDialog(context, StringManager.loginSucc, "ToDoHome");
    });
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
                        SizedBox(height: 10),
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
                        SizedBox(height: 20),
                        CustomLargeDarkButton(
                          btnName: StringManager.LoginBtnName,
                          nextPage: "ToDoHome",
                          onPressed: _submitForm,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomGoogleBtn(
                  signInWithGoogle: signInWithGoogle,
                ),
                SizedBox(height: 10),
                // Login Footer
                CustomLoginFooter(
                  question: StringManager.LoginFooterQ,
                  nextPage: "Signup",
                  btnName: StringManager.SignupBtnName,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

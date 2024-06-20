import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

class CustomAwesomeDialog {
  CustomAwesomeDialog();

  void showSuccessDialog(BuildContext context, String message, String nextPage) async {
    return AwesomeDialog(
      btnOkIcon: CupertinoIcons.airplane,
      showCloseIcon: true,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: 'Success',
      desc: message,
      btnOkOnPress: () {
        Navigator.of(context).pushNamed(nextPage);
      },
    ).show();
  }

  void showInfoDialog(BuildContext context, String infoTitle, String infoMessage) {
    AwesomeDialog(
      btnOkIcon: CupertinoIcons.airplane,
      showCloseIcon: true,
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.scale,
      title: infoTitle,
      desc: infoMessage,
      btnOkOnPress: () {},
    ).show();
  }

  void showErrorDialog(BuildContext context, String errorMessage) {
    AwesomeDialog(
      btnOkIcon: CupertinoIcons.repeat,
      showCloseIcon: true,
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.scale,
      title: 'Error',
      desc: errorMessage,
      btnOkOnPress: () {},
    ).show();
  }
}

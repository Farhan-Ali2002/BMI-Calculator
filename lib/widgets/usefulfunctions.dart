import "package:flutter/material.dart";

import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

dialog(BuildContext context, String msg) {
  return showDialog<void>(
      barrierColor: Colors.blue,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(title: Text(msg), actions: [
          ElevatedButton(
            child: const Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ]);
      });
}

dialog1(
    BuildContext context, String msg, DialogType dialogType, Color bgColor) {
  AwesomeDialog(
      context: context,
      desc: msg,
      dialogType: dialogType,
      borderSide: BorderSide(
        color: bgColor,
        width: 2,
      ),
      btnOkOnPress: () {})
    ..show();
}

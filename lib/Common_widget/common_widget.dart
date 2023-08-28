import 'package:flutter/material.dart';

class CommonWidget {
  static InputDecoration formFieldStyle(
    String text,
    String hint,
  ) {
    return InputDecoration(
        labelText: text,
        hintText: hint,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))));
  }

  static Future showLoading(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                CircularProgressIndicator(),
                Text("Loading please wait...")
              ],
            ),
          );
        });
  }
}

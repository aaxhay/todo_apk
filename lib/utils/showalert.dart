// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:todo_apk/utils/Buttons.dart';

class ShowAlertWindow extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onsave;
  VoidCallback onCancel;

  ShowAlertWindow({
    Key? key,
    required this.onsave,
    required this.onCancel,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[300],
      content: SizedBox(
        height: 160,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task")),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //save button
              myBottons(text: "Save", onPressed: onsave),
              //cancel button
              const SizedBox(
                width: 8,
              ),
              myBottons(text: "Cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}

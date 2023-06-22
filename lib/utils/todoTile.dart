// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String text;
  final bool taskChanged;
  Function(bool?)? onChanged;
  Function(BuildContext)? onPressed;

  TodoTile({
    Key? key,
    required this.text,
    required this.taskChanged,
    required this.onChanged,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, right: 25, left: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: onPressed,
            icon: Icons.delete,
            backgroundColor: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight : Radius.circular(15),
                  bottomLeft: Radius.circular(50),
                  topLeft: Radius.circular(50)),
              color: Colors.deepPurple),
          child: Row(
            children: [
              //add a check box here

              Checkbox(
                value: taskChanged,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(text,
                  style: TextStyle(
                      decoration: taskChanged
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}

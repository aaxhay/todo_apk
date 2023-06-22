import 'package:flutter/material.dart';

// ignore: camel_case_types
class myBottons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  myBottons({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
      );
  }
}

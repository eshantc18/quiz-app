import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String ques;

  Question(this.ques);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(12),
      color: Colors.cyan,
      child: Text(
        ques,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}

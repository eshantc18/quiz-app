import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  // final Function changeQuestion gives error when passed through OnPressed
  // VoidCallback -> typedef of func with no arguments and no return
  final VoidCallback changeQuestion;
  final String ans;

  Option(this.changeQuestion, this.ans);

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(foregroundColor: Colors.yellow),
        child: Text(ans),
        onPressed: changeQuestion,
      ),
    );
  }
}

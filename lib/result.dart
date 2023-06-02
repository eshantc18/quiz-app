import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback reset;

  Result(this.resultScore, this.reset);

  // Using getters => Not a func but ...
  String get result {
    String result;
    if (resultScore <= 3)
      result = 'Great !!!';
    else if (resultScore <= 6)
      result = 'Awesome, You made it';
    else
      result = 'You failed';

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          TextButton(
              onPressed: reset,
              child: Text(
                "Restart Quiz",
                style: TextStyle(backgroundColor: Colors.amber),
              ))
        ],
      ),
    );
  }
}

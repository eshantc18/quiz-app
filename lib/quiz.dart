import 'package:flutter/material.dart';
import './ques.dart';
import './ans.dart';

class Quiz extends StatelessWidget {
  final Function selectState;
  final List<Map<String, Object>> question;
  final int questionIndex;

  Quiz(
      {required this.selectState,
      required this.question,
      required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Error : Question(question[_questionIndex]['ques']),
        // Adding "as String" resolves error
        Question(question[questionIndex]['ques'] as String),

        // ... -> spread operator -> Breaks this list and adds each element to the children list
        // Add 'as List<String>' so as dart finds ans: []
        ...(question[questionIndex]["ans"] as List<Map<String, Object>>)
            .map((ans) {
          return Option(() => selectState(ans['score']), ans["opt"] as String);
        }).toList(), // toList() converts to list

        /* // Alternative
                Option(_answerQuestion, (question[_questionIndex]['ans'] as List<String>)[0]),
                Option(_answerQuestion, (question[_questionIndex]['ans'] as List<String>)[1]),
                Option(_answerQuestion, (question[_questionIndex]['ans'] as List<String>)[2]),
        */

        Text("\n\n\n"),
        ElevatedButton(onPressed: () => selectState(0), child: Text("Next")),
      ],
    );
  }
}

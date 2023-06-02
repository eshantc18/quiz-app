// flutter create proj_name_directory; -> Command to create flutter project
// flutter doctor -> Command to check requirements
// flutter packages get -> Command to get flutter packages
// flutter run -> Command to run flutter app

// Always import packages first, then local files
// material.dart - Used for material design
import 'package:flutter/material.dart';
// Use './' to import local files
import './quiz.dart';
import './result.dart';

/* void main() {
  runApp(MyApp());
} */

// Use => only when we have single expression
// runApp(MyApp()) - Builds main widget
void main() => runApp(MyApp());

// To use StatefulWidget class,
// We create two classes MyApp and MyApp + State = MyAppState
class MyApp extends StatefulWidget {
  @override // Creates state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// Use '_' to make classes, methods and properties private
class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totscore = 0;

  // no change in value is possible
  // const question = [] -> Not allowed in class
  // static const question = [] -> Allowed
  final question = const [
    // Alternative
    // {} -> Map
    {
      "ques": "What\'s your age ?",
      "ans": [
        {"opt": '<18', "score": 1},
        {"opt": '=18', "score": 2},
        {"opt": '>18', "score": 3}
      ]
    },
    {
      "ques": "What\'s your favourite color ?",
      "ans": [
        {"opt": 'Blue', "score": 1},
        {"opt": 'Red', "score": 3},
        {"opt": 'Black', "score": 2}
      ]
    },
    {
      "ques": "What\'s your game ?",
      "ans": [
        {"opt": 'Cricket', "score": 2},
        {"opt": 'Tennis', "score": 1},
        {"opt": 'Badminton', "score": 3}
      ]
    },
  ];

  void _answerQuestion(int score) {
    // Acts as trigger for flutter which re-run build method to show up changes
    setState(() {
      _questionIndex += 1;
      _totscore += score;

      if (_questionIndex == 3) print("No more questions");
    });
  }

  void _reset() {
    setState(() {
      _questionIndex = 0;
      _totscore = 0;
    });
  }

  /*
        final -> Constant at runtime
        const -> Constant at compile time ,i.e, does not change at all
  */

  Widget build(BuildContext context) {
    // question = []; -> Gives error as question is const
    /*
    var demo = const [
      "Hello"
    ];
    demo.add("World"); 
    print(demo); // Gives error as [] is const so nothing can be added to it 
    */

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Quiz App"),
        centerTitle: true,
      ),
      body: _questionIndex < question.length
          ? Quiz(
              selectState: _answerQuestion,
              question: question,
              questionIndex: _questionIndex,
            )
          // Result(_totscore, () => _reset) does not work since _reset is already anonymous
          : Result(_totscore, _reset),
    ));
  }
}
/*
// extends - Inheritance
// StatelessWidget cn't re-run build when its property changes
class MyApp extends StatelessWidget {
  // var QuestionIndex is created in class inorder to change question dynamically
  // as build method is run everytime the screen interface changes
  var QuestionIndex = 0;

  void _answerQuestion() {
    // question does not change bcoz MyApp extends StatelessWidget
    QuestionIndex += 1;
    print(QuestionIndex);
  }

  // build() - Returns widget tree which is rendered on screen
  // Widget - Core building block of Flutter UI
  @override // Dart provides this for Overriding to have clean code
  // flutter runs build method everytime the screen interface changes
  Widget build(BuildContext context) {
    var Questions = [
      "What\'s your age ?", // '/' is used before ' bcoz strings end with ' or " in dart
      "What\'s your favorite game ?"
    ];

    return MaterialApp(
      // MaterialApp obj creates a material app
      home: Scaffold(
        // Design on screen
        appBar: AppBar(
          // Appbar obj creates bar on the screen
          title: Text("Basics App"),
        ),
        // Column is used to get RaisedButton one below other
        // Row is used to get RaisedButton one after other
        body: Column(
          children: [
            // children - list of Widget obj
            Text(Questions[0]), // Text obj prints data on screen
            RaisedButton(
              child: Text('Option A'),
              onPressed: null, // RaisedButton is disabled with null
            ), // Deprecated
            RaisedButton(
              child: Text('Option B'),
              onPressed: () => print('Answered !!'), // Anonymous func since the func has no name and is not used anywhere else
            ), // Deprecated
            RaisedButton(
              child: Text('Option C'),
              // onPressed: _answerQuestion(), is not valid as this method is not an obj
              onPressed: _answerQuestion, // Use name of method only
            ), // Deprecated
            RaisedButton(
              child: Text('Option D'),
              onPressed: () {
                // Anonymous func defined
                //....
                print('Answer submitted');
              },
            )
          ],
        ),
      ),
    );
  }
} */

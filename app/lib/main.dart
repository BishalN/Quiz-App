import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var haveQuestion = true;
  final _questions = const [
    {
      'questionText': 'What\'s your favourite color',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 6},
        {'text': 'white', 'score': 3},
        {'text': 'green', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite animal',
      'answers': [
        {'text': 'panda', 'score': 7},
        {'text': 'rabbit', 'score': 5},
        {'text': 'dog', 'score': 9},
        {'text': 'elephant', 'score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favourite instructor',
      'answers': [
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1},
        {'text': 'max', 'score': 1}
      ]
    }
  ];

  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('My App'),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    questionIndex: _questionIndex,
                    answerQuestion: _answerQuestion)
                : Result(_totalScore, _resetQuiz)));
  }
}

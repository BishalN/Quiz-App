import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange';
    } else {
      resultText = 'You are so bad';
    }

    return resultText;
  }

  Result(this.resultScore, this.resetQuiz);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(
          child: Text(
        resultPhrase,
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      )),
      Center(
        child: FlatButton(
          child: Text('Play Again!'),
          textColor: Colors.blue,
          onPressed: resetQuiz,
        ),
      )
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';

import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': 'What\'s your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 1},
        {'text': 'Blue', 'score': 2},
        {'text': 'Yellow', 'score': 3},
      ]
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 1},
        {'text': 'Cat', 'score': 2},
        {'text': 'Bird', 'score': 3}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _onAnswerPressed(int score) {
    if (_questionIndex < _questions.length) {
      print(_questionIndex + 1);
      setState(() {
        _questionIndex = (_questionIndex + 1) % 2;
        _totalScore += score;
      });
    }
    print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Metin Title'),
        ),
        body: Column(
          children: [
            Question(_questions[_questionIndex]['questionText']),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) => Answer(
                    answer['text'], () => _onAnswerPressed(answer['score'])))
                .toList(),
          ],
        ),
      ),
    );
  }
}

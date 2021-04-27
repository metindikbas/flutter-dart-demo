import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function onAnswerSelectedHandler;

  Answer(this.answerText, this.onAnswerSelectedHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
          ),
          child: Text(answerText),
          onPressed: onAnswerSelectedHandler.call,
        ),
      ),
    );
  }
}

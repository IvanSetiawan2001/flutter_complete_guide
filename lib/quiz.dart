import 'package:flutter/material.dart';

import './question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;

  Quiz(
      {@required this.questions,
      @required this.answerQuestion,
      @required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answer'] as List<String>).map((answer) {
          //.map to tell the code to execute the function with return value for every element in the map.
          return Answer(answerQuestion, answer);
        }).toList() // this is a list and we cannot add a list to a list, so we need to extract every value in the list and then add it to children list with "..."
      ],
    );
  }
}

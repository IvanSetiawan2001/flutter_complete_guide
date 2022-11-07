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
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          //.map to tell the code to execute the function with return value for every element in the map.
          return Answer(() => answerQuestion(answer['score']), answer['text']);
          //()=>answerQuestion mean we get the address to the answer question and save it in answer we use answerQuestion() because we want to call the function
          //with the ()=> method, the function no longer will be called when render so we can call answerQuestion() instead of answerQuestion
        }).toList() // this is a list and we cannot add a list to a list, so we need to extract every value in the list and then add it to children list with "..."
      ],
    );
  }
}

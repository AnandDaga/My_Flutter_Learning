import 'package:flutter/material.dart';

import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
//import 'package:quiz_app/model/quiz_questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer, required this.tap});

  final List<String> chosenAnswer;
  final  void Function() tap;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].que,
          'correct_answer': questions[i].ans[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    // where() method allowss you to filter the list  on which you are calling it
    //but like map it does not change the list it just return a new list.
    /*
    final numCorrectQuestions = summaryData.where((data) =>data['user_answer'] == data['correct_answer']
    ).length;
    */

    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "You have answered $numCorrectQuestions out of $numTotalQuestions questions correctly!"),
            // const was used in front of text as numCorrectQuestions are dynamically changing that is why removed.
            const SizedBox(height: 30.0),

            //const Text("list of answers and questions..."),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30.0,
            ),
            TextButton(
             onPressed: tap,
              child: const Text(
                "Restart",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

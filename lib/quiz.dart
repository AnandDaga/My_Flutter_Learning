//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];

  var activeScreen = 'Start-Screen';
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(
      () {
        if (activeScreen == 'Start-Screen') {
          activeScreen = 'Question-Screen';
        } 
        else if (activeScreen == 'Result-Screen') {
          activeScreen = 'Start-Screen';
        }
      },
    );
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = "Result-Screen";
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'Question-Screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    } else if (activeScreen == 'Result-Screen') {
      screenWidget =
          ResultScreen(chosenAnswer: selectedAnswer, tap: switchScreen);
      selectedAnswer = [];
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.deepPurple,
              ],
              begin: Alignment.topLeft, //direction of gradient color.
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          // child: activeScreen == 'Start-Screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
        ),
      ),
    );
  }
}

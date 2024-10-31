import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen( this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 299.0,
            color: const Color.fromARGB(255, 251, 248, 247),
          ),
          const SizedBox(
            height: 49.0,
          ),
          const Text(
            'Learn Flutter in the fun way!',
            style: TextStyle(
              fontSize: 22.0,
              color: Color.fromARGB(255, 241, 248, 250),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            label: const Text(
              "Start Quiz",
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(255, 145, 43, 174),
            ),
            icon: const Icon(Icons.arrow_right),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:labs_app/models/question_model.dart';

class Lab6_Quizzler extends StatefulWidget {
  const Lab6_Quizzler({Key? key}) : super(key: key);

  @override
  State<Lab6_Quizzler> createState() => _Lab6_QuizzlerState();
}

class _Lab6_QuizzlerState extends State<Lab6_Quizzler> {
  int currentIndex = 0;
  final List<Icon> scoreKeeper = [];

  Question get currentQuestion => QuestionBank.getQuestion(currentIndex);
  int get totalQuestions => QuestionBank.getTotalQuestions();

  void checkAnswer(bool userAnswer) {
    final isCorrect = userAnswer == currentQuestion.answer;

    setState(() {
      scoreKeeper.add(
        Icon(
          isCorrect ? Icons.check : Icons.close,
          color: isCorrect ? Colors.green : Colors.red,
        ),
      );
    });

    if (currentIndex < totalQuestions - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Kết thúc câu hỏi'),
            content: const Text('Bạn đã hoàn thành mọi câu hỏi.'),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                    scoreKeeper.clear();
                  });
                  Navigator.of(context).pop();
                },
                child: const Text('Làm lại'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('❓ Quizzler'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  currentQuestion.text,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => checkAnswer(true),
                  child: const Text('Đúng'),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () => checkAnswer(false),
                  child: const Text('Sai'),
                ),
              ),
            ),
            Row(children: scoreKeeper),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
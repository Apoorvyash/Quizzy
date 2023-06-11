import 'package:flutter/material.dart';
import 'AnsButton.dart';
import 'package:quizzy/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizzy'),
        backgroundColor: Color.fromARGB(255, 82, 1, 96),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(156, 39, 176, 1),
              Color.fromRGBO(69, 2, 83, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Question 1',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                widthFactor: 2,
                child: Text(
                  questions[0].question,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              AnsButton(
                text: 'apoorv',
                onTapped: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              AnsButton(
                text: 'apoorv',
                onTapped: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              AnsButton(text: 'Skand', onTapped: () {}),
              const SizedBox(
                height: 10,
              ),
              AnsButton(
                text: 'apoorv',
                onTapped: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

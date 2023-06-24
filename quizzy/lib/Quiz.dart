import 'package:flutter/material.dart';
import 'package:quizzy/Resultscreen.dart';
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
  List<String> selAns = [];

  void selectedAnswers(String ans) {
    selAns.add(ans);
  }

  var i = 0;
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
              Text(
                'Question ${i + 1}',
                style: const TextStyle(
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
                  questions[i].question,
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
              ...questions[i].shuffleAnswers().map((e) {
                return AnsButton(
                    text: e,
                    onTapped: () {
                      selectedAnswers(e);

                      setState(() {
                        i++;
                      });
                      if (i == questions.length) {
                        setState(() {
                          i = 0;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultScreen(showAns: selAns)),
                          );
                        });
                      }
                    });
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

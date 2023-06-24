import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/question_summary.dart';

///add confetti animation on completion of quiz

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.showAns});
  final List<String> showAns;
  @override
  State<StatefulWidget> createState() {
    return _ResultScreenState();
  }

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> mp = [];
    for (int i = 0; i < showAns.length; i++) {
      mp.add({
        'question-number': i,
        'question': questions[i].question,
        'selected': showAns[i],
        'answer': questions[i].answers[0],
        'bool': showAns[i] == questions[i].answers[0] ? 'correct' : 'incorrect',
      });
    }

    return mp;
  }

  int getScore() {
    int score = 0;
    for (int i = 0; i < showAns.length; i++) {
      if (showAns[i] == questions[i].answers[0]) {
        score++;
      }
    }
    return score;
  }
}

class _ResultScreenState extends State<ResultScreen> {
  bool isPlaying = false;

  final controller = ConfettiController(duration: const Duration(seconds: 20));
  List<Map<String, Object>> summaryData = [];
  int score = 0;
  @override
  void initState() {
    summaryData = widget.getSummaryData();
    score = widget.getScore();
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

    controller.play();
  }

  @override
  Widget build(BuildContext context) {
    widget.getSummaryData;
    widget.getScore;
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Stack(
        children: <Widget>[
          QuestionSummary(summaryData, score),
          if (score >= 4) ...[
            Padding(
              padding: EdgeInsets.only(top: 50, left: 30),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(children: [
                  const Text(
                    'Congratulations! You have passed the quiz!',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Your score is $score/6",
                    style: const TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(255, 58, 244, 67),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
            ),
          ] else ...[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(children: [
                  const Text(
                    'Sorry, You have failed the quiz!',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Your score is $score/6",
                    style: const TextStyle(
                      fontSize: 23,
                      color: Color.fromARGB(255, 244, 102, 102),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
            ),
          ],
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              numberOfParticles: 20,
              confettiController: controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: false,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
                onPressed: () {
                  if (isPlaying) {
                    setState(() {
                      controller.stop();
                    });
                  } else {
                    controller.play();
                  }
                },
                child: const Text('Celebrate more!')),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

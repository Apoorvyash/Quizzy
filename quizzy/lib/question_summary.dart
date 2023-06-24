import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:quizzy/Resultscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summary, this.score, {super.key});
  final List<Map<String, Object>> summary;
  final int score;
  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(87, 73, 239, 1),
              Color.fromRGBO(163, 7, 153, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          //set alignment direction to top to bottom

          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 400,
              width: MediaQuery.of(context).size.width * 0.8,
              child: SingleChildScrollView(
                child: Column(
                  children: summary.map((data) {
                    return Row(
                      //align the text to the center

                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ((data['question-number'] as int) + 1)
                                        .toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Text(data['question'].toString(),
                                        style: GoogleFonts.lato(
                                            fontSize: 20, color: Colors.white)),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              if (data['bool'] == 'correct') ...[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "Correct! Answer :" +
                                              (data['selected'].toString()),
                                          style: GoogleFonts.lato(
                                              fontSize: 20,
                                              color: Colors.green)),
                                    ),
                                  ],
                                ),
                              ] else ...[
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                          "Uh, Oh! Incorrect: " +
                                              data['selected'].toString(),
                                          style: GoogleFonts.lato(
                                              fontSize: 20, color: Colors.red)),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(data['answer'].toString(),
                                          style: GoogleFonts.lato(
                                              fontSize: 20,
                                              color: Colors.green)),
                                    ),
                                  ],
                                ),
                              ],
                              const Divider(color: Colors.white)
                            ],
                          ),
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quizzy/Quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key});
  @override
  Widget build(context) {
    return Scaffold(
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
            Image.asset(
              'assets/images/quiz-logo.png',
              width: 250,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to Flutter Quiz by Apoorv!',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Passing Marks: 4 out of 6',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Quiz()),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  textStyle: const TextStyle(fontSize: 30)),
              label: Text('Dive In!', style: GoogleFonts.lato(fontSize: 30)),
              icon: const Icon(Icons.arrow_forward),
            )
          ],
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:adv_basics/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class logopage extends StatefulWidget {
  const logopage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _logopage();
  }
}

class _logopage extends State<logopage> {
  @override
  Widget build(context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 64, 220, 241),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/quiz-logo.png",
                color: Color.fromARGB(99, 255, 255, 255),
              ),
              const SizedBox(height: 20),
              Text("Learn flutter the fun way!",
                  style: GoogleFonts.eduTasBeginner(
                      color: Colors.white, fontSize: 35)),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 50),
                    backgroundColor: Color.fromARGB(221, 255, 255, 255),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const question(),
                    ),
                  );
                },
                label: Text("Start Quiz",
                    style: GoogleFonts.eduTasBeginner(
                        color: const Color.fromARGB(255, 65, 65, 65),
                        fontSize: 20)),
                icon: Icon(Icons.arrow_circle_right),
              )
            ],
          ),
        ));
  }
}

import 'package:adv_basics/data/questionsdata.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class result extends StatelessWidget {
  const result({super.key, required this.chosenanswers});
  final List<String> chosenanswers;
  List<Map<String, Object>> getsummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenanswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenanswers[i]
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summarydata = getsummary();
    final numtotalquestions = questions.length;
    final numcorrectquestions = summarydata.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 64, 220, 241),
        body: SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'You answered $numcorrectquestions correct questions out of $numtotalquestions questions!',
                    style: GoogleFonts.eduTasBeginner(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontSize: 25)),
                SizedBox(
                  height: 30,
                ),
                questions_summary(getsummary()),
                SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 50),
                    backgroundColor: Color.fromARGB(221, 255, 255, 255),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                  ),
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  },
                  child: Text("Return to Home Page",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.eduTasBeginner(
                        color: const Color.fromARGB(255, 65, 65, 65),
                        fontSize: 15,
                      )),
                )
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:adv_basics/answerbutton.dart';
import 'package:adv_basics/data/questionsdata.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adv_basics/result.dart';

class question extends StatefulWidget {
  const question({super.key});

  @override
  State<question> createState() {
    return _question();
  }
}

class _question extends State<question> {
  var index = 0;
  List<String> selectedAnswers = [];
  void chooseanswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(context) {
    void answerquestion() {
      setState(() {
        if (index < questions.length - 1)
          index++;
        else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => result(
                      chosenanswers: selectedAnswers,
                    )),
          );
        }
      });
    }

    final currentquestion = questions[index];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 220, 241),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(currentquestion.text,
                textAlign: TextAlign.center,
                style: GoogleFonts.eduTasBeginner(
                    color: Colors.white, fontSize: 35)),
            SizedBox(height: 25),
            ...currentquestion.getshuffledanswers().map((item) {
              return AnswerButton(
                  answertext: item,
                  ontap: () {
                    chooseanswer(item);
                    answerquestion();
                  });
            })
          ],
        ),
      ),
    );
  }
}

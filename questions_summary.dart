import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class questions_summary extends StatelessWidget {
  questions_summary(this.summarydata, {super.key});
  List<Map<String, Object>> summarydata = [];
  @override
  Widget build(context) {
    return SizedBox(
      height: 600,
      child: SingleChildScrollView(
        child: Column(
          children: summarydata.map((data) {
            return Row(
              children: [
                Icon(
                    data['user_answer'] == data['correct_answer']
                        ? Icons.check
                        : Icons.close,
                    color: data['user_answer'] == data['correct_answer']
                        ? const Color.fromARGB(255, 0, 106, 4)
                        : Colors.red),
                Expanded(
                  child: Column(
                    children: [
                      Text(data['question'] as String,
                          style: GoogleFonts.eduTasBeginner(
                              color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 5,
                      ),
                      Text('your answer: ' + (data['user_answer'] as String),
                          style: GoogleFonts.eduTasBeginner(
                              color:
                                  data['user_answer'] == data['correct_answer']
                                      ? const Color.fromARGB(255, 0, 106, 4)
                                      : Colors.red,
                              fontSize: 20)),
                      Text(
                          data['user_answer'] == data['correct_answer']
                              ? ""
                              : 'correct answer: ' +
                                  (data['correct_answer'] as String),
                          style: GoogleFonts.eduTasBeginner(
                              color: Colors.green, fontSize: 20)),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

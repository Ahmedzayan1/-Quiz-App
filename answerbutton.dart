import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answertext, required this.ontap});
  final void Function() ontap;
  final String answertext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              fixedSize: Size(380, 70),
              backgroundColor: Color.fromARGB(221, 255, 255, 255),
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            ),
            child: Text(
              answertext,
              textAlign: TextAlign.start,
              style: GoogleFonts.eduTasBeginner(
                  color: const Color.fromARGB(255, 65, 65, 65), fontSize: 20),
            )),
        SizedBox(
          height: 8,
        )
      ],
    );
  }
}

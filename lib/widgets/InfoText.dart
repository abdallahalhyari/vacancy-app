
import 'package:flutter/material.dart';

class InfoText extends StatelessWidget {
  final String? firstText;
  final String? secondText;
  final String? thirdText;

  const InfoText({this.firstText, this.secondText, this.thirdText});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 5,
          color: Colors.black,
        ),
        children: <TextSpan>[
          TextSpan(
            text: '$firstText',
            style: const TextStyle(
              height: 1.5,
            ),
          ),
          TextSpan(
            text: '\n$secondText',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: '\n$thirdText',
            style: const TextStyle(
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}

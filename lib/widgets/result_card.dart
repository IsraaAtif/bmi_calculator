
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String resultText;
  final double bmiResult;
  final String interpretation;
  final Color cardColor;
  final Color resultGreen;

  const ResultCard({
    super.key,
    required this.resultText,
    required this.bmiResult,
    required this.interpretation,
    required this.cardColor,
    required this.resultGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            resultText.toUpperCase(),
            style: TextStyle(
              color: resultGreen,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            bmiResult.toStringAsFixed(1),
            style: const TextStyle(
              fontSize: 80,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            interpretation,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xFF8D8E98),
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}
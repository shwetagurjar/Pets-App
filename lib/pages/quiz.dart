import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 32,
            ),
            Text(
              "Q) "
            ),
            SizedBox(
              height: 32,
            )
          ]
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class QuizAnswerSubmission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Icon(Icons.chevron_left, color: Colors.black, size: 36),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 72,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Image.asset(
              "assets/images/pets.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: Text(
              "Answers received",
              style: TextStyle(fontFamily: "Montserrat", fontSize: 24),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Center(
            child: Text(
              "We'll get back to you soon!",
              style: TextStyle(fontFamily: "Montserrat", fontSize: 15),
            ),
          ),
          SizedBox(
            height: 72,
          )
        ],
      ),
    );
  }
}

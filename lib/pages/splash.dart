import 'dart:async';
import 'package:flutter/material.dart';
import 'pageSwitcher.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => PageSwitcher(
          username: 'Shweta Gurjar',
        )
      )
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            ),
            Image.asset(
              "assets/images/petLogo.png"
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
            )
          ],
        ),
      ),
    );
  }
}
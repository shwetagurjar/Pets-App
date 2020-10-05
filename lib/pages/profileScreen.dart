import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 128,
            ),
            CircleAvatar(
              radius: 96,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
            SizedBox(
              height: 64,
            ),
            Text(
              "Shweta Gurjar",
              style: TextStyle(fontFamily: "Montserrat", fontSize: 32),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              "shwetagurjar@gmail.com",
              style: TextStyle(fontFamily: "Montserrat", fontSize: 22),
            ),
            SizedBox(
              height: 48,
            ),
            CupertinoButton(
              color: Colors.red,
              onPressed: () {},
              child: Text("Logout"),
            ),
            SizedBox(
              height: 32,
            )
          ],
        ),
      ),
    );
  }
}

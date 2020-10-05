import 'package:flutter/material.dart';

class PetAndUserDisplayScreen extends StatelessWidget {
  final String petName, username, url, days;
  PetAndUserDisplayScreen(
      {@required this.petName,
      @required this.username,
      @required this.url,
      @required this.days});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Icon(Icons.chevron_left, color: Colors.black, size: 32),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(this.petName, style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(this.url),
              radius: 72,
            ),
            SizedBox(
              height: 30,
            ),
            Text("and", style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 30,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.jpg"),
              radius: 72,
            ),
            SizedBox(
              height: 30,
            ),
            Text(this.username.split(' ')[0].toString(),
                style: TextStyle(fontSize: 24)),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Center(
                child: Text("will spend " + this.days + " days together!",
                    style: TextStyle(fontSize: 24)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pop(context), child: Icon(Icons.done)),
    );
  }
}

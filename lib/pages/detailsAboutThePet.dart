import 'package:flutter/material.dart';
import 'checkoutHistory.dart';

class PetDetailsScreen extends StatelessWidget {

  final String name, imgUrl, category, username;
  PetDetailsScreen({
    @required this.name,
    @required this.imgUrl,
    @required this.category,
    @required this.username
  });

  Map<String, dynamic> petDetails = {
    "bird": "loves to chirp and sing on sunny days. She likes to eat flaxseeds and likes to chirp a lot. Ocassionally, she takes a dip and feels very happy after doing so!",
    "dog": "is a lovable creature. He goofs around, loves to go out on long walks, and likes to play fetch.",
    "cat": "is a moody one. She loves to spend her time playing with woolen balls and chasing squirrels. She loves to nibble on cheerios, and is very playful at times."
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 32
            ),
            child: Icon(
              Icons.chevron_left,
              color: Colors.black,
              size: 32,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            Hero(
              tag: this.name,
              child: CircleAvatar(
                backgroundImage: NetworkImage(this.imgUrl),
                radius: 96,
              )
            ),
            SizedBox(
              height: 42,
            ),
            Text(
              this.name,
              style: TextStyle(
                fontSize: 32
                // fontFamily: "Motserrat"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.category,
              style: TextStyle(
                fontSize: 20
                // fontFamily: "Motserrat"
              )
            ),
            SizedBox(
              height: 42,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 32
              ),
              child: Text(
                this.name + ' ' + this.petDetails[this.category.toLowerCase()],
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => CheckoutHistory(
                name: this.name,
                category: this.category,
                description: this.name + ' ' + this.petDetails[this.category.toLowerCase()],
                url: this.imgUrl,
                username: this.username
              )
            )
          ).then((value) => Navigator.pop(context));
        },
        child: Icon(
          Icons.chevron_right
        ),
      )
    );
  }
}
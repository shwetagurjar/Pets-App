import 'package:flutter/material.dart';
import 'petCategorySpecificScreen.dart';
import 'submitPetDetails.dart';

class FosterScreen extends StatefulWidget {
  final String username;
  FosterScreen({@required this.username});

  @override
  _FosterScreenState createState() => _FosterScreenState();
}

class _FosterScreenState extends State<FosterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(Icons.chevron_left, color: Colors.black, size: 28),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Find your pet",
                      style: TextStyle(fontSize: 28),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 36,
              ),
              PetCard(
                  imgUrl: "assets/images/dog.jpg",
                  petCategory: "Dogs",
                  username: widget.username),
              SizedBox(
                height: 20,
              ),
              PetCard(
                  imgUrl: "assets/images/cat.jpg",
                  petCategory: "Cats",
                  username: widget.username),
              SizedBox(
                height: 20,
              ),
              PetCard(
                  imgUrl: "assets/images/birdie.jpeg",
                  petCategory: "Birds",
                  username: widget.username),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      EnterPetDetails(username: widget.username)));
        },
        label: Text('Donate pets'),
        icon: Icon(Icons.pets),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  final String imgUrl, petCategory, username;

  PetCard(
      {@required this.imgUrl,
      @required this.petCategory,
      @required this.username});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PetCategorySpecificSearchScreen(
                      username: this.username,
                      category: this
                          .petCategory
                          .toLowerCase()
                          .substring(0, this.petCategory.length - 1),
                    )));
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.14,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Card(
            child: Stack(children: [
              Image.asset(this.imgUrl, fit: BoxFit.cover),
              Positioned(
                top: 12,
                left: 20,
                child: Text(this.petCategory,
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

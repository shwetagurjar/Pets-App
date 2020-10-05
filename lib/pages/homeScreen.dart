import 'package:flutter/material.dart';

import 'petCategorySpecificScreen.dart';

class HomeScreen extends StatefulWidget {

  final String username;
  HomeScreen({
    @required this.username
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 32
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Find your pet",
                      style: TextStyle(
                        fontSize: 28
                      ),
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
                username: widget.username
              ),
              SizedBox(
                height: 20,
              ),
              PetCard(
                imgUrl: "assets/images/cat.jpg",
                petCategory: "Cats",
                username: widget.username
              ),
              SizedBox(
                height: 20,
              ),
              PetCard(
                imgUrl: "assets/images/birdie.jpeg",
                petCategory: "Birds",
                username: widget.username
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PetCard extends StatelessWidget {
  
  final String imgUrl, petCategory, username;

  PetCard({
    @required this.imgUrl,
    @required this.petCategory,
    @required this.username
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => PetCategorySpecificSearchScreen(
              username: this.username,
              category: this.petCategory.toLowerCase().substring(0, this.petCategory.length - 1),
            )
          )
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 1.14,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Card(
            child: Stack(
              children: [
                Image.asset(
                  this.imgUrl,
                  fit: BoxFit.cover
                ),
                Positioned(
                  top: 12,
                  left: 20,
                  child: Text(
                    this.petCategory,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    )
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
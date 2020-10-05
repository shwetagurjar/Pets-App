import 'package:flutter/material.dart';
import '../utils/Pets.dart';
import 'detailsAboutThePet.dart';

class PetCategorySpecificSearchScreen extends StatefulWidget {
  final String username, category;
  PetCategorySpecificSearchScreen(
      {@required this.username, @required this.category});

  @override
  _PetCategorySpecificSearchScreenState createState() =>
      _PetCategorySpecificSearchScreenState();
}

class _PetCategorySpecificSearchScreenState
    extends State<PetCategorySpecificSearchScreen> {
  List<Widget> petTiles = [];
  List listOfPets = [];

  setPetTiles() {
    for (var pet in petsInfo[widget.category]) {
      pet["category"] = widget.category;
      listOfPets.add(pet);
    }
    listOfPets.shuffle();
    for (var pet in listOfPets) {
      var tempTile = Padding(
        padding: EdgeInsets.symmetric(vertical: 3),
        child: PetTile(
            name: pet["name"],
            url: pet["url"],
            category: pet["category"],
            username: widget.username),
      );
      petTiles.add(tempTile);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setPetTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Icon(Icons.chevron_left, size: 35, color: Colors.black),
          ),
        ),
      ),
      body: petTiles.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: TextField(
                            decoration: InputDecoration(
                          labelText: 'Find your pet',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(36)),
                        )),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Column(children: petTiles)
                    ]),
              ),
            ),
    );
  }
}

class PetTile extends StatelessWidget {
  final String url, name, category, username;

  PetTile(
      {@required this.url,
      @required this.name,
      @required this.category,
      @required this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: ListTile(
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PetDetailsScreen(
                            name: this.name,
                            imgUrl: this.url,
                            category: this.category[0].toUpperCase() +
                                this.category.substring(1),
                            username: this.username)))
                .then((value) => Navigator.pop(context));
          },
          leading: CircleAvatar(
            backgroundImage: NetworkImage(this.url),
            radius: 32,
          ),
          title: Text(
            this.name,
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text(
            this.category[0].toUpperCase() + this.category.substring(1),
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}

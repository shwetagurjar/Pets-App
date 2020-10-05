import 'package:flutter/material.dart';
import '../utils/Pets.dart';
import 'detailsAboutThePet.dart';

class PetsSearchResultScreen extends StatefulWidget {
  final String username;
  PetsSearchResultScreen({@required this.username});

  @override
  _PetsSearchResultScreenState createState() => _PetsSearchResultScreenState();
}

class _PetsSearchResultScreenState extends State<PetsSearchResultScreen> {
  List<Widget> petTiles = [];
  List listOfPets = [];

  setPetTiles() {
    for (var item in petsInfo.keys) {
      for (var pet in petsInfo[item]) {
        pet["category"] = item;
        listOfPets.add(pet);
      }
    }
    listOfPets.shuffle();
    for (var pet in listOfPets) {
      var tempTile = Padding(
        padding: EdgeInsets.symmetric(vertical: 3),
        child: PetListTile(
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
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Find your pet',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(72))),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Column(children: petTiles)
                    ]),
              ),
            ),
    );
  }
}

class PetListTile extends StatelessWidget {
  final String url, name, category, username;

  PetListTile(
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
                        username: this.username)));
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

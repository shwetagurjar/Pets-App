import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets/pages/finalPurchaseScreen.dart';

class CheckoutHistory extends StatefulWidget {
  final String name, category, description, url, username;
  CheckoutHistory(
      {@required this.name,
      @required this.category,
      @required this.description,
      @required this.url,
      @required this.username});

  @override
  _CheckoutHistoryState createState() => _CheckoutHistoryState();
}

class _CheckoutHistoryState extends State<CheckoutHistory> {
  String pickPetDate = 'Select Date';
  String dropPetDate = 'Select Date';
  DateTime selectedDate = DateTime.now();
  DateTime pickPetDateTime;
  DateTime dropPetDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Icon(Icons.chevron_left, color: Colors.black, size: 36),
          ),
        ),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "Checkout History",
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(
          height: 54,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.url),
                radius: 54,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 42),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 28)),
                    SizedBox(
                      height: 8,
                    ),
                    Text(widget.category, style: TextStyle(fontSize: 16))
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 54,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            widget.description,
            style: TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 54,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42),
              child: Text(
                "Pick up date",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: CupertinoButton(
                color: Colors.red,
                child: Row(
                  children: [
                    Icon(Icons.event),
                    SizedBox(
                      width: 15,
                    ),
                    Text(pickPetDate)
                  ],
                ),
                onPressed: () async {
                  var currDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(
                          DateTime.now().year,
                          DateTime.now().month < 11
                              ? DateTime.now().month + 2
                              : DateTime.now().month,
                          DateTime.now().day + 5));
                  if (currDate != null) {
                    var dateTimeString = currDate.day.toString() +
                        "/" +
                        currDate.month.toString() +
                        "/" +
                        currDate.year.toString();
                    setState(() {
                      pickPetDate = dateTimeString;
                      pickPetDateTime = currDate;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 42),
              child: Text(
                "Drop back date",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: CupertinoButton(
                color: Colors.red,
                child: Row(
                  children: [
                    Icon(Icons.event),
                    SizedBox(
                      width: 15,
                    ),
                    Text(dropPetDate)
                  ],
                ),
                onPressed: () async {
                  var currDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(
                          DateTime.now().year,
                          DateTime.now().month < 11
                              ? DateTime.now().month + 2
                              : DateTime.now().month,
                          DateTime.now().day + 5));
                  if (currDate != null) {
                    var dateTimeString = currDate.day.toString() +
                        "/" +
                        currDate.month.toString() +
                        "/" +
                        currDate.year.toString();
                    setState(() {
                      dropPetDate = dateTimeString;
                      dropPetDateTime = currDate;
                    });
                  }
                },
              ),
            )
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (pickPetDateTime != null && dropPetDateTime != null) {
            if (dropPetDateTime.difference(pickPetDateTime).inDays > 0) {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              PetAndUserDisplayScreen(
                                  petName: widget.name,
                                  username: widget.username,
                                  url: widget.url,
                                  days: dropPetDateTime
                                      .difference(pickPetDateTime)
                                      .inDays
                                      .toString())))
                  .then((value) => Navigator.pop(context));
            }
          }
        },
        child: Icon(Icons.chevron_right),
      ),
    );
  }
}

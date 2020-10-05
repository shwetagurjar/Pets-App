import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EnterPetDetails extends StatefulWidget {
  final String username;
  EnterPetDetails({@required this.username});

  @override
  _EnterPetDetailsState createState() => _EnterPetDetailsState();
}

enum PetAction { foster, donate }

class _EnterPetDetailsState extends State<EnterPetDetails> {
  PetAction _activeAction = PetAction.donate;

  FocusNode nameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Icon(Icons.chevron_left, color: Colors.black, size: 32),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Donate',
              style: TextStyle(fontSize: 24.0, fontFamily: "Raleway"),
            ),
            SizedBox(height: 120.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: TextField(
                focusNode: nameFocusNode,
                onSubmitted: (var str) {
                  nameFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(phoneFocusNode);
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  labelStyle: TextStyle(fontFamily: "Raleway"),
                ),
                style: TextStyle(fontFamily: "Raleway"),
                controller: nameController,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: TextField(
                focusNode: phoneFocusNode,
                onSubmitted: (var str) {
                  phoneFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(emailFocusNode);
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    labelText: 'Phone',
                    labelStyle: TextStyle(fontFamily: "Raleway"),
                    border: OutlineInputBorder()),
                style: TextStyle(fontFamily: "Raleway"),
                controller: phoneController,
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: TextField(
                decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(fontFamily: "Raleway"),
                    border: OutlineInputBorder()),
                style: TextStyle(fontFamily: "Raleway"),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                focusNode: emailFocusNode,
                onEditingComplete: () {
                  emailFocusNode.unfocus();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                    value: PetAction.donate,
                    groupValue: _activeAction,
                    onChanged: (PetAction tempAction) {
                      setState(() {
                        _activeAction = tempAction;
                      });
                    }),
                Text("Donate"),
                SizedBox(
                  width: 20,
                ),
                Radio(
                    value: PetAction.foster,
                    groupValue: _activeAction,
                    onChanged: (PetAction tempAction) {
                      setState(() {
                        _activeAction = tempAction;
                      });
                    }),
                Text("Foster")
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: CupertinoButton(
                  color: Colors.red,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.upload_rounded),
                      SizedBox(
                        width: 15,
                      ),
                      Text("Upload Timesheet")
                    ],
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.camera_alt),
            heroTag: "Camera Icon",
          ),
          SizedBox(
            height: 24,
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.chevron_right),
            heroTag: "Done Icon",
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'submitPetDetails.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.input
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.account_circle
                    ),
                  )
                ]
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LoginPage(),
            RegisterPage()
          ]
        ),
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {    
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Raleway"
                ),
              ),
            ],
          ),
          SizedBox(height: 120.0),
          TextField(
            focusNode: usernameFocusNode,
            onSubmitted: (var str){
              usernameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(
                fontFamily: "Raleway"
              ),
            ),
            style: TextStyle(
              fontFamily: "Raleway"
            ),
            controller: usernameController,
          ),
          SizedBox(height: 12.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                fontFamily: "Raleway"
              )
            ),
            style: TextStyle(
              fontFamily: "Raleway"
            ),
            controller: passwordController,
            focusNode: passwordFocusNode,
            onEditingComplete: (){
              passwordFocusNode.unfocus();
            },
            obscureText: true,
          ),
          SizedBox(
            height: 32,
          ),
          CupertinoButton(
            color: Colors.red,
            child: Text(
              "Login"
            ),
            onPressed: (){
              Random random = Random();
              var number = random.nextInt(54);
              number = number < 12 ? number + 12 : number > 36 ? number - 18 : number;
              var username = usernameController.text;
              FocusScope.of(context).requestFocus(usernameFocusNode);
              usernameFocusNode.unfocus();
              usernameController.clear();
              passwordController.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => EnterPetDetails(
                    username: username
                  )
                )
              );
            }
          )
        ],
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {    
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 24.0,
                  fontFamily: "Raleway"
                ),
              ),
            ],
          ),
          SizedBox(height: 120.0),
          TextField(
            focusNode: nameFocusNode,
            onSubmitted: (var str){
              nameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(usernameFocusNode);
            },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              labelText: 'Name',
              labelStyle: TextStyle(
                fontFamily: "Raleway"
              ),
            ),
            style: TextStyle(
              fontFamily: "Raleway"
            ),
            controller: nameController,
          ),
          SizedBox(height: 12.0),
          TextField(
            focusNode: usernameFocusNode,
            onSubmitted: (var str){
              usernameFocusNode.unfocus();
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: TextStyle(
                fontFamily: "Raleway"
              ),
            ),
            style: TextStyle(
              fontFamily: "Raleway"
            ),
            controller: usernameController,
          ),
          SizedBox(height: 12.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: TextStyle(
                fontFamily: "Raleway"
              )
            ),
            style: TextStyle(
              fontFamily: "Raleway"
            ),
            controller: passwordController,
            focusNode: passwordFocusNode,
            onEditingComplete: (){
              passwordFocusNode.unfocus();
            },
            obscureText: true,
          ),
          SizedBox(
            height: 32,
          ),
          CupertinoButton(
            color: Colors.red,
            child: Text(
              "Register"
            ),
            onPressed: (){
              Random random = Random();
              var number = random.nextInt(54);
              number = number > 40 ? number - 18 : number;
              var username = usernameController.text;
              FocusScope.of(context).requestFocus(nameFocusNode);
              nameFocusNode.unfocus();
              nameController.clear();
              usernameController.clear();
              passwordController.clear();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => EnterPetDetails(
                    username: username
                  )
                )
              );
            }
          )
        ],
      ),
    );
  }
}
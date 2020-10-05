import 'package:flutter/material.dart';
import 'homeScreen.dart';
import 'profileScreen.dart';
import 'searchResults.dart';
import 'login.dart';
import 'quizScreen.dart';

class PageSwitcher extends StatefulWidget {
  final String username;
  PageSwitcher({@required this.username});

  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            body: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                children: [
                  HomeScreen(username: widget.username),
                  PetsSearchResultScreen(
                    username: widget.username,
                  ),
                  LoginScreen(),
                  ProfileScreen(),
                  QuizScreen()
                ]),
            bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,
                        color:
                            _controller.index == 0 ? Colors.red : Colors.black),
                    title: Text("Home",
                        style: TextStyle(
                            color: _controller.index == 0
                                ? Colors.red
                                : Colors.black))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search,
                        color:
                            _controller.index == 1 ? Colors.red : Colors.black),
                    title: Text("Search",
                        style: TextStyle(
                            color: _controller.index == 1
                                ? Colors.red
                                : Colors.black))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.pets,
                        color:
                            _controller.index == 2 ? Colors.red : Colors.black),
                    title: Text("Foster",
                        style: TextStyle(
                            color: _controller.index == 2
                                ? Colors.red
                                : Colors.black))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle,
                        color:
                            _controller.index == 3 ? Colors.red : Colors.black),
                    title: Text("Account",
                        style: TextStyle(
                            color: _controller.index == 3
                                ? Colors.red
                                : Colors.black))),
                BottomNavigationBarItem(
                    icon: Icon(Icons.fact_check_outlined,
                        color:
                            _controller.index == 4 ? Colors.red : Colors.black),
                    title: Text("Quiz",
                        style: TextStyle(
                            color: _controller.index == 4
                                ? Colors.red
                                : Colors.black)))
              ],
              type: BottomNavigationBarType.fixed,
              currentIndex: _controller.index,
              onTap: (int _index) {
                setState(() {
                  _controller.index = _index;
                });
              },
            )));
  }
}

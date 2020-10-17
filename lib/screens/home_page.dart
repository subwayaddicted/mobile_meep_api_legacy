import 'package:flutter/material.dart';

import 'about_page.dart';
import 'input_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;
  final List<Widget> _children = [
    InputPage(),
    AboutPage(),
  ];

  void _onItemTapped(int value) {
    setState(() {
      _currentTab = value;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: _children[_currentTab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentTab,
            onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.input,
                    size: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: SizedBox.shrink()),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.info_outline,
                    size: 30,
                  ),
                  // ignore: deprecated_member_use
                  title: SizedBox.shrink()),
            ]));
  }
}

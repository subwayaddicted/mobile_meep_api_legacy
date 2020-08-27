import 'package:flutter/material.dart';

import '../widgets/bookmarkWidget.dart';
import '../widgets/inputWidget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTab = 0;
  final List<Widget> _children = [
    InputWidget(),
    BookmarkWidget(),
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
                  label: 'Input'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_border,
                    size: 30,
                  ),
                  label: 'Bookmark'),
            ]));
  }
}

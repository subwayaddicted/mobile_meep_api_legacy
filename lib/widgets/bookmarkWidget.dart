import 'package:flutter/material.dart';

class BookmarkWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Card(
          child: Text('Please login if you want to use bookmarks'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Card(
          child: Text('Input Page'),
        ),
      ),
    );
  }
}

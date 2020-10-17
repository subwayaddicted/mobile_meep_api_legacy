import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MeepMobile());
}

/// This Widget is the main application widget.
class MeepMobile extends StatelessWidget {
  static const String _title = 'Meep mobile';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
      ),
      home: SafeArea(child: HomePage()),
    );
  }
}

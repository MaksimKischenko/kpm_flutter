import 'package:flutter/material.dart';

import 'screens/screens.dart';


void main() {
  runApp(const KpmApp());
}

class KpmApp extends StatelessWidget {
  const KpmApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
      ),
      home:  const MainMenuScreen() 
    );
  }
}


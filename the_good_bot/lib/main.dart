

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



import 'package:the_good_bot/screens/login_screen.dart';


import 'package:the_good_bot/models/login_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Good Bot',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(122, 165, 210, 1.0),
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
      },
    );
  }
}



import 'package:flutter/material.dart';



/* Importando as telas */
import 'package:the_good_bot/screens/home_screen.dart';
import 'package:the_good_bot/screens/login_screen.dart';



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
        '/tela-inicial': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

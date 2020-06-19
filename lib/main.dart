

import 'package:flutter/material.dart';
import 'package:the_good_bot/views/home_screen.dart';
import 'package:the_good_bot/views/login_screen.dart';



/* Importando as telas */



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
        '/home-screen': (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

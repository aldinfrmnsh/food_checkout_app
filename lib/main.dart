import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WARBUY',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          displayLarge: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.green[800]),
          titleLarge: TextStyle(
              fontSize: 20.0,
              fontStyle: FontStyle.normal,
              color: Colors.green[800]),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black87),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

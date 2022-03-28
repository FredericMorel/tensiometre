import 'package:flutter/material.dart';
import 'package:tensiometre/view/home.dart';
import 'package:tensiometre/view/login.dart';
import 'package:tensiometre/view/suivi.dart';
import 'package:tensiometre/view/take_pressure.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      title: 'TensioMetor',
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginView(),
        '/home': (context) => Home(),
      },
    );
  }
}

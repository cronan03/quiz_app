import 'package:flutter/material.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
import 'package:quiz/screens/score/score_screen.dart';
import 'package:quiz/welcome/welcome_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
      );


  }
}


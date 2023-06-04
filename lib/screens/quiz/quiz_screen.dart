

import 'package:flutter/material.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/screens/quiz/components/body.dart';
//import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Skip"))
        ],
      ),
      body: Body(),
    );
  }
}



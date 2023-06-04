import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  //const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebsafeSvg.asset("assets/icons/endless-constellation.svg",fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2),
                  Text(
                    "Play Quiz,",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                  Text("Enter your name below"),
                  Spacer(),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.purple[300],
                      hintText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      )

                    ),
                  ),
                  Spacer(),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 100,
                    child: Lottie.asset('assets/icons/dr.zip'),
                  ),



                  Spacer(),
                  InkWell(
                    onTap: ()=> Get.to(()=>QuizScreen()),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.cyan,Colors.greenAccent]
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Text(
                        "Start Quiz",
                        style: TextStyle(
                          color: Colors.black,
                        ),

                      ),
                    ),
                  ),
                  Spacer(flex: 2,)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:quiz/models/Questions.dart';
import 'package:websafe_svg/websafe_svg.dart';

import 'Progress_bar.dart';
import 'QuestionCard.dart';

class Body extends StatelessWidget {
  const Body({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    //QuestionController _questionController = Get.put(QuestionController());
    QuestionController _questionController = Get.find();
    return Stack(
      children: [
        WebsafeSvg.asset("assets/icons/endless-constellation.svg",fit: BoxFit.fill),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                ProgressBar(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Obx(
                      ()=>Text.rich(
                        TextSpan(
                            text: "Question ${_questionController.questionNumber.value}",
                            style: TextStyle(
                                color: Colors.white38,
                                fontSize: 40
                            ),
                            children: [
                              TextSpan(
                                text: "/${_questionController.questions.length}",
                                style: TextStyle(
                                  color: Colors.white38,
                                  fontSize: 20,
                                ),

                              )
                            ]
                        ),
                      ),
                  )
                ),
                Divider(thickness: 1.5,),
                SizedBox(height: 20,),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController!,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index]
                    )
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}



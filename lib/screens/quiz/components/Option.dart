import 'package:flutter/material.dart';
import 'package:quiz/controllers/question_controller.dart';
import 'package:get/get.dart';

import '../../../const.dart';
class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.text,
    required this.index,
    required this.press,
  });
  final String text;
  final int index;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      init:   QuestionController(),

      builder: (qnController) {

      Color getTheRightColor() {
        if (qnController.isAnswered) {
          if (index == qnController.correctAns) {
            return kGreenColor;
          } else if (index == qnController.selectedAns &&
              qnController.selectedAns != qnController.correctAns) {
            return kRedColor;
          }
        }
        return kGrayColor;
      }
      IconData getTheRightIcon() {
        return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
      }
        return InkWell(
          onTap: press,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: getTheRightColor()),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${index+1}. ${text}",
                  style: TextStyle(
                      color: getTheRightColor(),
                      fontSize: 15
                  ),
                ),
                Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                    color: getTheRightColor()== kGrayColor
                      ?Colors.transparent
                      :getTheRightColor(),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: getTheRightColor())
                  ),
                  child: getTheRightColor()==kGrayColor
                  ?null
                  :Icon(getTheRightIcon(),size: 16,),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}

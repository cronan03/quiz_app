import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import '../models/Questions.dart';
import '../screens/score/score_screen.dart';

class QuestionController extends GetxController
  with SingleGetTickerProviderMixin{

  // PageController? _pageController;
  // PageController? get pageController => this._pageController;
  late PageController _pageController;
  PageController get pageController => _pageController;


  @override
  void onInit() {
    _pageController = PageController(); // Initialize the page controller
    super.onInit();
  }

  @override
  void onClose() {
    _pageController.dispose();
    super.onClose();
  }



  List<Question> _questions = sample_data
      .map(
          (question) => Question(
          id: question['id'],
          question: question['question'],
          answer: question['answer_index'],
          options: question['options']
      )
  ).toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;


  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

   // if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
   // _animationController.stop();
    update();
    _pageController=PageController();




    Future.delayed(Duration(seconds: 3),(){
      nextQuestion();
    });
  }
  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController?.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      //   // Reset the counter
      //   _animationController.reset();
      //
      //   // Then start it again
      //   // Once timer is finish go to the next qn
      //   _animationController.forward().whenComplete(nextQuestion);
      // } else {
      //   // Get package provide us simple way to naviigate another page
      //   Get.to(ScoreScreen());
    }
    else {
      // Get package provide us simple way to naviigate another page
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index){
    _questionNumber.value=index+1;
  }
//   late AnimationController _animationController;
//   late Animation _animation;
//
//   Animation get anim => this._animation;
//
//   @override
//   void onInit(){
//     _animationController = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 60)
//     );
//     _animation = Tween(begin: 0,end: 1).animate(_animationController)
//     ..addListener(() {
//       update();
//     });
//
//     _animationController.forward();
//
//     super.onInit();
//   }
//

}




import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quiz_me/options.dart';
import 'package:quiz_me/qs.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_thinker.dart';

QuizThinker quizThinker = QuizThinker();

class QuestionScreen extends StatefulWidget {
  final String selectedQuestionsType;

  QuestionScreen({required this.selectedQuestionsType});

  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  void showCompletionAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            icon: Icon(Icons.check,color: Colors.orange,size: 20,),
            title: Text(
              "Quiz Completed!",
              style: TextStyle(color: Colors.green),
            ),
            content: Text(
              "Congratulations on finishing the Quiz!. "
              "You Got $correctAnswersCount Correct!"
              ,
              style: TextStyle(color: Colors.green),
            ),
            actions: <Widget>[
              TextButton(

                child: Text(
                  "Done",
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () async{
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.orange),
                      );
                    },
                  );

                  await Future.delayed(Duration(seconds: 2));
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OptionsScreen(),
                    ),
                  ); // Close the alert dialog
                },
              ),
            ],
          );
        });}


  @override
  void initState() {
    super.initState();

    if (widget.selectedQuestionsType == 'ucl') {
      quizThinker.selectQuestionPath(0);
    } else if (widget.selectedQuestionsType == 'general') {
      quizThinker.selectQuestionPath(1);
    } else if (widget.selectedQuestionsType == 'pl') {
      quizThinker.selectQuestionPath(2);
    }
  }
  List<Icon> scoreKeeper = [];
  int correctAnswersCount = 0; // Counter for correct answers

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizThinker.getQuestionAnswer();

    setState(() {
      if (userAnswer == correctAnswer) {
        correctAnswersCount++;
      }
    }); //"You got: $correctAnswersCount Correct!",

    setState(() {

      if(quizThinker.isFinished() == true) {
        showCompletionAlert(context);

        quizThinker.reset();
        scoreKeeper.clear();
        correctAnswersCount =0;
      }else{
        if(userAnswer==correctAnswer){
          EasyLoading.showSuccess('Correct Answer');
          scoreKeeper.add(Icon(Icons.check,color: Colors.green));
        }else{
          EasyLoading.showError('Wrong Answer');
          scoreKeeper.add(Icon(Icons.close,color: Colors.red,));


        }

        quizThinker.nextQuestion();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/gamescreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: SafeArea(
          child:
          Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: FloatingActionButton(
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.arrow_back, color: Colors.black54),
              onPressed: () async{
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return Center(
                      child: CircularProgressIndicator(color: Colors.orange),
                    );
                  },
                );

                await Future.delayed(Duration(seconds: 2));
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OptionsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),


    Expanded(
    flex: 5,
    child: Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
      child: Text(
      quizThinker.getQuestionText(),
      textAlign: TextAlign.center,
      style: TextStyle(
      fontSize: 25.0,
      color: Colors.white,
      ),
      ),
      ),
    ),
    ),
    ),
    Expanded(
    child: Padding(
    padding: EdgeInsets.all(15.0),
    child: FloatingActionButton(
    backgroundColor: Colors.green,
    child: Text(
    'True',
    style: TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
    ),
    onPressed: () {
    //The user picked true.
    checkAnswer(true);

    },
    ),
    ),
    ),
    Expanded(
    child: Padding(
    padding: EdgeInsets.all(15.0),
    child:  FloatingActionButton(
    backgroundColor: Colors.red,
    child: Text(
    'False',
    style: TextStyle(
    fontSize: 20.0,
    color: Colors.white,
    ),
    ),
    onPressed: () {
    //The user picked false.
    checkAnswer(false);


    },
    ),
    ),
    ),
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
      children: scoreKeeper,
      ),
    ),
    ],
    ),


        ),
      ),
    );
  }
}

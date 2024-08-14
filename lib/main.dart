import 'package:flutter/material.dart';
import 'qs.dart';
import 'quiz_thinker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:quiz_me/options.dart';




void main() => runApp(QuizMe());

class QuizMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: StartPage(),
          ),
        ),
      ),
    );
  }
}
QuizThinker quizThinker = QuizThinker();

class StartPage extends StatefulWidget {
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Container(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text("Football Pop Quiz",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/football_quiz.png'),
                      fit: BoxFit.contain
                  ),
                  border: Border.all(color: Colors.white30),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 100,
                height: 60,
                child: FloatingActionButton(
                  heroTag: "startbutton",
                    backgroundColor: Colors.orangeAccent,
                    child: Text("Start Game!"),
                    onPressed: ()async{
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return Center(
                            child: CircularProgressIndicator(color: Colors.orange,),
                          );
                        },
                      );

                      await Future.delayed(Duration(seconds: 1));
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  OptionsScreen(),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}







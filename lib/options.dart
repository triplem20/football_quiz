
import 'package:flutter/material.dart';
import 'package:quiz_me/question_screen.dart';
import 'main.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/optionscreen.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: FloatingActionButton(
                      backgroundColor: Colors.blueGrey,
                      child: const Icon(
                          Icons.arrow_back, color: Colors.black54),
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
                            builder: (context) => StartPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              _buildOptionTile(
                  context, 'images/ucl.jpg', "Champions League", "ucl",
                  "UCL related questions"),
              _buildOptionTile(
                  context, 'images/general.jpg', "General Knowledge", "general",
                  "General questions about football"),
              _buildOptionTile(
                  context, 'images/premierleague.jpg', "Premier League", "pl",
                  "Premier league Related questions."),
              _buildOptionTile(context, 'images/la_liga.jpg', "La Liga", "liga",
                  "La_liga specific questions")
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context, String imgUrl, String title,
      String questionType, String description) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white30),
      ),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: SizedBox(
          width: 90,
          height: 40,
          child: FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () async {

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


              Navigator.pop(context);


              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      QuestionScreen(selectedQuestionsType: questionType),
                ),
              );
            },
            child: Text('Select Quiz', style: TextStyle(color: Colors.white54)),
          ),
        ),
      ),
    );
  }
}
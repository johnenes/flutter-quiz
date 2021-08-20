import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quize_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}
//TODO  A new class object is Created from he QuizeBrain

QuizBrain quizBrain = QuizBrain();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          appBar: AppBar(
            title: Center(child: Text('Test of Knowledge')),
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: QuizPage(),
          ))),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

 

class _QuizPageState extends State<QuizPage> {
  //Declaring list of icon of a widget = children widget
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userPickAnswer) {
    //TODO: how to figure out the correct answers is correct or wrong
    bool correctAnswers = quizBrain.getCorrectAnswers();

    //TODO: check if what the user pick is the correct answer or wrong one
    //Check if the answer is correct by declaring bool variable
    setState(() {
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scoreKeeper = [];
      } else if (userPickAnswer == correctAnswers) {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green,),);
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red,),);
      }



      //TODO: Increase the question by 1 until the question is exhausted
      quizBrain.nextQuestion();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.qetQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
              padding: EdgeInsets.all(15.0),
              child: TextButton(
                style: TextButton.styleFrom(  
                  backgroundColor: Colors.green, // foreground
                ),
                child: Text(
                  'True',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    letterSpacing: 3.0,
                  ),
                ),
                onPressed: () {
                  checkAnswer(true);
                },
              )),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red, // foreground
              ),

              child: Text('False',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    letterSpacing: 3.0,
                    backgroundColor: Colors.red,
                  )),
              onPressed: () {
                //Check if the answer is correct by declaring bool variable
                checkAnswer(false);
              },
            ),
          ),
        ),
        //TODO: This is where the score enter if the answer is correct or wrong it will be check
        Row(
          //Refering to the list scorekeeper in this row
          children: scoreKeeper,
        )
      ],
    );
  }
}

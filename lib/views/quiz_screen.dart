import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:usafl/quiz_engine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:usafl/constants.dart';
import 'package:usafl/views/home_screen.dart';

QuizEngine quizEngine = QuizEngine();

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizEngine.getCorrectAnswer();

    setState(() {

      if (quizEngine.isFinished() == true) {

        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz.',
        ).show();

        quizEngine.reset();

        scoreKeeper = [];
      }

      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizEngine.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 85.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: const Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 45.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: null,
              child: const Image(
                image: AssetImage('assets/images/USAFL Logo White.png'),
                height: 65.0,
              ),
            ),
            GestureDetector(
              onTap: null,
              child: const Icon(
                Icons.help,
                color: Colors.white,
                size: 45.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 5.0),
            Center(
              child: Text(
                quizEngine.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: usaflBlue,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  quizEngine.getQuestionOptionA(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: usaflBlue,
                  ),
                ),
                Text(
                  quizEngine.getQuestionOptionB(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: usaflBlue,
                  ),
                ),
                Text(
                  quizEngine.getQuestionOptionC(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: usaflBlue,
                  ),
                ),
                Text(
                  quizEngine.getQuestionOptionD(),
                  style: TextStyle(
                    fontSize: 20.0,
                    color: usaflBlue,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: usaflBlue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text('A',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //The user picked true.
                          checkAnswer('A');
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: usaflBlue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text('B',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //The user picked true.
                          checkAnswer('B');
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: usaflBlue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text('C',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //The user picked true.
                          checkAnswer('C');
                        },
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: usaflBlue,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text('D',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          //The user picked true.
                          checkAnswer('D');
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: scoreKeeper,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

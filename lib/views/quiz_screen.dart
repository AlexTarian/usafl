import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:usafl/services/quiz_engine.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/views/home_screen.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';

QuizEngine quizEngine = QuizEngine();

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int correct = 0;
  int incorrect = 0;
  int remaining = quizEngine.questionBank.length;
  var snackBar = const SnackBar(
    content: Text('Correct!',
    style: TextStyle(fontSize: 20.0),
    textAlign: TextAlign.center,),
    backgroundColor: Colors.green,
    duration: Duration(milliseconds: 500),
  );

  void checkIsFinished() {
    int score = ((correct / (correct + incorrect)) * 100).toInt();
    if (quizEngine.isFinished() == false) {
      quizEngine.nextQuestion();
    } else {
      Alert(
        context: context,
        title: correct >= 16 ? 'Good Job!' : 'Try Again?',
        desc: 'You answered $correct questions correctly for a score of $score%',
        buttons: [
          DialogButton(
            color: usaflBlue,
            child: const Text('Home',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              quizEngine.reset();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomeScreen()));
              setState(() {
                correct = 0;
                incorrect = 0;
                remaining = quizEngine.questionBank.length;
              });
            },
          ),
          DialogButton(
            color: usaflBlue,
            child: const Text('Try Again',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () {
              quizEngine.reset();
              Navigator.pop(context);
              setState(() {
                correct = 0;
                incorrect = 0;
                remaining = quizEngine.questionBank.length;
              });
            },
          ),
        ],
      ).show();
    }
  }

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizEngine.getCorrectAnswer();

    if (userPickedAnswer == correctAnswer) {
      setState(() {
        correct++;
        remaining--;
      });
      checkIsFinished();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        incorrect++;
        remaining--;
      });
      checkIsFinished();
      Alert(
        context: context,
        style: AlertStyle(
          isCloseButton: false,
          titleStyle: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: 'Oops...',
        desc: quizEngine.getExplanation(),
        buttons: [
          DialogButton(
            color: Theme.of(context).primaryColor,
            child: const Text('Next',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: Builder(
          builder: (context) {
            return customAppBar(
              iconR: Icons.help,
              onPressedR: () {null;},
            );
          }
        ),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).primaryColorLight,
                  Theme.of(context).primaryColorDark,
                ],
              )
          ),
          child: SafeArea(
            minimum: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      Text('QUESTION ${quizEngine.questionNumber + 1}',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        quizEngine.getQuestionText(),
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      Row(
                        children: <Widget>[
                          const Text('A:  ',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                          Flexible(
                            child: Text(
                              quizEngine.getQuestionOptionA(),
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          const Text('B:  ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              quizEngine.getQuestionOptionB(),
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          const Text('C:  ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              quizEngine.getQuestionOptionC(),
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        children: <Widget>[
                          const Text('D:  ',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              quizEngine.getQuestionOptionD(),
                              style: const TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text('A',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
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
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text('B',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
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
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text('C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
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
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text('D',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              checkAnswer('D');
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Text('Correct: $correct | Incorrect: $incorrect | Remaining: $remaining',
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// AppBar(
// toolbarHeight: 85.0,
// automaticallyImplyLeading: false,
// title: Row(
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: <Widget>[
// Builder(
// builder: (context) => GestureDetector(
// onTap: () {
// Navigator.pop(context);
//
// quizEngine.reset();
// },
// child: const Icon(
// Icons.home,
// color: Colors.white,
// size: 45.0,
// ),
// ),
// ),
// GestureDetector(
// onTap: null,
// child: const Image(
// image: AssetImage('assets/images/USAFL Logo White.png'),
// height: 65.0,
// ),
// ),
// GestureDetector(
// onTap: null,
// child: const Icon(
// Icons.help,
// color: Colors.white,
// size: 45.0,
// ),
// ),
// ],
// ),
// centerTitle: true,
// ),

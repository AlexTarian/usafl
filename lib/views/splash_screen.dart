import 'dart:async';
import 'package:flutter/material.dart';
import 'package:usafl/views/home_screen.dart';
import 'package:usafl/views/profile_screen.dart';
import 'package:usafl/constants.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({required this.isNameSet, required this.userName, required this.userBiz, required this.userState, required this.userReq, required this.userHired, required this.userStart, required this.userEnd, required this.userHours});

  final bool isNameSet;
  final String userName;
  final String userBiz;
  final String userState;
  final String userReq;
  final String userHired;
  final String userStart;
  final String userEnd;
  final String userHours;

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {



  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
        () => widget.isNameSet ? Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen())) :
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => ProfileScreen(
            userName: widget.userName,
            userBiz: widget.userBiz,
            userState: widget.userState,
            userReq: widget.userReq,
            userHired: widget.userHired,
            userStart: widget.userStart,
            userEnd: widget.userEnd,
            userHours: widget.userHours,
        )))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              Center(child: Image(image: AssetImage('assets/images/USAFL Logo.png'))),
              SizedBox(height: 15.0),
              Text('Your Bridge to the Global Workforce',
              style: TextStyle(
                color: usaflBlue,
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// bool checkSetup (bool isNameSet, bool isBizSet, bool isStateSet, bool isReqSet, bool isHiredSet, bool isStartSet, bool isEndSet, bool isHoursSet) {
//   if(isNameSet && isBizSet && isStateSet && isReqSet && isHiredSet && isStartSet && isEndSet && isHoursSet) {
//     return true;
//   } else {
//     return false;
//   }
//
// }

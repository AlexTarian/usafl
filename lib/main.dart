import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usafl/constants.dart';
import 'package:usafl/views/splash_screen.dart';

late SharedPreferences prefs;
String userName = '';
String userBiz = '';
String userState = '';
String userReq = '';
String userHired = '';
String userStart = '';
String userEnd = '';
String userHours = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  getSharedPrefs(prefs);
  runApp(MyApp());
}

void getSharedPrefs(SharedPreferences prefs) async{
  userName = prefs.getString("my_name") ?? '';
  userBiz = prefs.getString("my_biz") ?? '';
  userState = prefs.getString("my_state") ?? '';
  userReq = prefs.getString("my_req") ?? '';
  userHired = prefs.getString("my_hired") ?? '';
  userStart = prefs.getString("my_start") ?? '';
  userEnd = prefs.getString("my_end") ?? '';
  userHours = prefs.getString("my_hired") ?? '';
}



class MyApp extends StatelessWidget {

  bool isNameSet = prefs.getString('my_name') == '' ? false : true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: customColor,
      ),
      home: SplashScreen(
          isNameSet: isNameSet,
          userName: userName,
          userBiz: userBiz,
          userState: userState,
          userReq: userReq,
          userHired: userHired,
          userStart: userStart,
          userEnd: userEnd,
          userHours: userHours,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}








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
bool isLightMode = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  getSharedPrefs(prefs);
  runApp(MyApp());
}

void getSharedPrefs(SharedPreferences prefs) async{
  userName = prefs.getString('my_name') ?? '';
  userBiz = prefs.getString('my_biz') ?? '';
  userState = prefs.getString('my_state') ?? '';
  userReq = prefs.getString('my_req') ?? '';
  userHired = prefs.getString('my_hired') ?? '';
  userStart = prefs.getString('my_start') ?? '';
  userEnd = prefs.getString('my_end') ?? '';
  userHours = prefs.getString('my_hired') ?? '';
  isLightMode = prefs.getBool('my_light') ?? true;
}

class MyApp extends StatefulWidget {
static final ValueNotifier<ThemeMode> themeNotifier = isLightMode ? ValueNotifier(ThemeMode.light) : ValueNotifier(ThemeMode.dark);
static bool aestheticMode = false;

  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  bool isNameSet = prefs.getString('my_name') != '' ? true : false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: MyApp.themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Splash Screen',
        theme: ThemeData(primarySwatch: customPrimaryColor, primaryColor: usaflBlue, primaryColorLight: Colors.white),
        darkTheme: MyApp.aestheticMode ? aestheticTheme : darkTheme,
        themeMode: currentMode,
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
        );
      });
  }
}









import 'package:flutter/material.dart';
import 'main.dart';

const Color usaflBlue = Color(0xFF233271);
const Color usaflAccent = Color(0xFF5b9bd5);
final Color themeColor = MyApp.themeNotifier.value == ThemeMode.light ? const Color(0xFF233271) : const Color(0xFF5b9bd5);
final Color themeTextColor = MyApp.themeNotifier.value == ThemeMode.light ? Colors.black : Colors.white;
final ThemeData darkTheme = ThemeData(primarySwatch: customAccentColor, appBarTheme: const AppBarTheme(color: usaflAccent), primaryColor: usaflAccent, primaryColorLight: Colors.white, brightness: Brightness.dark);
final ThemeData aestheticTheme = ThemeData(
    primarySwatch: customAccentColor,
    scaffoldBackgroundColor: Color(0xFF321a47),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF743eac),
    ),
    primaryColor: usaflAccent,
    primaryColorLight: usaflAccent,
  brightness: Brightness.dark,
);

Map<int, Color> primaryColorCodes =
{
  50:const Color.fromRGBO(35,50,113, .1),
  100:const Color.fromRGBO(35,50,113, .2),
  200:const Color.fromRGBO(35,50,113, .3),
  300:const Color.fromRGBO(35,50,113, .4),
  400:const Color.fromRGBO(35,50,113, .5),
  500:const Color.fromRGBO(35,50,113, .6),
  600:const Color.fromRGBO(35,50,113, .7),
  700:const Color.fromRGBO(35,50,113, .8),
  800:const Color.fromRGBO(35,50,113, .9),
  900:const Color.fromRGBO(35,50,113, 1),
};

MaterialColor customPrimaryColor = MaterialColor(0xFF233271, primaryColorCodes);

Map<int, Color> accentColorCodes =
{
  50:const Color.fromRGBO(91,155,213, .1),
  100:const Color.fromRGBO(91,155,213, .2),
  200:const Color.fromRGBO(91,155,213, .3),
  300:const Color.fromRGBO(91,155,213, .4),
  400:const Color.fromRGBO(91,155,213, .5),
  500:const Color.fromRGBO(91,155,213, .6),
  600:const Color.fromRGBO(91,155,213, .7),
  700:const Color.fromRGBO(91,155,213, .8),
  800:const Color.fromRGBO(91,155,213, .9),
  900:const Color.fromRGBO(91,155,213, 1),
};

MaterialColor customAccentColor = MaterialColor(0xFF5b9bd5, primaryColorCodes);
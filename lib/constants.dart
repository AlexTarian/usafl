import 'package:flutter/material.dart';

const Color usaflBlue = Color(0xFF233271);
const Color usaflAccent = Color(0xFF5b9bd5);

Map<int, Color> colorCodes =
{
  50:Color.fromRGBO(35,50,113, .1),
  100:Color.fromRGBO(35,50,113, .2),
  200:Color.fromRGBO(35,50,113, .3),
  300:Color.fromRGBO(35,50,113, .4),
  400:Color.fromRGBO(35,50,113, .5),
  500:Color.fromRGBO(35,50,113, .6),
  600:Color.fromRGBO(35,50,113, .7),
  700:Color.fromRGBO(35,50,113, .8),
  800:Color.fromRGBO(35,50,113, .9),
  900:Color.fromRGBO(35,50,113, 1),
};

MaterialColor customColor = MaterialColor(0xFF233271, colorCodes);
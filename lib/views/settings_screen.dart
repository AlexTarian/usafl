import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usafl/views/home_screen.dart';
import 'package:usafl/main.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/components/nav_menu.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    // loadInfo();
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
            minimum: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextButton(
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Icon(MyApp.themeNotifier.value == ThemeMode.light
                            ? Icons.dark_mode
                            : Icons.light_mode,
                          color: Theme.of(context).primaryColor),
                        const SizedBox(width: 25.0),
                        Text(
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? 'Switch to Dark Mode'
                              : 'Switch to Light Mode',
                          style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    });
                    setState(() async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      MyApp.themeNotifier.value == ThemeMode.light ? await prefs.setBool('my_light',true) : await prefs.setBool('my_light',false);
                    });
                  },
                  onLongPress: () {
                    if (MyApp.themeNotifier.value == ThemeMode.light) {
                      setState(() {
                        MyApp.aestheticMode =
                        MyApp.aestheticMode
                            ? MyApp.aestheticMode = false
                            : MyApp.aestheticMode = true;
                      });
                      Alert(
                        context: context,
                        style: AlertStyle(
                          isCloseButton: false,
                          titleStyle: TextStyle(
                            color: Color(0xFF7e00ff),
                          ),
                        ),
                        title: MyApp.aestheticMode
                            ? 'a e s t h e t i c: Enabled'
                            : 'a e s t h e t i c: Disabled',
                        buttons: [
                          DialogButton(
                            color: Color(0xFF7e00ff),
                            child: Text(MyApp.aestheticMode ? 'Rad!' : 'Okay',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ).show();
                    }
                  }
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
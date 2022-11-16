import 'package:flutter/material.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      drawerEnableOpenDragGesture: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(85.0),
        child: Builder(builder: (context) {
          return customAppBar(
              iconR: Icons.help,
              onPressedR: () {
                null;
              });
        }),
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
            )),
            child: SafeArea(
              minimum: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text('©2022 USA Farm Labor, Inc. All Rights Reserved.',
                      style: TextStyle(fontSize: 18.0)),
                  SizedBox(height: 30.0),
                  Text(
                      'Since 2003, USA Farm Labor, Inc. has been serving farmers by providing assistance with the H-2A Program. Our mission is to connect American farmers to the global workforce and help them find the workers they need. Unlike agencies who settle for just connecting employers with available workers, our focus is on helping employers and workers alike succeed. Because of our dedication to helping employers and workers alike in every phase of the program, we have earned a reputation for integrity, dependability, and excellent customer service.',
                      style: TextStyle(fontSize: 18.0)),
                  SizedBox(height: 30.0),
                  Text('App Version: 1.0.', style: TextStyle(fontSize: 18.0)),
                  SizedBox(height: 5.0),
                  Row(
                    children: <Widget>[
                      Text('App Developer:', style: TextStyle(fontSize: 18.0)),
                      TextButton(
                          onPressed: () {
                            Alert(
                              context: context,
                              title: 'Hello there!',
                              desc: 'My name is Alex! I\'m a Flutter App Developer! If you\'re looking for someone to develop a specialized app for your business, let me know! I\'d love to earn your business!\n\nYou can reach me at: atcracchiolo@gmail.com\n\nBy the way, I\'ve hidden a surprise in this app. To find it, press and hold the moon icon, then switch the app into dark mode. Enjoy!',
                              buttons: [
                                DialogButton(
                                  color: Theme.of(context).primaryColor,
                                  child: const Text(
                                    'Got it!',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ).show();
                          },
                          child: Text('Alex Cracchiolo',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700))),
                    ],
                  ),
                  SizedBox(height: 30.0),
                ],
              ),
            )),
      ),
    );
  }
}

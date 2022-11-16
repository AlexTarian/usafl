import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:usafl/views/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  late String userName;
  late String userBiz;
  late String userState;
  late String userReq;
  late String userHired;
  late String userStart;
  late String userEnd;
  late String userHours;
  //late bool aesthetic;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void loadInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget.userName = (prefs.getString('my_name') ?? '');
      widget.userBiz = (prefs.getString('my_biz') ?? '');
      widget.userState = (prefs.getString('my_state') ?? '');
      widget.userReq = (prefs.getString('my_req') ?? '');
      widget.userHired = (prefs.getString('my_hired') ?? '');
      widget.userStart = (prefs.getString('my_start') ?? '');
      widget.userEnd = (prefs.getString('my_end') ?? '');
      widget.userHours = (prefs.getString('my_hours') ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    loadInfo();
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
                iconR: Icons.person_outline_rounded,
                onPressedR: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>
                    (ProfileScreen(
                      userName: widget.userName,
                      userBiz: widget.userBiz,
                      userState: widget.userState,
                      userReq: widget.userReq,
                      userHired: widget.userHired,
                      userStart: widget.userStart,
                      userEnd: widget.userEnd,
                      userHours: widget.userHours
                  ))));
                }
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
          child: Center(
              child: Text(
            "Home page",
            textScaleFactor: 2,
          )),
        ),
      ),
    );
  }
}



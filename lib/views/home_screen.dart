import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      appBar: AppBar(
        toolbarHeight: 85.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () => Scaffold.of(context).openDrawer(),
                child: const Icon(
                  Icons.menu,
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
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => (ProfileScreen(
                        userName: widget.userName,
                        userBiz: widget.userBiz,
                        userState: widget.userState,
                        userReq: widget.userReq,
                        userHired: widget.userHired,
                        userStart: widget.userStart,
                        userEnd: widget.userEnd,
                        userHours: widget.userHours
                    ))));
              },
              child: Icon(
                Icons.person_outline_rounded,
                color: Colors.white,
                size: 45.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: const Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}

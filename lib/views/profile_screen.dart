import 'package:flutter/material.dart';
import 'package:usafl/components/profile_text_box.dart';
import 'package:usafl/constants.dart';
import 'package:usafl/views/home_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({required this.userName, required this.userBiz, required this.userState, required this.userReq, required this.userHired, required this.userStart, required this.userEnd, required this.userHours,});

  late String? userName;
  late String? userBiz;
  late String? userState;
  late String? userReq;
  late String? userHired;
  late String? userStart;
  late String? userEnd;
  late String? userHours;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        toolbarHeight: 85.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Builder(
              builder: (context) => GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: const Icon(
                  Icons.home,
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
              onTap: null,
              child: const Icon(
                Icons.help,
                color: Colors.white,
                size: 45.0,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ProfileTextBox(
                controller: TextEditingController(text: userName),
                valueKey: 'my_name',
                hintText: 'Your Name',
                text: 'Your Name',
                contents: 'Please enter your full name.',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userBiz),
                valueKey: 'my_biz',
                hintText: 'Business Name',
                text: 'Business Name',
                contents: 'Please enter the name of your business.',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userState),
                valueKey: 'my_state',
                hintText: 'State',
                text: 'State',
                contents:
                    'Please enter the state in which work will be performed. If work will be performed in multiple states, please choose "multiple".',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userReq),
                valueKey: 'my_req',
                hintText: 'Workers Requested',
                text: 'Workers Requested',
                contents: 'Please enter the number of workers you would like to hire.',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userHired),
                valueKey: 'my_hired',
                hintText: 'Workers Already Hired',
                text: 'Workers Already Hired',
                contents: 'Please enter the number of workers you have already h0ired from the number of workers requested.',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userStart),
                valueKey: 'my_start',
                hintText: 'Start Date',
                text: 'Start Date',
                contents: 'Please enter the date on which you want workers to begin working.',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userEnd),
                valueKey: 'my_end',
                hintText: 'End Date',
                text: 'End Date',
                contents: 'Please enter the date on which you want workers to stop working.',
              ),
              const SizedBox(height: 10.0),
              ProfileTextBox(
                controller: TextEditingController(text: userHours),
                valueKey: 'my_hours',
                hintText: 'Est. Hours Per Week',
                text: 'Est. Hours Per Week',
                contents:
                'Please enter the number of hours you estimate workers will be working per week AS SPECIFIED ON YOUR ETA 790.',
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}

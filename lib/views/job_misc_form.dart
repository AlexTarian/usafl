import 'package:flutter/material.dart';
import 'package:usafl/components/application_list.dart';
//import 'package:usafl/constants.dart';
//import 'package:intl/intl.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:usafl/components/extra_worksite_list.dart';
//import 'package:usafl/components/worksite_picker.dart';
//import 'package:collection/collection.dart';


class ApplicationMiscInfo extends StatefulWidget {
  const ApplicationMiscInfo({
    super.key,
    //required this.
  });

  //final

  @override
  State<ApplicationMiscInfo> createState() => _ApplicationMiscInfoState();
}

class _ApplicationMiscInfoState extends State<ApplicationMiscInfo> {
  bool toggleAlt = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 40.0),
            ApplicationSwitch(
              label: 'Have you used the H-2A Program before?',
              toggle: toggleAlt,
              onChanged: (value) {},
            ),
            ApplicationSwitch(
              label: 'Have you already selected Workers?',
              toggle: toggleAlt,
              onChanged: (value) {},
            ),
            ApplicationSwitch(
              label: 'Are you willing to train workers?',
              toggle: toggleAlt,
              onChanged: (value) {},
            ),
            ApplicationSwitch(
              label: 'Are you willing to hire workers who smoke?',
              toggle: toggleAlt,
              onChanged: (value) {},
            ),
            ApplicationSwitch(
              label:
              'Are you willing to accommodate worker family members?',
              toggle: toggleAlt,
              onChanged: (value) {},
            ),
            ApplicationSwitch(
              label: 'Previous Experience Preferred',
              toggle: toggleAlt,
              onChanged: (value) {},
            ),
            const SizedBox(height: 40.0),
            const SizedBox(height: 500.0),
          ],
        ),
      ),
    );
  }
}
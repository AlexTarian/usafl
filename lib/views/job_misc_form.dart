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
    required this.prevH2aUse,
    required this.selectedWorkers,
    required this.willTrainWorkers,
    required this.smokingOkay,
    required this.familiesOkay,
    required this.prevExpPref,
  });

  final TextEditingController prevH2aUse;
  final TextEditingController selectedWorkers;
  final TextEditingController willTrainWorkers;
  final TextEditingController smokingOkay;
  final TextEditingController familiesOkay;
  final TextEditingController prevExpPref;

  @override
  State<ApplicationMiscInfo> createState() => _ApplicationMiscInfoState();
}

class _ApplicationMiscInfoState extends State<ApplicationMiscInfo> {
  bool toggleAlt = false;
  bool prevH2aUse = false;
  bool selectedWorkers = false;
  bool willTrainWorkers = false;
  bool smokingOkay = false;
  bool familiesOkay = false;
  bool prevExpPref = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      body: Container(
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
          minimum: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: const <Widget>[
                      Icon(Icons.arrow_back, size: 30.0),
                      SizedBox(width: 10.0),
                      Text('Back', style: TextStyle(fontSize: 18.0)),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                ApplicationSwitch(
                  label: 'Have you used the H-2A Program before?',
                  toggle: prevH2aUse,
                  onChanged: (value) {
                    setState(() {
                      prevH2aUse = value;
                      value
                          ? widget.prevH2aUse.text = 'true'
                          : widget.prevH2aUse.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Have you already selected Workers?',
                  toggle: selectedWorkers,
                  onChanged: (value) {
                    setState(() {
                      selectedWorkers = value;
                      value
                          ? widget.selectedWorkers.text = 'true'
                          : widget.selectedWorkers.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Are you willing to train workers?',
                  toggle: willTrainWorkers,
                  onChanged: (value) {
                    setState(() {
                      willTrainWorkers = value;
                      value
                          ? widget.willTrainWorkers.text = 'true'
                          : widget.willTrainWorkers.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Are you willing to hire workers who smoke?',
                  toggle: smokingOkay,
                  onChanged: (value) {
                    setState(() {
                      smokingOkay = value;
                      value
                          ? widget.smokingOkay.text = 'true'
                          : widget.smokingOkay.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label:
                      'Are you willing to accommodate workers\' family members?',
                  toggle: familiesOkay,
                  onChanged: (value) {
                    setState(() {
                      familiesOkay = value;
                      value
                          ? widget.familiesOkay.text = 'true'
                          : widget.familiesOkay.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Previous Experience Preferred',
                  toggle: prevExpPref,
                  onChanged: (value) {
                    setState(() {
                      prevExpPref = value;
                      value
                          ? widget.prevExpPref.text = 'true'
                          : widget.prevExpPref.text = 'false';
                    });
                  },
                ),
                const SizedBox(height: 500.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

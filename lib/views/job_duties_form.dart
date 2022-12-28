import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:usafl/views/application_viewer_screen.dart';
import 'package:usafl/components/application_list.dart';
import 'package:usafl/components/job_duties_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ApplicationDutiesInfo extends StatefulWidget {
  const ApplicationDutiesInfo({
    super.key,
    required this.jobDescription,
    required this.jobDescriptionEditor,
    required this.taskList,
    required this.allTasks,
    required this.aeoTasks,
    required this.genTasks,
    required this.livTasks,
    required this.mecTasks,
    required this.winTasks,
    required this.dutyCount,
  });

  final TextEditingController jobDescription;
  final TextEditingController jobDescriptionEditor;
  final List<bool> taskList;
  final TextEditingController allTasks;
  final TextEditingController aeoTasks;
  final TextEditingController genTasks;
  final TextEditingController livTasks;
  final TextEditingController mecTasks;
  final TextEditingController winTasks;
  final TextEditingController dutyCount;

  @override
  State<ApplicationDutiesInfo> createState() => _ApplicationDutiesInfoState();
}

class _ApplicationDutiesInfoState extends State<ApplicationDutiesInfo> {

  double countCompleted() {
    int sum = (widget.jobDescription.text != 'Job Duties include: ' ? 1 : 0);
    return sum/1;
  }

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
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.dutyCount.text = countCompleted().toString();
                    });
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
                TextButton(
                  child: Container(
                    width: double.infinity,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Select from Task Library',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Alert(
                      context: context,
                      image: ApplicationDutyPicker(
                          jobDescription: widget.jobDescription,
                          jobDescriptionEditor: widget.jobDescriptionEditor,
                          taskList: widget.taskList,
                          allTasks: widget.allTasks,
                          aeoTasks: widget.aeoTasks,
                          genTasks: widget.genTasks,
                          livTasks: widget.livTasks,
                          mecTasks: widget.mecTasks,
                          winTasks: widget.winTasks),
                      buttons: [
                        DialogButton(
                          color: usaflAccent,
                          child: const Text(
                            'Cancel',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        DialogButton(
                          color: usaflAccent,
                          child: const Text(
                            'Save',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            setState(() {});
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ).show();
                  },
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: (MediaQuery.of(context).size.height) * .6,
                  child: ApplicationTextField(
                    label: 'Job Duties (Tap to Edit)',
                    controller: widget.jobDescription,
                    expands: true,
                  ),
                ),
                // const SizedBox(height: 30.0),
                // TextButton(
                //   child: Container(
                //     width: double.infinity,
                //     height: 45.0,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColor,
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     child: const Center(
                //       child: Text('Save & Continue',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 24.0,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       widget.dutyCount.text = countCompleted().toString();
                //     });
                //     Navigator.pop(context);
                //   },
                // ),
                const SizedBox(height: 500.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

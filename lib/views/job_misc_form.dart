import 'package:flutter/material.dart';
import 'package:usafl/components/application_text_field.dart';
//import 'package:usafl/views/application_viewer_screen.dart';
import 'package:usafl/constants.dart';
//import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:usafl/components/extra_worksite_list.dart';
//import 'package:usafl/components/worksite_picker.dart';
//import 'package:collection/collection.dart';

class ApplicationMiscInfo extends StatefulWidget {
  const ApplicationMiscInfo({
    super.key,
    required this.meals,
    required this.allowableMealCharge,
    required this.prevH2aUse,
    required this.selectedWorkers,
    required this.willTrainWorkers,
    required this.smokingOkay,
    required this.familiesOkay,
    required this.prevExpPref,
    required this.miscCount,
  });

  final TextEditingController meals;
  final TextEditingController allowableMealCharge;
  final TextEditingController prevH2aUse;
  final TextEditingController selectedWorkers;
  final TextEditingController willTrainWorkers;
  final TextEditingController smokingOkay;
  final TextEditingController familiesOkay;
  final TextEditingController prevExpPref;
  final TextEditingController miscCount;

  @override
  State<ApplicationMiscInfo> createState() => _ApplicationMiscInfoState();
}

class _ApplicationMiscInfoState extends State<ApplicationMiscInfo> {
  double countCompleted() {
    int sum = (widget.meals.text != '' ? 1 : 0) +
        ((widget.meals.text == 'Furnish free kitchen facilities' || widget.allowableMealCharge.text != 'Select') ? 1 : 0) +
        (widget.prevH2aUse.text != 'Select' ? 1 : 0) +
        (widget.selectedWorkers.text != 'Select' ? 1 : 0) +
        (widget.willTrainWorkers.text != 'Select' ? 1 : 0) +
        (widget.smokingOkay.text != 'Select' ? 1 : 0) +
        (widget.familiesOkay.text != 'Select' ? 1 : 0) +
        (widget.prevExpPref.text != 'Select' ? 1 : 0);
    return sum / 8;
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
              children: <Widget>[
                const SizedBox(height: 20.0),
                TextButton(
                  onPressed: () {
                    setState(() {
                      widget.miscCount.text = countCompleted().toString();
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
                InkWell(
                  child: IgnorePointer(
                    child: ApplicationTextField(
                      label: 'Meal Arrangements',
                      controller: widget.meals,
                    ),
                  ),
                  onTap: () {
                    Alert(
                      context: context,
                      title: 'Which option would you like to choose?',
                      image: const Text('In the H-2A Program, employers are partially responsible for meals. You have two options:\n\n1) Provide workers with free & convenient cooking facilities in their housing and weekly trips to a grocery store.\n\nor\n\n2) Provide 3 sanitary, calorically sufficient meals per day.'),
                      buttons: [
                        DialogButton(
                          color: usaflAccent,
                          child: const Text(
                            'Option 1',
                            style:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.meals.text = 'Furnish free kitchen facilities';
                            });
                            Navigator.pop(context);
                          },
                        ),
                        DialogButton(
                          color: usaflAccent,
                          child: const Text(
                            'Option 2',
                            style:
                            TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.meals.text = 'Provide three free meals per day';
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ).show();
                  },
                ),
                Visibility(
                    visible: widget.meals.text == 'Provide three free meals per day',
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              const Flexible(
                                flex: 3,
                                child: Text(
                                  'If you provide three meals per day, you may, optionally, deduct from each worker\'s pay, the Allowable Meal Charge (as set by the Department of Labor) every day. Would you like to make this deduction?',
                                  style: TextStyle(fontSize: 20.0),
                                ),
                              ),
                              const SizedBox(width: 15.0),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    value: widget.allowableMealCharge.text,
                                    elevation: 16,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Theme.of(context).primaryColor),
                                    underline: Container(
                                      width: double.infinity,
                                      height: 2,
                                      color: Colors.transparent,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        widget.allowableMealCharge.text = newValue!;
                                      });
                                    },
                                    items: ['Select', 'Yes', 'No']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        flex: 3,
                        child: Text(
                          'Have you used the H-2A Program before?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: widget.prevH2aUse.text,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor),
                            underline: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.prevH2aUse.text = newValue!;
                              });
                            },
                            items: ['Select', 'Yes', 'No']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        flex: 3,
                        child: Text(
                          'Have you already selected workers?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: widget.selectedWorkers.text,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor),
                            underline: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.selectedWorkers.text = newValue!;
                              });
                            },
                            items: ['Select', 'Yes', 'No']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        flex: 3,
                        child: Text(
                          'Are you willing to train workers?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: widget.willTrainWorkers.text,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor),
                            underline: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.willTrainWorkers.text = newValue!;
                              });
                            },
                            items: ['Select', 'Yes', 'No']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        flex: 3,
                        child: Text(
                          'Are you willing to hire workers who smoke?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: widget.smokingOkay.text,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor),
                            underline: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.smokingOkay.text = newValue!;
                              });
                            },
                            items: ['Select', 'Yes', 'No']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        flex: 3,
                        child: Text(
                          'Are you willing to house workers\' family members?',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: widget.familiesOkay.text,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor),
                            underline: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.familiesOkay.text = newValue!;
                              });
                            },
                            items: ['Select', 'Yes', 'No']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Flexible(
                        flex: 3,
                        child: Text(
                          'Previous Experience Preferred',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      const SizedBox(width: 15.0),
                      Flexible(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor),
                          ),
                          child: DropdownButton<String>(
                            isExpanded: true,
                            value: widget.prevExpPref.text,
                            elevation: 16,
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Theme.of(context).primaryColor),
                            underline: Container(
                              width: double.infinity,
                              height: 2,
                              color: Colors.transparent,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                widget.prevExpPref.text = newValue!;
                              });
                            },
                            items: ['Select', 'Yes', 'No']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
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
                        'Save & Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      widget.miscCount.text = countCompleted().toString();
                    });
                    Navigator.pop(context);
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

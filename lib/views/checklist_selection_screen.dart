import 'package:flutter/material.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/housing_checklist.dart';
import 'package:usafl/components/bedroom_checklist.dart';
import 'package:usafl/components/bathroom_checklist.dart';
import 'package:usafl/components/arrival_checklist.dart';
import 'package:usafl/components/payment_checklist.dart';
import 'package:usafl/components/departure_checklist.dart';
import 'package:usafl/components/misc_checklist.dart';
import 'package:usafl/components/audit_checklist.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:usafl/components/icon_box_button.dart';
import 'package:usafl/views/checklist_viewer_screen.dart';

class ChecklistScreen extends StatefulWidget {
  ChecklistScreen({super.key, this.isLevelOne = true});

  bool isLevelOne;

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {

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
            },
          );
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
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? true : false, child: IconBoxButton(icon: Icons.house, text: 'Housing Inspection')),
                  onTap: () {
                    setState(() {
                      widget.isLevelOne = false;
                    });
                  },
                  ),
                  Visibility(visible: widget.isLevelOne ? true : false, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? true : false, child: IconBoxButton(icon: Icons.airplane_ticket, text: 'Arrival')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: ArrivalChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? true : false, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? true : false, child: IconBoxButton(icon: Icons.attach_money, text: 'Payment')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: PaymentChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? true : false, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? true : false, child: IconBoxButton(icon: Icons.airplane_ticket_outlined, text: 'Departure')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: DepartureChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? true : false, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? true : false, child: IconBoxButton(icon: Icons.question_mark, text: 'Miscellaneous')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: MiscChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? true : false, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? true : false, child: IconBoxButton(icon: Icons.fact_check, text: 'Audit')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: AuditChecklist()))));
                    },
                  ),
                  Visibility(
                    visible: widget.isLevelOne ? false : true,
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          widget.isLevelOne = true;
                        });
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.arrow_back, size: 30.0),
                          SizedBox(width: 10.0),
                          Text('Back', style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                  ),
                  Visibility(visible: widget.isLevelOne ? false : true, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? false : true, child: IconBoxButton(icon: Icons.yard, text: 'Grounds')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: HousingChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? false : true, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? false : true, child: IconBoxButton(icon: Icons.kitchen, text: 'Kitchen')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: HousingChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? false : true, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? false : true, child: IconBoxButton(icon: Icons.bedroom_parent, text: 'Bedroom')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: BedroomChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? false : true, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? false : true, child: IconBoxButton(icon: Icons.bathroom, text: 'Bathroom')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: BathroomChecklist()))));
                    },
                  ),
                  Visibility(visible: widget.isLevelOne ? false : true, child: const SizedBox(height: 10.0)),
                  GestureDetector(child: Visibility(visible: widget.isLevelOne ? false : true, child: IconBoxButton(icon: Icons.house, text: 'Miscellaneous')),
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistViewer(selectedChecklist: HousingChecklist()))));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


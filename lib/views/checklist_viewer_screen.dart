import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/views/checklist_selection_screen.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:usafl/services/sql_helper.dart';

class ChecklistViewer extends StatefulWidget {
  const ChecklistViewer({super.key, required this.selectedChecklist});

  final dynamic selectedChecklist;

  @override
  State<ChecklistViewer> createState() => _ChecklistViewerState();
}

class _ChecklistViewerState extends State<ChecklistViewer> {

  int complete = 0;
  int incomplete = 0;
  late int remaining = widget.selectedChecklist.checklist.length;
  late double percent = (complete + incomplete)/remaining;
  double gradientStop = 0;
  late bool isNotHousing = widget.selectedChecklist.getCategory() == 'Grounds' || widget.selectedChecklist.getCategory() == 'Kitchen' || widget.selectedChecklist.getCategory() == 'Bedrooms' || widget.selectedChecklist.getCategory() == 'Bathrooms' || widget.selectedChecklist.getCategory() == 'MiscHousing' ? false : true;
  late bool isComplete = false;

  void checkIsFinished() {

    if (complete < widget.selectedChecklist.checklist.length) {
      widget.selectedChecklist.nextQuestion();
    } else {
      setState(() {
        isComplete = true;
      });
    }
  }

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
            onPressedR: () {null;},
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
              )
          ),
          child: SafeArea(
            minimum: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => (ChecklistScreen(
                              isLevelOne: isNotHousing,
                          ))));
                        },
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.arrow_back, size: 30.0),
                          SizedBox(width: 10.0),
                          Text('Back to Checklists', style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[Theme.of(context).primaryColor.withOpacity(0.5),Colors.transparent],
                          stops: <double>[gradientStop,gradientStop],
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: Theme.of(context).primaryColor, width: 3),
                      ),
                      child: Center(
                        child: Text('PROGRESS',style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w700)),
                      )
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.selectedChecklist.itemNumber > 0 ? widget.selectedChecklist.itemNumber-- : null;
                              });
                            },
                            icon: Icon(Icons.arrow_circle_left, size: 30.0, color: Theme.of(context).primaryColor)),
                        Column(
                          children: <Widget>[
                            Text('Item ${widget.selectedChecklist.itemNumber + 1}/${widget.selectedChecklist.checklist.length}', style: const TextStyle(fontSize: 18.0),),
                            Text('Status: ${widget.selectedChecklist.getValue() == true ? 'Complete' : 'Incomplete'}', style: const TextStyle(fontSize: 18.0),)
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                widget.selectedChecklist.itemNumber < widget.selectedChecklist.checklist.length - 1 ? widget.selectedChecklist.itemNumber++ : null;
                              });
                            },
                            icon: Icon(Icons.arrow_circle_right, size: 30.0, color: Theme.of(context).primaryColor)),
                      ],
                    ),
                    const SizedBox(height: 5.0),
                    SingleChildScrollView(
                      child: Text(
                        widget.selectedChecklist.getItem(),
                        style: const TextStyle(
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'Incomplete',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              String note = '';
                              Alert(
                                context: context,
                                style: AlertStyle(
                                  titleStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 24.0),
                                ),
                                title: 'Add to To-Do List',
                                desc: 'Would you like to add a note to help describe the issue? Notes will appear on your To-do List.',
                                content: TextField(
                                  style: const TextStyle(color: Colors.black, fontSize: 24.0),
                                  autofocus: true,
                                  onChanged: (value) {
                                    note = value;
                                  },
                                ),
                                buttons: [
                                  DialogButton(
                                    color: themeColor,
                                    child: const Text('Cancel',
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  DialogButton(
                                    color: themeColor,
                                    child: const Text('Add Item',
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      SQLHelper.createItem(widget.selectedChecklist.getCategory(), note=='' ? widget.selectedChecklist.getItem() : '$note: ${widget.selectedChecklist.getItem()}');
                                      if(widget.selectedChecklist.getValue()==true) {
                                        widget.selectedChecklist.setValue(false);
                                        incomplete++;
                                        complete--;
                                        remaining++;
                                      }
                                      setState(() {
                                        gradientStop = complete/widget.selectedChecklist.checklist.length;
                                      });
                                      checkIsFinished();
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ).show();
                            },
                          ),
                        ),
                        Expanded(
                          child: TextButton(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: const Center(
                                child: Text(
                                  'Complete',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () {
                              if(widget.selectedChecklist.getValue()==false) {
                                widget.selectedChecklist.setValue(true);
                                setState(() {
                                  complete++;
                                  remaining--;
                                  gradientStop = complete/
                                      widget.selectedChecklist.checklist.length;
                                });
                                checkIsFinished();
                              } else{
                                setState(() {
                                  widget.selectedChecklist.itemNumber < widget.selectedChecklist.checklist.length - 1 ? widget.selectedChecklist.itemNumber++ : null;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// final groundsKey = GlobalKey();
// final waterKey = GlobalKey();
// final houseKey = GlobalKey();
// final bedroomsKey = GlobalKey();
// final kitchenKey = GlobalKey();
// final bathroomsKey = GlobalKey();
// final washingKey = GlobalKey();
// final safetyKey = GlobalKey();
// final pestsKey = GlobalKey();
// final garbageKey = GlobalKey();
// final miscKey = GlobalKey();
//
// ScrollController scrollController = ScrollController();
//
// void scrollAnimated() {
//   String category = widget.selectedChecklist.getCategory();
//
//   if(category == 'Grounds') {
//     Scrollable.ensureVisible(groundsKey.currentContext!);
//   } else if (category == 'Water') {
//     Scrollable.ensureVisible(waterKey.currentContext!);
//   } else if (category == 'House') {
//     Scrollable.ensureVisible(houseKey.currentContext!);
//   } else if (category == 'Kitchen') {
//     Scrollable.ensureVisible(kitchenKey.currentContext!);
//   } else if (category == 'Washing') {
//     Scrollable.ensureVisible(washingKey.currentContext!);
//   } else if (category == 'Safety') {
//     Scrollable.ensureVisible(safetyKey.currentContext!);
//   } else if (category == 'Pests') {
//     Scrollable.ensureVisible(pestsKey.currentContext!);
//   } else if (category == 'Garbage') {
//     Scrollable.ensureVisible(garbageKey.currentContext!);
//   }
// }
//
// @override
// void initState() {
//   scrollController.addListener(() { //listener
//     setState(() {
//
//     });
//   });
//   super.initState();
// }
// SingleChildScrollView(
// controller: scrollController,
// scrollDirection: Axis.horizontal,
// padding: const EdgeInsets.symmetric(horizontal: 20.0),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: <Widget>[
// IconButton(
// key: groundsKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 0;});},
// icon: Icon(Icons.landscape, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Grounds' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: waterKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 11;});},
// icon: Icon(Icons.water_drop, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Water' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: houseKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 13;});},
// icon: Icon(Icons.house, size: 40.0, color: widget.selectedChecklist.getCategory() == 'House' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: kitchenKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 38;});},
// icon: Icon(Icons.kitchen, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Kitchen' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: washingKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 49;});},
// icon: Icon(Icons.local_laundry_service,
// size: 40.0, color: widget.selectedChecklist.getCategory() == 'Washing' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: safetyKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 61;});},
// icon:
// Icon(Icons.health_and_safety, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Safety' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: pestsKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 65;});},
// icon: Icon(Icons.bug_report, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Pests' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: garbageKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 66;});},
// icon: Icon(Icons.recycling, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Garbage' ? Theme.of(context).primaryColor : Colors.grey)),
// const SizedBox(width: 15.0),
// IconButton(
// key: miscKey,
// onPressed: () {setState(() {widget.selectedChecklist.itemNumber = 71;});},
// icon: Icon(Icons.question_mark, size: 40.0, color: widget.selectedChecklist.getCategory() == 'Miscellaneous' ? Theme.of(context).primaryColor : Colors.grey)),
// ],
// ),
// ),

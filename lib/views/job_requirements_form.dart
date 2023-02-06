import 'package:flutter/material.dart';
// import 'package:usafl/views/application_viewer_screen.dart';
import 'package:usafl/components/application_text_field.dart';
import 'package:usafl/components/application_switch.dart';

class ApplicationRequirementInfo extends StatefulWidget {
  const ApplicationRequirementInfo({
    super.key,
    required this.education,
    required this.experience,
    required this.training,
    required this.drivingReq,
    required this.cdlReq,
    required this.certReq,
    required this.backgroundReq,
    required this.screenReq,
    required this.tempReq,
    required this.pushReq,
    required this.walkReq,
    required this.stoopReq,
    required this.repReq,
    required this.liftReq,
    required this.superReq,
    required this.pounds,
    required this.supervised,
    required this.otherReq,
    required this.requirementCount,
  });

  final TextEditingController education;
  final TextEditingController experience;
  final TextEditingController training;
  final TextEditingController drivingReq;
  final TextEditingController cdlReq;
  final TextEditingController certReq;
  final TextEditingController backgroundReq;
  final TextEditingController screenReq;
  final TextEditingController tempReq;
  final TextEditingController pushReq;
  final TextEditingController walkReq;
  final TextEditingController stoopReq;
  final TextEditingController repReq;
  final TextEditingController liftReq;
  final TextEditingController superReq;
  final TextEditingController pounds;
  final TextEditingController supervised;
  final TextEditingController otherReq;
  final TextEditingController requirementCount;

  @override
  State<ApplicationRequirementInfo> createState() =>
      _ApplicationRequirementInfoState();
}

class _ApplicationRequirementInfoState
    extends State<ApplicationRequirementInfo> {
  bool driving = false;
  bool cdl = false;
  bool cert = false;
  bool background = false;
  bool screen = false;
  bool temp = false;
  bool push = false;
  bool walk = false;
  bool stoop = false;
  bool rep = false;
  bool lift = false;
  bool supervise = false;

  @override
  void initState() {
    driving = widget.drivingReq.text == 'true' ? true : false;
    cdl = widget.cdlReq.text == 'true' ? true : false;
    cert = widget.certReq.text == 'true' ? true : false;
    background = widget.backgroundReq.text == 'true' ? true : false;
    screen = widget.screenReq.text == 'true' ? true : false;
    temp = widget.tempReq.text == 'true' ? true : false;
    push = widget.pushReq.text == 'true' ? true : false;
    walk = widget.walkReq.text == 'true' ? true : false;
    stoop = widget.stoopReq.text == 'true' ? true : false;
    rep = widget.repReq.text == 'true' ? true : false;
    lift = widget.liftReq.text == 'true' ? true : false;
    supervise = widget.superReq.text == 'true' ? true : false;
    super.initState();
  }

  double countCompleted() {
    int sum = (widget.experience.text != '' ? 1 : 0) +
        (widget.training.text != '' ? 1 : 0);
    return sum/2;
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
                      widget.requirementCount.text = countCompleted().toString();
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
                Text(
                  'Education Requirement',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: widget.education.text,
                    elevation: 16,
                    style: TextStyle(
                        fontSize: 20.0, color: Theme.of(context).primaryColor),
                    underline: Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.education.text = newValue!;
                      });
                    },
                    items: [
                      'None',
                      'High School/GED',
                      'Associate\'s',
                      'Bachelor\'s',
                      'Master\'s or Higher',
                      'Other'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 25.0),
                Text(
                  'Experience Requirements (months)',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          label: 'Experience',
                          controller: widget.experience,
                          keyboard: TextInputType.number,
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          label: 'Training',
                          controller: widget.training,
                          keyboard: TextInputType.number,
                        )),
                  ],
                ),
                const SizedBox(height: 25.0),
                Text(
                  'Basic Requirements (select all that apply)',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20.0),
                ),
                const SizedBox(height: 10.0),
                ApplicationSwitch(
                  label: 'Driver\'s License',
                  toggle: driving,
                  onChanged: (value) {
                    setState(() {
                      driving = value;
                      value
                          ? widget.drivingReq.text = 'true'
                          : widget.drivingReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Commercial Driver\'s License',
                  toggle: cdl,
                  onChanged: (value) {
                    setState(() {
                      cdl = value;
                      value
                          ? widget.cdlReq.text = 'true'
                          : widget.cdlReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Other Certification/License',
                  toggle: cert,
                  onChanged: (value) {
                    setState(() {
                      cert = value;
                      value
                          ? widget.certReq.text = 'true'
                          : widget.certReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Must pass a criminal background check',
                  toggle: background,
                  onChanged: (value) {
                    setState(() {
                      background = value;
                      value
                          ? widget.backgroundReq.text = 'true'
                          : widget.backgroundReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Must pass a drug-screen',
                  toggle: screen,
                  onChanged: (value) {
                    setState(() {
                      screen = value;
                      value
                          ? widget.screenReq.text = 'true'
                          : widget.screenReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Lifting Requirement',
                  toggle: lift,
                  onChanged: (value) {
                    setState(() {
                      lift = value;
                      value
                          ? widget.liftReq.text = 'true'
                          : widget.liftReq.text = 'false';
                    });
                  },
                ),
                Visibility(
                  visible: lift,
                  child: ApplicationTextField(
                    label: 'Pounds',
                    keyboard: TextInputType.number,
                    controller: widget.pounds,
                  ),
                ),
                ApplicationSwitch(
                  label: 'Will act as a Supervisor',
                  toggle: supervise,
                  onChanged: (value) {
                    setState(() {
                      supervise = value;
                      value
                          ? widget.superReq.text = 'true'
                          : widget.superReq.text = 'false';
                    });
                  },
                ),
                Visibility(
                  visible: supervise,
                  child: ApplicationTextField(
                    label: 'Employees Supervised',
                    keyboard: TextInputType.number,
                    controller: widget.supervised,
                  ),
                ),
                ApplicationSwitch(
                  label: 'Exposure to Extreme Temperatures',
                  toggle: temp,
                  onChanged: (value) {
                    setState(() {
                      temp = value;
                      value
                          ? widget.tempReq.text = 'true'
                          : widget.tempReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Extensive Pushing or Pulling',
                  toggle: push,
                  onChanged: (value) {
                    setState(() {
                      push = value;
                      value
                          ? widget.pushReq.text = 'true'
                          : widget.pushReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Extensive Sitting or walking',
                  toggle: walk,
                  onChanged: (value) {
                    setState(() {
                      walk = value;
                      value
                          ? widget.walkReq.text = 'true'
                          : widget.walkReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Frequent Stooping/bending over',
                  toggle: stoop,
                  onChanged: (value) {
                    setState(() {
                      stoop = value;
                      value
                          ? widget.stoopReq.text = 'true'
                          : widget.stoopReq.text = 'false';
                    });
                  },
                ),
                ApplicationSwitch(
                  label: 'Repetitive Movements',
                  toggle: rep,
                  onChanged: (value) {
                    setState(() {
                      rep = value;
                      value
                          ? widget.repReq.text = 'true'
                          : widget.repReq.text = 'false';
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ApplicationTextField(
                  label: 'Other Requirements',
                  keyboard: TextInputType.number,
                  controller: widget.otherReq,
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
                      child: Text('Save & Continue',
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
                      widget.requirementCount.text = countCompleted().toString();
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

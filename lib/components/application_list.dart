import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:usafl/components/duties_list.dart';
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:usafl/constants.dart';
import 'package:usafl/components/extra_worksite_list.dart';
import 'package:usafl/components/extra_housing_list.dart';
import 'package:usafl/views/job_contact_form.dart';
import 'package:usafl/views/job_info_form.dart';
import 'package:usafl/views/job_duties_form.dart';
import 'package:usafl/views/job_requirements_form.dart';
import 'package:usafl/views/job_worksite_form.dart';
import 'package:usafl/views/job_housing_form.dart';
import 'package:usafl/views/job_misc_form.dart';

PageController pController = PageController();
double pageNum = 0;
double pageTotal = 8;
double aewr = 7.25;
DateTime start = DateTime.now();
DateTime end = DateTime.now().add(const Duration(days: 1));

class ApplicationForm extends StatefulWidget {
  const ApplicationForm({super.key});

  @override
  State<ApplicationForm> createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  TextEditingController bizName = TextEditingController();
  TextEditingController bizNameAlt = TextEditingController();
  TextEditingController contactFirst = TextEditingController();
  TextEditingController contactMiddle = TextEditingController();
  TextEditingController contactLast = TextEditingController();
  TextEditingController contactTitle = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController(text: 'State');
  TextEditingController zip = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController ext = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fein = TextEditingController();
  TextEditingController workersReq = TextEditingController();
  TextEditingController needType = TextEditingController(text: 'Select');
  TextEditingController wageType = TextEditingController(text: 'Hourly');
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  TextEditingController aewr = TextEditingController(text: '0.00');
  TextEditingController wageRate = TextEditingController(text: '0.00');
  TextEditingController pieceRate = TextEditingController();
  TextEditingController alwaysOnCall = TextEditingController(text: 'No');
  TextEditingController sun = TextEditingController(text: '0');
  TextEditingController mon = TextEditingController(text: '8');
  TextEditingController tue = TextEditingController(text: '8');
  TextEditingController wed = TextEditingController(text: '8');
  TextEditingController thu = TextEditingController(text: '8');
  TextEditingController fri = TextEditingController(text: '8');
  TextEditingController sat = TextEditingController(text: '8');
  TextEditingController total = TextEditingController(text: '48');
  TextEditingController hourIn = TextEditingController(text: '08');
  TextEditingController minIn = TextEditingController(text: '00');
  TextEditingController phaseIn = TextEditingController(text: 'AM');
  TextEditingController hourOut = TextEditingController(text: '05');
  TextEditingController minOut = TextEditingController(text: '00');
  TextEditingController phaseOut = TextEditingController(text: 'PM');
  TextEditingController paySchedule = TextEditingController(text: 'Select Frequency');
  TextEditingController payDay = TextEditingController(text: 'Select Pay Day');
  TextEditingController jobDescription = TextEditingController(text: 'Job Duties include: ');
  TextEditingController jobDescriptionEditor = TextEditingController();
  TextEditingController allTasks = TextEditingController();
  TextEditingController aeoTasks = TextEditingController();
  TextEditingController genTasks = TextEditingController();
  TextEditingController livTasks = TextEditingController();
  TextEditingController mecTasks = TextEditingController();
  TextEditingController winTasks = TextEditingController();
  List<bool> taskList = [];
  TextEditingController education = TextEditingController(text: 'None');
  TextEditingController experience = TextEditingController(text: '3');
  TextEditingController training = TextEditingController(text: '0');
  TextEditingController drivingReq = TextEditingController(text: 'false');
  TextEditingController cdlReq = TextEditingController(text: 'false');
  TextEditingController certReq = TextEditingController(text: 'false');
  TextEditingController backgroundReq = TextEditingController(text: 'false');
  TextEditingController screenReq = TextEditingController(text: 'false');
  TextEditingController tempReq = TextEditingController(text: 'false');
  TextEditingController pushReq = TextEditingController(text: 'false');
  TextEditingController walkReq = TextEditingController(text: 'false');
  TextEditingController stoopReq = TextEditingController(text: 'false');
  TextEditingController repReq = TextEditingController(text: 'false');
  TextEditingController liftReq = TextEditingController(text: 'false');
  TextEditingController superReq = TextEditingController(text: 'false');
  TextEditingController pounds = TextEditingController(text: '60');
  TextEditingController supervised = TextEditingController();
  TextEditingController otherReq = TextEditingController(text: 'None');
  TextEditingController primeWorkAddress = TextEditingController();
  TextEditingController primeWorkCity = TextEditingController();
  TextEditingController primeWorkState = TextEditingController(text: 'State');
  TextEditingController primeWorkZip = TextEditingController();
  TextEditingController primeWorkCounty = TextEditingController();
  TextEditingController primeWorkExtra = TextEditingController();
  TextEditingController tempControllingBiz = TextEditingController();
  TextEditingController tempEmpOwned = TextEditingController(text: 'Yes');
  TextEditingController tempWorkAddress = TextEditingController();
  TextEditingController tempWorkCity = TextEditingController();
  TextEditingController tempWorkState = TextEditingController(text: 'State');
  TextEditingController tempWorkZip = TextEditingController();
  TextEditingController tempWorkCounty = TextEditingController();
  TextEditingController tempStart = TextEditingController();
  TextEditingController tempEnd = TextEditingController();
  TextEditingController tempWorkersReq = TextEditingController();
  List<Worksite> extraWorksites = [];
  List<Housing> extraHousing = [];
  TextEditingController primeHousingStatus =
      TextEditingController(text: 'Select Housing Status');
  TextEditingController primeHousingType =
      TextEditingController(text: 'What kind of housing is this?');
  TextEditingController primeHousingAddress = TextEditingController();
  TextEditingController primeHousingCity = TextEditingController();
  TextEditingController primeHousingState =
      TextEditingController(text: 'State');
  TextEditingController primeHousingZip = TextEditingController();
  TextEditingController primeHousingCounty = TextEditingController();
  TextEditingController primeHousingUnits = TextEditingController();
  TextEditingController primeHousingBedrooms = TextEditingController();
  TextEditingController primeHousingBeds = TextEditingController();
  TextEditingController primeHousingOccupancy = TextEditingController();
  TextEditingController primeHousingKitchen =
      TextEditingController(text: 'Select');
  TextEditingController tempHousingStatus =
      TextEditingController(text: 'Select Housing Status');
  TextEditingController tempHousingType =
      TextEditingController(text: 'What kind of housing is this?');
  TextEditingController tempHousingAddress = TextEditingController();
  TextEditingController tempHousingCity = TextEditingController();
  TextEditingController tempHousingState = TextEditingController(text: 'State');
  TextEditingController tempHousingZip = TextEditingController();
  TextEditingController tempHousingCounty = TextEditingController();
  TextEditingController tempHousingUnits = TextEditingController();
  TextEditingController tempHousingBedrooms = TextEditingController();
  TextEditingController tempHousingBeds = TextEditingController();
  TextEditingController tempHousingOccupancy = TextEditingController();
  TextEditingController tempHousingKitchen = TextEditingController(text: 'Select');
  TextEditingController prevH2aUse = TextEditingController(text: 'false');
  TextEditingController selectedWorkers = TextEditingController(text: 'false');
  TextEditingController willTrainWorkers = TextEditingController(text: 'false');
  TextEditingController smokingOkay = TextEditingController(text: 'false');
  TextEditingController familiesOkay = TextEditingController(text: 'false');
  TextEditingController prevExpPref = TextEditingController(text: 'false');

  @override
  void initState() {
    super.initState();
    taskList = List<bool>.filled(DutiesList().checklist.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pController,
            children: <Widget>[
              ApplicationContactInfo(
                bizName: bizName,
                bizNameAlt: bizNameAlt,
                contactFirst: contactFirst,
                contactMiddle: contactMiddle,
                contactLast: contactLast,
                contactTitle: contactTitle,
                address1: address1,
                address2: address2,
                city: city,
                state: state,
                aewr: aewr,
                wageRate: wageRate,
                zip: zip,
                phone: phone,
                ext: ext,
                email: email,
                fein: fein,
              ),
              ApplicationJobInfo(
                workersReq: workersReq,
                needType: needType,
                wageType: wageType,
                startDateInput: startDateInput,
                endDateInput: endDateInput,
                aewr: aewr,
                wageRate: wageRate,
                pieceRate: pieceRate,
                alwaysOnCall: alwaysOnCall,
                sun: sun,
                mon: mon,
                tue: tue,
                wed: wed,
                thu: thu,
                fri: fri,
                sat: sat,
                total: total,
                hourIn: hourIn,
                minIn: minIn,
                phaseIn: phaseIn,
                hourOut: hourOut,
                minOut: minOut,
                phaseOut: phaseOut,
                paySchedule: paySchedule,
                payDay: payDay,
              ),
              ApplicationDutiesInfo(
                jobDescription: jobDescription,
                jobDescriptionEditor: jobDescriptionEditor,
                taskList: taskList,
                allTasks: allTasks,
                aeoTasks: aeoTasks,
                genTasks: genTasks,
                livTasks: livTasks,
                mecTasks: mecTasks,
                winTasks: winTasks
              ),
              ApplicationRequirementInfo(
                education: education,
                experience: experience,
                training: training,
                drivingReq: drivingReq,
                cdlReq: cdlReq,
                certReq: certReq,
                backgroundReq: backgroundReq,
                screenReq: screenReq,
                tempReq: tempReq,
                pushReq: pushReq,
                walkReq: walkReq,
                stoopReq: stoopReq,
                repReq: repReq,
                liftReq: liftReq,
                superReq: superReq,
                pounds: pounds,
                supervised: supervised,
                otherReq: otherReq
              ),
              ApplicationWorksiteInfo(
                bizName: bizName,
                state: state,
                start: start,
                end: end,
                workersReq: workersReq,
                primeWorkAddress: primeWorkAddress,
                primeWorkCity: primeWorkCity,
                primeWorkState: primeWorkState,
                primeWorkZip: primeWorkZip,
                primeWorkCounty: primeWorkCounty,
                primeWorkExtra: primeWorkExtra,
                tempControllingBiz: tempControllingBiz,
                tempEmpOwned: tempEmpOwned,
                tempWorkAddress: tempWorkAddress,
                tempWorkCity: tempWorkCity,
                tempWorkState: tempWorkState,
                tempWorkZip: tempWorkZip,
                tempWorkCounty: tempWorkCounty,
                tempStart: tempStart,
                tempEnd: tempEnd,
                tempWorkersReq: tempWorkersReq,
                extraWorksites: extraWorksites,
              ),
              ApplicationHousingInfo(
                state: state,
                primeHousingStatus: primeHousingStatus,
                primeHousingType: primeHousingType,
                primeHousingAddress: primeHousingAddress,
                primeHousingCity: primeHousingCity,
                primeHousingState: primeHousingState,
                primeHousingZip: primeHousingZip,
                primeHousingCounty: primeHousingCounty,
                primeHousingUnits: primeHousingUnits,
                primeHousingBedrooms: primeHousingBedrooms,
                primeHousingBeds: primeHousingBeds,
                primeHousingOccupancy: primeHousingOccupancy,
                primeHousingKitchen: primeHousingKitchen,
                tempHousingStatus: tempHousingStatus,
                tempHousingType: tempHousingType,
                tempHousingAddress: tempHousingAddress,
                tempHousingCity: tempHousingCity,
                tempHousingState: tempHousingState,
                tempHousingZip: tempHousingZip,
                tempHousingCounty: tempHousingCounty,
                tempHousingUnits: tempHousingUnits,
                tempHousingBedrooms: tempHousingBedrooms,
                tempHousingBeds: tempHousingBeds,
                tempHousingOccupancy: tempHousingOccupancy,
                tempHousingKitchen: tempHousingKitchen,
                extraHousing: extraHousing,
              ),
              ApplicationMiscInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ApplicationSwitch extends StatefulWidget {
  const ApplicationSwitch(
      {super.key,
      required this.label,
      required this.toggle,
      required this.onChanged});

  final String label;
  final bool toggle;
  final Function(bool) onChanged;

  @override
  State<ApplicationSwitch> createState() => _ApplicationSwitchState();
}

class _ApplicationSwitchState extends State<ApplicationSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.label,
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 20)),
      value: widget.toggle,
      activeColor: Theme.of(context).primaryColor,
      onChanged: widget.onChanged,
    );
  }
}

class ApplicationTextField extends StatelessWidget {
  const ApplicationTextField(
      {super.key,
      required this.label,
      this.controller,
      this.initial,
      this.keyboard = TextInputType.text,
      this.readOnly = false,
      this.onTap,
      this.onChanged,
      this.format,
      this.expands = false});

  final String label;
  final TextEditingController? controller;
  final String? initial;
  final TextInputType keyboard;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? format;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      maxLines: expands ? null : 1,
      controller: controller,
      initialValue: initial,
      readOnly: readOnly,
      keyboardType: keyboard,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
            TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      inputFormatters: format,
      onTap: () {
        onTap;
      },
    );
  }
}

// Text(
// 'Job Duties Breakdown',
// style: TextStyle(
// color: Theme.of(context).primaryColor,
// fontSize: 20.0,
// fontWeight: FontWeight.w700),
// ),
// const SizedBox(height: 20.0),
// IconBoxButton(
// icon: Icons.agriculture,
// text: 'Equipment (${((aeoTasks / tasks) * 100)}%)',
// progress: aeoTasks / tasks,
// ),
// const SizedBox(height: 10.0),
// IconBoxButton(
// icon: Icons.eco,
// text: 'General (${((genTasks / tasks) * 100)}%)',
// progress: genTasks / tasks,
// ),
// const SizedBox(height: 10.0),
// IconBoxButton(
// icon: Icons.egg,
// text: 'Livestock (${((livTasks / tasks) * 100)}%)',
// progress: livTasks / tasks,
// ),
// const SizedBox(height: 10.0),
// IconBoxButton(
// icon: Icons.construction,
// text: 'Mechanical (${((mecTasks / tasks) * 100)}%)',
// progress: mecTasks / tasks,
// ),
// const SizedBox(height: 10.0),
// IconBoxButton(
// icon: Icons.ac_unit,
// text: 'Winter (${((winTasks / tasks) * 100)}%)',
// progress: winTasks / tasks,
// ),
// const SizedBox(height: 20.0),

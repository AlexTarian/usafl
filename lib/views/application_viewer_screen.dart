import 'package:flutter/material.dart';
import 'package:usafl/views/application_selection_screen.dart';
import 'package:usafl/components/custom_app_bar.dart';
import 'package:usafl/components/nav_menu.dart';
import 'package:usafl/components/application_list.dart';
import 'package:usafl/components/icon_box_button.dart';
import 'package:usafl/components/extra_worksite_list.dart';
import 'package:usafl/components/extra_housing_list.dart';
import 'package:usafl/components/duties_list.dart';
import 'package:usafl/views/job_contact_form.dart';
import 'package:usafl/views/job_info_form.dart';
import 'package:usafl/views/job_duties_form.dart';
import 'package:usafl/views/job_requirements_form.dart';
import 'package:usafl/views/job_worksite_form.dart';
import 'package:usafl/views/job_housing_form.dart';
import 'package:usafl/views/job_misc_form.dart';

ApplicationForm appEngine = const ApplicationForm();
late DateTime selectedDate;

class ApplicationViewer extends StatefulWidget {
  const ApplicationViewer({super.key});

  @override
  State<ApplicationViewer> createState() => _ApplicationViewerState();
}

class _ApplicationViewerState extends State<ApplicationViewer> {
  double contactProgress = 0;
  double jobProgress = 0;
  double dutiesProgress = 0;
  double requirementProgress = 0;
  double worksiteProgress = 0;
  double housingProgress = 0;
  double miscProgress = 0;
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
  TextEditingController paySchedule =
      TextEditingController(text: 'Select Frequency');
  TextEditingController payDay = TextEditingController(text: 'Select Pay Day');
  TextEditingController jobDescription =
      TextEditingController(text: 'Job Duties include: ');
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
  TextEditingController tempHousingKitchen =
      TextEditingController(text: 'Select');
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
      resizeToAvoidBottomInset: false,
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
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).primaryColorLight,
                Theme.of(context).primaryColorDark,
              ],
            ),
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
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (ApplicationScreen())));
                      },
                      child: Row(
                        children: const <Widget>[
                          Icon(Icons.arrow_back, size: 30.0),
                          SizedBox(width: 10.0),
                          Text('Back to Applications',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.person,
                            text: 'Contact Info',
                            progress: contactProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ApplicationContactInfo(
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
                                        ))));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.calendar_month,
                            text: 'Job Details',
                            progress: jobProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (ApplicationJobInfo(
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
                                        payDay: payDay))));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.list,
                            text: 'Job Duties',
                            progress: dutiesProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ApplicationDutiesInfo(
                                            jobDescription: jobDescription,
                                            jobDescriptionEditor:
                                                jobDescriptionEditor,
                                            taskList: taskList,
                                            allTasks: allTasks,
                                            aeoTasks: aeoTasks,
                                            genTasks: genTasks,
                                            livTasks: livTasks,
                                            mecTasks: mecTasks,
                                            winTasks: winTasks))));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.checklist,
                            text: 'Requirements',
                            progress: requirementProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ApplicationRequirementInfo(
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
                                            otherReq: otherReq))));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.location_on,
                            text: 'Worksites',
                            progress: worksiteProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ApplicationWorksiteInfo(
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
                                            tempControllingBiz:
                                                tempControllingBiz,
                                            tempEmpOwned: tempEmpOwned,
                                            tempWorkAddress: tempWorkAddress,
                                            tempWorkCity: tempWorkCity,
                                            tempWorkState: tempWorkState,
                                            tempWorkZip: tempWorkZip,
                                            tempWorkCounty: tempWorkCounty,
                                            tempStart: tempStart,
                                            tempEnd: tempEnd,
                                            tempWorkersReq: tempWorkersReq,
                                            extraWorksites: extraWorksites))));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.house,
                            text: 'Worker Housing',
                            progress: housingProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (ApplicationHousingInfo(
                                            state: state,
                                            primeHousingStatus:
                                                primeHousingStatus,
                                            primeHousingType: primeHousingType,
                                            primeHousingAddress:
                                                primeHousingAddress,
                                            primeHousingCity: primeHousingCity,
                                            primeHousingState:
                                                primeHousingState,
                                            primeHousingZip: primeHousingZip,
                                            primeHousingCounty:
                                                primeHousingCounty,
                                            primeHousingUnits:
                                                primeHousingUnits,
                                            primeHousingBedrooms:
                                                primeHousingBedrooms,
                                            primeHousingBeds: primeHousingBeds,
                                            primeHousingOccupancy:
                                                primeHousingOccupancy,
                                            primeHousingKitchen:
                                                primeHousingKitchen,
                                            tempHousingStatus:
                                                tempHousingStatus,
                                            tempHousingType: tempHousingType,
                                            tempHousingAddress:
                                                tempHousingAddress,
                                            tempHousingCity: tempHousingCity,
                                            tempHousingState: tempHousingState,
                                            tempHousingZip: tempHousingZip,
                                            tempHousingCounty:
                                                tempHousingCounty,
                                            tempHousingUnits: tempHousingUnits,
                                            tempHousingBedrooms:
                                                tempHousingBedrooms,
                                            tempHousingBeds: tempHousingBeds,
                                            tempHousingOccupancy:
                                                tempHousingOccupancy,
                                            tempHousingKitchen:
                                                tempHousingKitchen,
                                            extraHousing: extraHousing))));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.question_mark,
                            text: 'Miscellaneous',
                            progress: miscProgress,
                            trailingIcon: contactProgress == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (ApplicationMiscInfo(
                                        prevH2aUse: prevH2aUse,
                                        selectedWorkers: selectedWorkers,
                                        willTrainWorkers: willTrainWorkers,
                                        smokingOkay: smokingOkay,
                                        familiesOkay: familiesOkay,
                                        prevExpPref: prevExpPref))));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Theme.of(context).primaryColor.withOpacity(0.5),
                            Colors.transparent
                          ],
                          stops: <double>[
                            pageNum / pageTotal,
                            pageNum / pageTotal
                          ],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                      ),
                      child: Center(
                        child: Text('SUBMIT',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700)),
                      ),
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

import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
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
import 'package:usafl/views/job_transportation_form.dart';
import 'package:usafl/views/job_misc_form.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
  TextEditingController transpOption = TextEditingController(text: 'Select');
  TextEditingController  separateVehicles = TextEditingController(text: 'Select');
  TextEditingController  vehiclesProvided = TextEditingController(text: '0');
  TextEditingController  vehicleList = TextEditingController();
  TextEditingController  fuelExpenseHandling = TextEditingController(text: 'Select');
  TextEditingController  vehicleProvisionConfirmation = TextEditingController();
  TextEditingController  provVehicleForErrands = TextEditingController(text: 'Select');
  TextEditingController  pickupTime = TextEditingController();
  TextEditingController  pickupLocation = TextEditingController();
  TextEditingController  pickupCustomLocation = TextEditingController();
  TextEditingController  dropOffTime = TextEditingController();
  TextEditingController  dropOffLocation = TextEditingController();
  TextEditingController  dropOffCustomLocation = TextEditingController();
  TextEditingController  vehicleOwner = TextEditingController();
  TextEditingController  transpService = TextEditingController();
  TextEditingController  errandHandling = TextEditingController();
  TextEditingController  errandVehicles = TextEditingController();
  TextEditingController  errandVehiclesList = TextEditingController();
  TextEditingController  otherWorkers = TextEditingController();
  TextEditingController  confirmOne = TextEditingController();
  TextEditingController  confirmTwo = TextEditingController();
  TextEditingController  confirmThree = TextEditingController();
  TextEditingController meals = TextEditingController();
  TextEditingController transpDaily = TextEditingController();
  TextEditingController transpInAndOut = TextEditingController();
  TextEditingController prevH2aUse = TextEditingController(text: 'Select');
  TextEditingController selectedWorkers = TextEditingController(text: 'Select');
  TextEditingController willTrainWorkers = TextEditingController(text: 'Select');
  TextEditingController smokingOkay = TextEditingController(text: 'Select');
  TextEditingController familiesOkay = TextEditingController(text: 'Select');
  TextEditingController prevExpPref = TextEditingController(text: 'Select');
  TextEditingController contactCount = TextEditingController(text: '0');
  TextEditingController detailCount = TextEditingController(text: '0');
  TextEditingController dutyCount = TextEditingController(text: '0');
  TextEditingController requirementCount = TextEditingController(text: '0');
  TextEditingController worksiteCount = TextEditingController(text: '0');
  TextEditingController housingCount = TextEditingController(text: '0');
  TextEditingController transpCount = TextEditingController(text: '0');
  TextEditingController miscCount = TextEditingController(text: '0');
  double progress = 0;

  @override
  void initState() {
    super.initState();
    taskList = List<bool>.filled(DutiesList().checklist.length, false);
  }

  double countProgress() {
    double sum = double.parse(contactCount.text) +
        double.parse(detailCount.text) +
        double.parse(dutyCount.text) +
        double.parse(requirementCount.text) +
        double.parse(worksiteCount.text) +
        double.parse(housingCount.text) +
        double.parse(miscCount.text);
    return sum;
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
                              style: TextStyle(fontSize: 20.0)),
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
                            progress: double.parse(contactCount.text),
                            trailingIcon: double.parse(contactCount.text) == 1
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
                                          contactCount: contactCount,
                                        )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.calendar_month,
                            text: 'Job Details',
                            progress: double.parse(detailCount.text),
                            trailingIcon: double.parse(detailCount.text) == 1
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
                                        payDay: payDay,
                                        detailCount: detailCount,
                                    )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.list,
                            text: 'Job Duties',
                            progress: double.parse(dutyCount.text),
                            trailingIcon: double.parse(dutyCount.text) == 1
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
                                            winTasks: winTasks,
                                          dutyCount: dutyCount,
                                        )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.checklist,
                            text: 'Requirements',
                            progress: double.parse(requirementCount.text),
                            trailingIcon: double.parse(requirementCount.text) == 1
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
                                            otherReq: otherReq,
                                          requirementCount: requirementCount,
                                        )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.location_on,
                            text: 'Worksites',
                            progress: double.parse(worksiteCount.text),
                            trailingIcon: double.parse(worksiteCount.text) == 1
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
                                            extraWorksites: extraWorksites,
                                          worksiteCount: worksiteCount,
                                        )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.house,
                            text: 'Worker Housing',
                            progress: double.parse(housingCount.text),
                            trailingIcon: double.parse(housingCount.text) == 1
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
                                    housingCount: housingCount,
                                  )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.directions_bus_filled,
                            text: 'Transportation',
                            progress: double.parse(transpCount.text),
                            trailingIcon: double.parse(transpCount.text) == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => (ApplicationTransportInfo(
                                      transpOption: transpOption,
                                      separateVehicles: separateVehicles,
                                      vehiclesProvided: vehiclesProvided,
                                      vehicleList: vehicleList,
                                      fuelExpenseHandling: fuelExpenseHandling,
                                      vehicleProvisionConfirmation: vehicleProvisionConfirmation,
                                      provVehicleForErrands: provVehicleForErrands,
                                      pickupTime: pickupTime,
                                      pickupLocation: pickupLocation,
                                      pickupCustomLocation: pickupCustomLocation,
                                      dropOffTime: dropOffTime,
                                      dropOffLocation: dropOffLocation,
                                      dropOffCustomLocation: dropOffCustomLocation,
                                      vehicleOwner: vehicleOwner,
                                      transpService: transpService,
                                      errandHandling: errandHandling,
                                      errandVehicles: errandVehicles,
                                      errandVehiclesList: errandVehiclesList,
                                      otherWorkers: otherWorkers,
                                      confirmOne: confirmOne,
                                      confirmTwo: confirmTwo,
                                      confirmThree: confirmThree,
                                      transpCount: transpCount,
                                    )))).then((value) =>
                                setState(() {
                                  progress = countProgress();
                                }));
                          },
                        ),
                        const SizedBox(height: 10.0),
                        GestureDetector(
                          child: IconBoxButton(
                            icon: Icons.question_mark,
                            text: 'Miscellaneous',
                            progress: double.parse(miscCount.text),
                            trailingIcon: double.parse(miscCount.text) == 1
                                ? Icons.check_circle
                                : null,
                            trailingColor: Theme.of(context).primaryColor,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => (ApplicationMiscInfo(
                                  meals: meals,
                                  transpDaily: transpDaily,
                                  transpInAndOut: transpInAndOut,
                                  prevH2aUse: prevH2aUse,
                                  selectedWorkers: selectedWorkers,
                                  willTrainWorkers: willTrainWorkers,
                                  smokingOkay: smokingOkay,
                                  familiesOkay: familiesOkay,
                                  prevExpPref: prevExpPref,
                                  miscCount: miscCount,
                                )))).then((value) =>
                              setState(() {
                                progress = countProgress();
                              }));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      child: Container(
                        height: 50.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              progress == 7 ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(.5),
                              Colors.transparent
                            ],
                            stops: <double>[
                              progress / 7,
                              progress / 7
                            ],
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 3),
                        ),
                        child: Center(
                          child: Text(progress == 7 ? 'SUBMIT' : 'PROGRESS (${((progress/7)*100).toStringAsFixed(2)}%)',
                              style: TextStyle(
                                  color: progress == 7 ? Colors.white : Theme.of(context).primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700)),
                        ),
                      ),
                      onTap: () {
                        if(progress == 7) {
                          Alert(
                            context: context,
                            title: 'Acknowledgement',
                            desc: 'Ready to submit your application? This cannot be undone.',
                            buttons: [
                              DialogButton(
                                color: usaflAccent,
                                child: const Text(
                                  'Go Back',
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
                                  'Confirm',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 20.0),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ).show();
                        }
                      },
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
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:usafl/components/aewr_list.dart';
import 'package:usafl/components/custom_input_formatter.dart';
import 'package:usafl/components/duties_list.dart';

PageController pController = PageController();

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
  bool needType = false;
  bool wageType = false;
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  DateTime start = DateTime.now();
  DateTime end = DateTime.now().add(const Duration(days: 1));
  double aewr = 0.0;
  double enteredWage = 0.0;
  TextEditingController wageRate = TextEditingController();
  bool alwaysOnCall = false;
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
  int tasks = 0;
  int aeoTasks = 0;
  int genTasks = 0;
  int livTasks = 0;
  int mecTasks = 0;
  int winTasks = 0;
  bool toggleAlt = false;
  List<bool> _isChecked = [];

  @override
  void initState() {
    startDateInput.text = "";
    endDateInput.text = ""; //set the initial value of text field
    super.initState();
    _isChecked = List<bool>.filled(DutiesList().checklist.length, false);
  }

  DateTime now = DateTime.now();
  int itemNumber = 0;
  int completed = 0;

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
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    Text(
                      'Contact Info',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0),
                    ),
                    const SizedBox(height: 15.0),
                    ApplicationTextField(
                      label: 'Business Name',
                      controller: bizName,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Trade/DBA Name',
                      controller: bizNameAlt,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Contact\'s First Name',
                      controller: contactFirst,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Contact\'s Middle Name',
                      controller: contactMiddle,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Contact\'s Last Name',
                      controller: contactLast,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Contact\'s Job Title',
                      controller: contactTitle,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Address 1',
                      controller: address1,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'Address 2',
                      controller: address2,
                    ),
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                      label: 'City',
                      controller: city,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: state.text,
                              elevation: 16,
                              underline: Container(
                                width: double.infinity,
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  state.text = newValue!;
                                  aewr = double.parse(
                                      AewrList().stateAewrList[newValue]!);
                                  wageRate.text =
                                      AewrList().stateAewrList[newValue]!;
                                  enteredWage = double.parse(
                                      AewrList().stateAewrList[newValue]!);
                                });
                              },
                              items: AewrList()
                                  .stateAewrList
                                  .keys
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              label: 'Zip',
                              controller: zip,
                            )),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      children: <Widget>[
                        Flexible(
                            flex: 3,
                            child: ApplicationTextField(
                              label: 'Phone',
                              controller: phone,
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              label: 'Ext.',
                              controller: ext,
                            )),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    ApplicationTextField(
                      label: 'Email',
                      controller: email,
                    ),
                    const SizedBox(height: 30.0),
                    ApplicationTextField(
                      label: 'FEIN from IRS',
                      controller: fein,
                    ),
                    const SizedBox(height: 500.0),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    ApplicationTextField(
                        label: 'Workers Requested', controller: workersReq),
                    const SizedBox(height: 25.0),
                    Text(
                      'Type of Need',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            child: Text(
                              'Annual',
                              style: TextStyle(
                                color: needType
                                    ? Colors.white24
                                    : Theme.of(context).primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                needType = false;
                              });
                            },
                          ),
                        ),
                        Switch(
                          activeColor: Theme.of(context).primaryColor,
                          inactiveThumbColor: Theme.of(context).primaryColor,
                          value: needType,
                          onChanged: (typeSelected) {
                            setState(() {
                              needType = typeSelected;
                            });
                          },
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            child: Text(
                              'One-Time Only',
                              style: TextStyle(
                                color: needType
                                    ? Theme.of(context).primaryColor
                                    : Colors.white24,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                needType = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),
                    Text(
                      'Period of Need',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '(Earliest Possible Start Date: ${DateFormat('MM/dd/yyyy').format(DateTime.now().add(const Duration(days: 50)))})',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0),
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 20.0),
                            controller: startDateInput,
                            decoration: InputDecoration(
                              labelText: 'Work Start Date',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                firstDate: DateTime.now()
                                    .add(const Duration(days: 50)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 730)),
                                initialDate: start.isAfter(DateTime.now()
                                        .add(const Duration(days: 50)))
                                    ? start
                                    : DateTime.now()
                                        .add(const Duration(days: 50)),
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('MM/dd/yyyy').format(pickedDate);
                                setState(() {
                                  start = pickedDate;
                                  startDateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        Text('-',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 20.0)),
                        const SizedBox(width: 5.0),
                        Flexible(
                          flex: 1,
                          child: TextFormField(
                            style: const TextStyle(fontSize: 20.0),
                            controller: endDateInput,
                            decoration: InputDecoration(
                              labelText: 'Work End Date',
                              labelStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                firstDate: start.isAfter(DateTime.now())
                                    ? start.add(const Duration(days: 1))
                                    : DateTime.now()
                                        .add(const Duration(days: 51)),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 730)),
                                initialDate: start.isAfter(DateTime.now())
                                    ? (end.isAfter(start)
                                        ? end
                                        : start.add(const Duration(days: 1)))
                                    : DateTime.now()
                                        .add(const Duration(days: 51)),
                              );

                              if (pickedDate != null) {
                                String formattedDate =
                                    DateFormat('MM/dd/yyyy').format(pickedDate);
                                setState(() {
                                  end = pickedDate;
                                  endDateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Visibility(
                      visible: start.isAfter(end) ? true : false,
                      child: const Text(
                        'Warning: Invalid date range.',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Visibility(
                      visible: end.isAfter(
                          DateTime(start.year, start.month + 10, start.day)),
                      child: const Text(
                        'Warning: The Period of Need cannot be longer than 10 months.',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      'Wage Type',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            child: Text(
                              'Hourly',
                              style: TextStyle(
                                color: wageType
                                    ? Colors.white24
                                    : Theme.of(context).primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                wageType = false;
                              });
                            },
                          ),
                        ),
                        Switch(
                          activeColor: Theme.of(context).primaryColor,
                          inactiveThumbColor: Theme.of(context).primaryColor,
                          value: wageType,
                          onChanged: (typeSelected) {
                            setState(() {
                              wageType = typeSelected;
                            });
                          },
                        ),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            child: Text(
                              'Piece Rate',
                              style: TextStyle(
                                color: wageType
                                    ? Theme.of(context).primaryColor
                                    : Colors.white24,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                wageType = true;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25.0),
                    Visibility(
                      visible: !wageType,
                      child: Text(
                        'Hourly Wage Offered (USD)',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Visibility(
                      visible: !wageType,
                      child: Text(
                        '(Pre-filled amount is your state\'s minimum.)',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0),
                      ),
                    ),
                    Visibility(
                      visible: wageType,
                      child: Text(
                        'Piece Rate Amount & Details',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Visibility(
                      visible: !wageType,
                      child: ApplicationTextField(
                        label: 'Wage Rate',
                        controller: wageRate,
                        keyboard: TextInputType.number,
                        format: <TextInputFormatter>[
                          CustomMinValueDoubleFormatter(minInputValue: 00.00),
                        ],
                        onChanged: (value) {
                          setState(() {
                            enteredWage = double.parse(value!);
                          });
                        },
                      ),
                    ),
                    Visibility(
                      visible: wageType,
                      child: ApplicationTextField(
                        label: 'Piece Rate',
                        controller: wageRate,
                        keyboard: TextInputType.number,
                        format: <TextInputFormatter>[
                          CustomMinValueDoubleFormatter(minInputValue: 00.00),
                        ],
                        onChanged: (value) {
                          setState(() {
                            enteredWage = double.parse(value!);
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Visibility(
                      visible: enteredWage < aewr,
                      child: Text(
                        'Warning: The entered wage rate is lower than the minimum allowed in your state. The wage rate must be at least \$$aewr.',
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    ApplicationSwitch(
                      label:
                          'Will the job require workers to be on-call 24 hours a day, 7 days a week?',
                      toggle: alwaysOnCall,
                      onChanged: (value) {
                        setState(() {
                          alwaysOnCall = value;
                        });
                      },
                    ),
                    const SizedBox(height: 500.0),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    Text(
                      'Anticipated Hours Offered Per Week',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '(Pre-filled numbers are recommended)',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.0),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: sun,
                              label: 'Sun',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(value!) +
                                          int.parse(mon.text) +
                                          int.parse(tue.text) +
                                          int.parse(wed.text) +
                                          int.parse(thu.text) +
                                          int.parse(fri.text) +
                                          int.parse(sat.text))
                                      .toString();
                                });
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: mon,
                              label: 'Mon',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(sun.text) +
                                          int.parse(value!) +
                                          int.parse(tue.text) +
                                          int.parse(wed.text) +
                                          int.parse(thu.text) +
                                          int.parse(fri.text) +
                                          int.parse(sat.text))
                                      .toString();
                                });
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: tue,
                              label: 'Tue',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(sun.text) +
                                          int.parse(mon.text) +
                                          int.parse(value!) +
                                          int.parse(wed.text) +
                                          int.parse(thu.text) +
                                          int.parse(fri.text) +
                                          int.parse(sat.text))
                                      .toString();
                                });
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: wed,
                              label: 'Wed',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(sun.text) +
                                          int.parse(mon.text) +
                                          int.parse(tue.text) +
                                          int.parse(value!) +
                                          int.parse(thu.text) +
                                          int.parse(fri.text) +
                                          int.parse(sat.text))
                                      .toString();
                                });
                              },
                            )),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: <Widget>[
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: thu,
                              label: 'Thu',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(sun.text) +
                                          int.parse(mon.text) +
                                          int.parse(tue.text) +
                                          int.parse(wed.text) +
                                          int.parse(value!) +
                                          int.parse(fri.text) +
                                          int.parse(sat.text))
                                      .toString();
                                });
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: fri,
                              label: 'Fri',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(sun.text) +
                                          int.parse(mon.text) +
                                          int.parse(tue.text) +
                                          int.parse(wed.text) +
                                          int.parse(thu.text) +
                                          int.parse(value!) +
                                          int.parse(sat.text))
                                      .toString();
                                });
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: sat,
                              label: 'Sat',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  total.text = (int.parse(sun.text) +
                                          int.parse(mon.text) +
                                          int.parse(tue.text) +
                                          int.parse(wed.text) +
                                          int.parse(thu.text) +
                                          int.parse(fri.text) +
                                          int.parse(value!))
                                      .toString();
                                });
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: total,
                              label: 'Total',
                              readOnly: true,
                            )),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    Visibility(
                      visible: int.parse(total.text) < 35 ? true : false,
                      child: const Text(
                        'Warning: You must be able to offer at least 35 hours per week to qualify for the H-2A Program.',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    Visibility(
                      visible: int.parse(total.text) < 35 ? true : false,
                      child: const SizedBox(height: 15.0),
                    ),
                    Visibility(
                      visible: (int.parse(sun.text) != 0 &&
                              int.parse(mon.text) != 0 &&
                              int.parse(tue.text) != 0 &&
                              int.parse(wed.text) != 0 &&
                              int.parse(thu.text) != 0 &&
                              int.parse(fri.text) != 0 &&
                              int.parse(sat.text) != 0)
                          ? true
                          : false,
                      child: const Text(
                        'Warning: You are required to include one day of rest (with 0 hours offered) per week.',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Expected Clock In:',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: hourIn,
                              label: 'Hour',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: minIn,
                              label: 'Minutes',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 59),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            )),
                        const SizedBox(width: 10.0),
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
                              value: phaseIn.text,
                              elevation: 16,
                              underline: Container(
                                width: double.infinity,
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  phaseIn.text = newValue!;
                                });
                              },
                              items: <String>[
                                'AM',
                                'PM'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Expected Clock Out:',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: hourOut,
                              label: 'Hour',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 12),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            )),
                        const SizedBox(width: 10.0),
                        Flexible(
                            flex: 1,
                            child: ApplicationTextField(
                              controller: minOut,
                              label: 'Minutes',
                              keyboard: TextInputType.number,
                              format: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(2),
                                CustomMaxValueIntFormatter(maxInputValue: 59),
                              ],
                              onChanged: (value) {
                                setState(() {});
                              },
                            )),
                        const SizedBox(width: 10.0),
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
                              value: phaseOut.text,
                              elevation: 16,
                              underline: Container(
                                width: double.infinity,
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  phaseOut.text = newValue!;
                                });
                              },
                              items: <String>[
                                'AM',
                                'PM'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                    const SizedBox(height: 40.0),
                    Text(
                      'Pay Schedule',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).primaryColor),
                            ),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              value: paySchedule.text,
                              elevation: 16,
                              underline: Container(
                                width: double.infinity,
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  paySchedule.text = newValue!;
                                });
                              },
                              items: <String>[
                                'Select Frequency',
                                'Weekly',
                                'Bi-Weekly',
                                'Twice per Month'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Visibility(
                          visible: paySchedule.text != 'Twice per Month',
                          child: Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: Theme.of(context).primaryColor),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                value: payDay.text,
                                elevation: 16,
                                underline: Container(
                                  width: double.infinity,
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    payDay.text = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Select Pay Day',
                                  'Sunday',
                                  'Monday',
                                  'Tuesday',
                                  'Wednesday',
                                  'Thursday',
                                  'Friday',
                                  'Saturday'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 500.0),
                  ],
                ),
              ),
              ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: DutiesList().checklist.length,
                itemBuilder: (BuildContext context, int index) {
                  //return StatefulBuilder(
                  //builder: (context, setState) {
                  return Container(
                    decoration: BoxDecoration(
                      //borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border(
                        top: BorderSide(
                            width: 2, color: Theme.of(context).primaryColor),
                      ),
                    ),
                    child: CheckboxListTile(
                      title: Text(
                        DutiesList().checklist[index].item,
                        style: const TextStyle(fontSize: 18.0),
                      ),
                      secondary: Icon(DutiesList().checklist[index].picture,
                          color: Theme.of(context).primaryColor),
                      value: _isChecked[index],
                      activeColor: Theme.of(context).primaryColor,
                      onChanged: (value) {
                        String category =
                            DutiesList().checklist[index].category;
                        setState(() {
                          _isChecked[index] = value!;

                          if (value) {
                            tasks++;
                            jobDescription.text =
                                '${jobDescription.text.replaceRange(jobDescription.text.length-1,jobDescription.text.length,tasks == 1 ? '' : ';')} ${DutiesList().checklist[index].item}.';
                            if (category == 'Equipment') {
                              aeoTasks++;
                            } else if (category == 'General') {
                              genTasks++;
                            } else if (category == 'Livestock') {
                              livTasks++;
                            } else if (category == 'Mechanical') {
                              mecTasks++;
                            } else if (category == 'Winter') {
                              winTasks++;
                            }
                          } else {
                            tasks--;
                            jobDescription.text = jobDescription.text
                                .replaceAll(
                                    '${DutiesList().checklist[index].item}; ',
                                    '')
                                .replaceAll(
                                    '${DutiesList().checklist[index].item}.',
                                    '');
                            if (category == 'Equipment') {
                              aeoTasks--;
                            } else if (category == 'General') {
                              genTasks--;
                            } else if (category == 'Livestock') {
                              livTasks--;
                            } else if (category == 'Mechanical') {
                              mecTasks--;
                            } else if (category == 'Winter') {
                              winTasks--;
                            }
                          }
                        });
                        // },
                        // );
                      },
                    ),
                  );
                },
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height)*.6,
                      child: ApplicationTextField(
                        label: 'Job Duties (Tap to Edit)',
                        controller: jobDescription,
                        expands: true,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 500.0),
                  ],
                ),
              ),
              SingleChildScrollView(
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
                      label:
                      'Will workers be paid a piece rate?',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Driver\'s License',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'CDL',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Driving Requirements',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Extensive Pushing/Pulling',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Extensive Sitting',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Extensive Walking',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Exposure to Extreme Temperatures',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Frequent Stooping',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Repetitive Movements',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Lifting Requirement',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Previous Experience Preferred',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label: 'Will you be conducting drug-screenings?',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    ApplicationSwitch(
                      label:
                          'Will you be conducting criminal background checks?',
                      toggle: toggleAlt,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 40.0),
                    const SizedBox(height: 500.0),
                  ],
                ),
              ),
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

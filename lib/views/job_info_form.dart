import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:usafl/views/application_viewer_screen.dart';
import 'package:usafl/components/custom_input_formatter.dart';
import 'package:usafl/components/application_text_field.dart';

class ApplicationJobInfo extends StatefulWidget {
  const ApplicationJobInfo({
    super.key,
    required this.workersReq,
    required this.needType,
    required this.wageType,
    required this.startDateInput,
    required this.endDateInput,
    required this.aewr,
    required this.wageRate,
    required this.pieceRate,
    required this.alwaysOnCall,
    required this.sun,
    required this.mon,
    required this.tue,
    required this.wed,
    required this.thu,
    required this.fri,
    required this.sat,
    required this.total,
    required this.hourIn,
    required this.minIn,
    required this.phaseIn,
    required this.hourOut,
    required this.minOut,
    required this.phaseOut,
    required this.paySchedule,
    required this.payDay,
    required this.detailCount,
  });

  final TextEditingController workersReq;
  final TextEditingController needType;
  final TextEditingController wageType;
  final TextEditingController startDateInput;
  final TextEditingController endDateInput;
  final TextEditingController aewr;
  final TextEditingController wageRate;
  final TextEditingController pieceRate;
  final TextEditingController alwaysOnCall;
  final TextEditingController sun;
  final TextEditingController mon;
  final TextEditingController tue;
  final TextEditingController wed;
  final TextEditingController thu;
  final TextEditingController fri;
  final TextEditingController sat;
  final TextEditingController total;
  final TextEditingController hourIn;
  final TextEditingController minIn;
  final TextEditingController phaseIn;
  final TextEditingController hourOut;
  final TextEditingController minOut;
  final TextEditingController phaseOut;
  final TextEditingController paySchedule;
  final TextEditingController payDay;
  final TextEditingController detailCount;

  @override
  State<ApplicationJobInfo> createState() => _ApplicationContactJobState();
}

class _ApplicationContactJobState extends State<ApplicationJobInfo> {
  DateTime startAutomatic = DateTime.now();
  DateTime endAutomatic = DateTime.now().add(const Duration(days: 1));

  double countCompleted() {
    int sum = (widget.workersReq.text != '' ? 1 : 0) +
        (widget.needType.text != 'Select' ? 1 : 0) +
        (widget.startDateInput.text != '' ? 1 : 0) +
        (widget.endDateInput.text != '' ? 1 : 0) +
        (widget.wageRate.text != '' ? 1 : 0) +
        (widget.paySchedule.text != 'Select Frequency' ? 1 : 0);
    return sum/6;
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
                      widget.detailCount.text = countCompleted().toString();
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
                ApplicationTextField(
                  label: 'Workers Requested',
                  controller: widget.workersReq,
                ),
                const SizedBox(height: 25.0),
                Text(
                  'Type of Need',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
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
                    value: widget.needType.text,
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
                        widget.needType.text = newValue!;
                      });
                    },
                    items: [
                      'Select',
                      'Seasonal (Annually Recurring)',
                      'Temporary (One-Time Only)'
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
                  'Period of Need',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '(Earliest Possible Start Date: ${DateFormat('MM/dd/yyyy').format(DateTime.now().add(const Duration(days: 50)))})',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 16.0),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 20.0),
                        controller: widget.startDateInput,
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
                            firstDate:
                                DateTime.now().add(const Duration(days: 50)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 730)),
                            initialDate: startAutomatic.isAfter(DateTime.now()
                                    .add(const Duration(days: 50)))
                                ? startAutomatic
                                : DateTime.now().add(const Duration(days: 50)),
                          );
                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('MM/dd/yyyy').format(pickedDate);
                            setState(() {
                              startAutomatic = pickedDate;
                              start = pickedDate;
                              widget.startDateInput.text =
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
                        controller: widget.endDateInput,
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
                            firstDate: startAutomatic.isAfter(DateTime.now())
                                ? startAutomatic.add(const Duration(days: 1))
                                : DateTime.now().add(const Duration(days: 51)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 730)),
                            initialDate: startAutomatic.isAfter(DateTime.now())
                                ? (endAutomatic.isAfter(startAutomatic)
                                    ? endAutomatic
                                    : startAutomatic
                                        .add(const Duration(days: 1)))
                                : DateTime.now().add(const Duration(days: 51)),
                          );

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('MM/dd/yyyy').format(pickedDate);
                            setState(() {
                              endAutomatic = pickedDate;
                              end = pickedDate;
                              widget.endDateInput.text =
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
                  visible: startAutomatic.isAfter(endAutomatic) ? true : false,
                  child: const Text(
                    'Warning: Invalid date range.',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Visibility(
                  visible: endAutomatic.isAfter(DateTime(startAutomatic.year,
                      startAutomatic.month + 10, startAutomatic.day)),
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
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: widget.wageType.text,
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
                        widget.wageType.text = newValue!;
                      });
                    },
                    items: ['Hourly', 'Piece Rate']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 25.0),
                Visibility(
                  visible: widget.wageType.text == 'Hourly',
                  child: Text(
                    'Hourly Wage Offered (USD)',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Visibility(
                  visible: widget.wageType.text == 'Hourly',
                  child: Text(
                    '(Pre-filled amount is your state\'s minimum.)',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16.0),
                  ),
                ),
                Visibility(
                  visible: widget.wageType.text == 'Piece Rate',
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
                  visible: widget.wageType.text == 'Hourly',
                  child: ApplicationTextField(
                    label: 'Wage Rate',
                    controller: widget.wageRate,
                    keyboard: TextInputType.number,
                    format: <TextInputFormatter>[
                      CustomMinValueDoubleFormatter(minInputValue: 00.00),
                    ],
                    onChanged: (value) {
                      setState(() {
                        widget.wageRate.text = value!;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: widget.wageType.text == 'Piece Rate',
                  child: ApplicationTextField(
                    label: 'Piece Rate',
                    controller: widget.pieceRate,
                    keyboard: TextInputType.number,
                    format: <TextInputFormatter>[
                      CustomMinValueDoubleFormatter(minInputValue: 00.00),
                    ],
                    onChanged: (value) {
                      setState(() {
                        widget.wageRate.text = value!;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10.0),
                Visibility(
                  visible: double.tryParse(widget.wageRate.text)! <
                      double.tryParse(widget.aewr.text)!,
                  child: Text(
                    'Warning: The entered wage rate is lower than the minimum allowed in your state. The wage rate must be at least \$${widget.aewr.text}.',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Will this job require workers to be on call 24 hours per day, seven days per week?',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
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
                    value: widget.alwaysOnCall.text,
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
                        widget.alwaysOnCall.text = newValue!;
                      });
                    },
                    items: ['No', 'Yes']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 25.0),
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
                      color: Theme.of(context).primaryColor, fontSize: 16.0),
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.sun,
                          label: 'Sun',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(value!) +
                                      int.parse(widget.mon.text) +
                                      int.parse(widget.tue.text) +
                                      int.parse(widget.wed.text) +
                                      int.parse(widget.thu.text) +
                                      int.parse(widget.fri.text) +
                                      int.parse(widget.sat.text))
                                  .toString();
                            });
                          },
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.mon,
                          label: 'Mon',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(widget.sun.text) +
                                      int.parse(value!) +
                                      int.parse(widget.tue.text) +
                                      int.parse(widget.wed.text) +
                                      int.parse(widget.thu.text) +
                                      int.parse(widget.fri.text) +
                                      int.parse(widget.sat.text))
                                  .toString();
                            });
                          },
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.tue,
                          label: 'Tue',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(widget.sun.text) +
                                      int.parse(widget.mon.text) +
                                      int.parse(value!) +
                                      int.parse(widget.wed.text) +
                                      int.parse(widget.thu.text) +
                                      int.parse(widget.fri.text) +
                                      int.parse(widget.sat.text))
                                  .toString();
                            });
                          },
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.wed,
                          label: 'Wed',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(widget.sun.text) +
                                      int.parse(widget.mon.text) +
                                      int.parse(widget.tue.text) +
                                      int.parse(value!) +
                                      int.parse(widget.thu.text) +
                                      int.parse(widget.fri.text) +
                                      int.parse(widget.sat.text))
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
                          controller: widget.thu,
                          label: 'Thu',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(widget.sun.text) +
                                      int.parse(widget.mon.text) +
                                      int.parse(widget.tue.text) +
                                      int.parse(widget.wed.text) +
                                      int.parse(value!) +
                                      int.parse(widget.fri.text) +
                                      int.parse(widget.sat.text))
                                  .toString();
                            });
                          },
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.fri,
                          label: 'Fri',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(widget.sun.text) +
                                      int.parse(widget.mon.text) +
                                      int.parse(widget.tue.text) +
                                      int.parse(widget.wed.text) +
                                      int.parse(widget.thu.text) +
                                      int.parse(value!) +
                                      int.parse(widget.sat.text))
                                  .toString();
                            });
                          },
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.sat,
                          label: 'Sat',
                          keyboard: TextInputType.number,
                          format: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                            CustomMaxValueIntFormatter(maxInputValue: 12),
                          ],
                          onChanged: (value) {
                            setState(() {
                              widget.total.text = (int.parse(widget.sun.text) +
                                      int.parse(widget.mon.text) +
                                      int.parse(widget.tue.text) +
                                      int.parse(widget.wed.text) +
                                      int.parse(widget.thu.text) +
                                      int.parse(widget.fri.text) +
                                      int.parse(value!))
                                  .toString();
                            });
                          },
                        )),
                    const SizedBox(width: 10.0),
                    Flexible(
                        flex: 1,
                        child: ApplicationTextField(
                          controller: widget.total,
                          label: 'Total',
                          readOnly: true,
                        )),
                  ],
                ),
                const SizedBox(height: 15.0),
                Visibility(
                  visible: int.parse(widget.total.text) < 35 ? true : false,
                  child: const Text(
                    'Warning: You must be able to offer at least 35 hours per week to qualify for the H-2A Program.',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Visibility(
                  visible: int.parse(widget.total.text) < 35 ? true : false,
                  child: const SizedBox(height: 15.0),
                ),
                Visibility(
                  visible: (int.parse(widget.sun.text) != 0 &&
                          int.parse(widget.mon.text) != 0 &&
                          int.parse(widget.tue.text) != 0 &&
                          int.parse(widget.wed.text) != 0 &&
                          int.parse(widget.thu.text) != 0 &&
                          int.parse(widget.fri.text) != 0 &&
                          int.parse(widget.sat.text) != 0)
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
                          controller: widget.hourIn,
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
                          controller: widget.minIn,
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
                              width: 2, color: Theme.of(context).primaryColor),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: widget.phaseIn.text,
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
                              widget.phaseIn.text = newValue!;
                            });
                          },
                          items: <String>['AM', 'PM']
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
                          controller: widget.hourOut,
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
                          controller: widget.minOut,
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
                              width: 2, color: Theme.of(context).primaryColor),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: widget.phaseOut.text,
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
                              widget.phaseOut.text = newValue!;
                            });
                          },
                          items: <String>['AM', 'PM']
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
                              width: 2, color: Theme.of(context).primaryColor),
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: widget.paySchedule.text,
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
                              widget.paySchedule.text = newValue!;
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
                      visible: widget.paySchedule.text != 'Twice per Month',
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
                            value: widget.payDay.text,
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
                                widget.payDay.text = newValue!;
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
                      widget.detailCount.text = countCompleted().toString();
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

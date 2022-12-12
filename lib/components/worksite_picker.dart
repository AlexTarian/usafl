import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'application_list.dart';
import 'state_selector.dart';

class WorksitePicker extends StatefulWidget {
  const WorksitePicker({
    super.key,
    required this.isPrime,
    required this.empOwned,
    required this.employer,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.county,
    required this.controllingBiz,
    required this.start,
    required this.end,
    required this.tempStart,
    required this.tempEnd,
    required this.workersReq,
    required this.tempWorkersReq,
  });

  final bool isPrime;
  final TextEditingController empOwned;
  final TextEditingController employer;
  final TextEditingController controllingBiz;
  final TextEditingController address;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController zip;
  final TextEditingController county;
  final DateTime start;
  final DateTime end;
  final TextEditingController tempStart;
  final TextEditingController tempEnd;
  final String workersReq;
  final TextEditingController tempWorkersReq;

  @override
  State<WorksitePicker> createState() => _WorksitePickerState();
}

class _WorksitePickerState extends State<WorksitePicker> {
  DateTime now = DateTime.now();

  @override
  void initState() {
    widget.controllingBiz.text = widget.empOwned.text == 'Yes'
        ? widget.employer.text
        : widget.controllingBiz.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width * .8,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              widget.isPrime ? 'Primary Worksite' : 'Additional Worksite',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            //const SizedBox(height: 15.0),
            Visibility(
              visible: widget.isPrime,
              child: const Text(
                '(Must be owned or leased by your business)',
                style: TextStyle(color: Colors.red, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15.0),
            Visibility(
              visible: !widget.isPrime,
              child: Row(
                children: <Widget>[
                  const Flexible(
                    flex: 3,
                    child: Text('Is this a worksite you own or lease?'),
                  ),
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
                        value: widget.empOwned.text,
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
                            widget.empOwned.text = newValue!;
                            widget.controllingBiz.text =
                                newValue == 'Yes' ? widget.employer.text : '';
                          });
                        },
                        items: ['Yes', 'No']
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
            Visibility(
              visible: widget.empOwned.text == 'No',
              child: const SizedBox(height: 15.0),
            ),
            Visibility(
              visible: widget.empOwned.text == 'No',
              child: ApplicationTextField(
                label: 'Worksite Owner',
                controller: widget.controllingBiz,
              ),
            ),
            const SizedBox(height: 15.0),
            ApplicationTextField(
              label: 'Address',
              controller: widget.address,
            ),
            const SizedBox(height: 15.0),
            ApplicationTextField(
              label: 'City',
              controller: widget.city,
            ),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                    ),
                    child: StateSelector(state: widget.state),
                  ),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Zip',
                    controller: widget.zip,
                    keyboard: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            ApplicationTextField(
              label: 'County',
              controller: widget.county,
            ),
            const SizedBox(height: 15.0),
            Visibility(
              visible: !widget.isPrime,
              child: Row(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: TextFormField(
                      style: const TextStyle(fontSize: 20.0),
                      controller: widget.tempStart,
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
                          firstDate: start,
                          lastDate:
                              DateTime.now().add(const Duration(days: 730)),
                          initialDate: start,
                        );
                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('MM/dd/yyyy').format(pickedDate);
                          setState(() {
                            widget.tempStart.text =
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
                      controller: widget.tempEnd,
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
                          firstDate: start,
                          lastDate:
                              DateTime.now().add(const Duration(days: 730)),
                          initialDate: end,
                        );

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('MM/dd/yyyy').format(pickedDate);
                          setState(() {
                            widget.tempEnd.text =
                                formattedDate; //set output date to TextField value.
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            Visibility(
              visible: !widget.isPrime,
              child: Row(
                children: <Widget>[
                  const Flexible(
                    flex: 3,
                    child: Text(
                        'How many H-2A workers will be working at this worksite?'),
                  ),
                  Flexible(
                    flex: 1,
                    child: ApplicationTextField(
                      label: 'Workers',
                      controller: widget.tempWorkersReq,
                      keyboard: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

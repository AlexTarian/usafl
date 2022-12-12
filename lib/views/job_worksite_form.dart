import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/components/extra_worksite_list.dart';
import 'package:usafl/components/worksite_picker.dart';
import 'package:collection/collection.dart';


class ApplicationWorksiteInfo extends StatefulWidget {
  const ApplicationWorksiteInfo({
    super.key,
    required this.bizName,
    required this.state,
    required this.start,
    required this.end,
    required this.workersReq,
    required this.primeWorkAddress,
    required this.primeWorkCity,
    required this.primeWorkState,
    required this.primeWorkZip,
    required this.primeWorkCounty,
    required this.primeWorkExtra,
    required this.tempControllingBiz,
    required this.tempEmpOwned,
    required this.tempWorkAddress,
    required this.tempWorkCity,
    required this.tempWorkState,
    required this.tempWorkZip,
    required this.tempWorkCounty,
    required this.tempStart,
    required this.tempEnd,
    required this.tempWorkersReq,
    required this.extraWorksites,
  });

  final TextEditingController bizName;
  final TextEditingController state;
  final DateTime start;
  final DateTime end;
  final TextEditingController workersReq;
  final TextEditingController primeWorkAddress;
  final TextEditingController primeWorkCity;
  final TextEditingController primeWorkState;
  final TextEditingController primeWorkZip;
  final TextEditingController primeWorkCounty;
  final TextEditingController primeWorkExtra;
  final TextEditingController tempControllingBiz;
  final TextEditingController tempEmpOwned;
  final TextEditingController tempWorkAddress;
  final TextEditingController tempWorkCity;
  final TextEditingController tempWorkState;
  final TextEditingController tempWorkZip;
  final TextEditingController tempWorkCounty;
  final TextEditingController tempStart;
  final TextEditingController tempEnd;
  final TextEditingController tempWorkersReq;
  final List<Worksite> extraWorksites;

  @override
  State<ApplicationWorksiteInfo> createState() => _ApplicationWorksiteInfoState();
}

class _ApplicationWorksiteInfoState extends State<ApplicationWorksiteInfo> {
  bool isFLC = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawerEnableOpenDragGesture: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20.0),
            TextButton(
              child: Container(
                width: double.infinity,
                height: 45.0,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    widget.primeWorkAddress.text == ''
                        ? 'Add Primary Worksite'
                        : 'Edit Primary Worksite',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                if (widget.primeWorkAddress.text == '') {
                  setState(() {
                    widget.tempEmpOwned.text = 'Yes';
                    widget.tempControllingBiz.text = widget.bizName.text;
                    widget.tempWorkAddress.text = '';
                    widget.tempWorkCity.text = '';
                    widget.tempWorkState.text = widget.state.text;
                    widget.tempWorkZip.text = '';
                    widget.tempWorkCounty.text = '';
                    widget.tempStart.text = DateFormat('MM/dd/yyyy')
                        .format(widget.start)
                        .toString();
                    widget.tempEnd.text =
                        DateFormat('MM/dd/yyyy').format(widget.end).toString();
                  });
                } else {
                  setState(() {
                    widget.tempEmpOwned.text = 'Yes';
                    widget.tempControllingBiz.text = widget.bizName.text;
                    widget.tempWorkAddress.text = widget.primeWorkAddress.text;
                    widget.tempWorkCity.text = widget.primeWorkCity.text;
                    widget.tempWorkState.text = widget.primeWorkState.text;
                    widget.tempWorkZip.text = widget.primeWorkZip.text;
                    widget.tempWorkCounty.text = widget.primeWorkCounty.text;
                    widget.tempWorkersReq.text = widget.workersReq.text;
                    widget.tempStart.text = DateFormat('MM/dd/yyyy')
                        .format(widget.start)
                        .toString();
                    widget.tempEnd.text =
                        DateFormat('MM/dd/yyyy').format(widget.end).toString();
                  });
                }
                Alert(
                  context: context,
                  image: WorksitePicker(
                    isPrime: true,
                    empOwned: widget.tempEmpOwned,
                    employer: widget.bizName,
                    controllingBiz: widget.tempControllingBiz,
                    address: widget.tempWorkAddress,
                    city: widget.tempWorkCity,
                    state: widget.tempWorkState,
                    zip: widget.tempWorkZip,
                    county: widget.tempWorkCounty,
                    start: widget.start,
                    tempStart: widget.tempStart,
                    end: widget.end,
                    tempEnd: widget.tempEnd,
                    workersReq: widget.workersReq.text,
                    tempWorkersReq: widget.tempWorkersReq,
                  ),
                  buttons: [
                    DialogButton(
                      color: usaflAccent,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    DialogButton(
                      color: usaflAccent,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.primeWorkAddress.text = widget.tempWorkAddress.text;
                          widget.primeWorkCity.text = widget.tempWorkCity.text;
                          widget.primeWorkState.text = widget.tempWorkState.text;
                          widget.primeWorkZip.text = widget.tempWorkZip.text;
                          widget.primeWorkCounty.text = widget.tempWorkCounty.text;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ).show();
              },
            ),
            const SizedBox(height: 20.0),
            Visibility(
              visible: widget.primeWorkAddress.text != '',
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                ),
                child: ListTile(
                  leading: const Icon(Icons.location_on),
                  title: Text(
                    '${widget.primeWorkAddress.text}\n${widget.primeWorkCity.text}, ${widget.primeWorkState.text} ${widget.primeWorkZip.text}',
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
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
                    'Add Additional Worksite',
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
                  widget.tempEmpOwned.text = 'Yes';
                  widget.tempControllingBiz.text = '';
                  widget.tempWorkAddress.text = '';
                  widget.tempWorkCity.text = '';
                  widget.tempWorkState.text = widget.state.text;
                  widget.tempWorkZip.text = '';
                  widget.tempWorkCounty.text = '';
                  widget.tempWorkersReq.text = widget.workersReq.text;
                  widget.tempStart.text =
                      DateFormat('MM/dd/yyyy').format(widget.start).toString();
                  widget.tempEnd.text =
                      DateFormat('MM/dd/yyyy').format(widget.end).toString();
                });
                Alert(
                  context: context,
                  image: WorksitePicker(
                    isPrime: false,
                    empOwned: widget.tempEmpOwned,
                    employer: widget.bizName,
                    controllingBiz: widget.tempControllingBiz,
                    address: widget.tempWorkAddress,
                    city: widget.tempWorkCity,
                    state: widget.tempWorkState,
                    zip: widget.tempWorkZip,
                    county: widget.tempWorkCounty,
                    start: widget.start,
                    tempStart: widget.tempStart,
                    end: widget.end,
                    tempEnd: widget.tempEnd,
                    workersReq: widget.workersReq.text,
                    tempWorkersReq: widget.tempWorkersReq,
                  ),
                  buttons: [
                    DialogButton(
                      color: usaflAccent,
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    DialogButton(
                      color: usaflAccent,
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            color: Colors.white, fontSize: 20.0),
                      ),
                      onPressed: () {
                        setState(() {
                          widget.extraWorksites.add(
                            Worksite(
                              employer: widget.tempControllingBiz.text,
                              owned: widget.tempEmpOwned.text == 'Yes'
                                  ? true
                                  : false,
                              street: widget.tempWorkAddress.text,
                              city: widget.tempWorkCity.text,
                              state: widget.tempWorkState.text,
                              zip: widget.tempWorkZip.text,
                              county: widget.tempWorkCounty.text,
                              start: widget.tempStart.text,
                              end: widget.tempEnd.text,
                              workers: widget.workersReq.text,
                            ),
                          );
                        });
                        if ((widget.extraWorksites.firstWhereOrNull(
                                (worksite) =>
                            worksite?.isEmpOwned == false)) ==
                            null) {
                          setState(() {
                            isFLC = false;
                          });
                        } else {
                          setState(() {
                            isFLC = true;
                          });
                        }
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ).show();
              },
            ),
            const SizedBox(height: 20.0),
            Visibility(
              visible: isFLC == true,
              child: const Text(
                'CAUTION: Employers are NOT allowed to have H-2A workers perform job duties on worksites not owned or leased by their business UNLESS they first register as Farm Labor Contractors (FLCs). Only include worksites like this if you are an FLC or plan to become one.',
                style: TextStyle(color: Colors.red, fontSize: 20.0),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500.0,
              child: ListView.builder(
                itemCount: widget.extraWorksites.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 2),
                      ),
                      child: ListTile(
                        title: Text(
                          '${widget.extraWorksites[index].siteStreet},\n${widget.extraWorksites[index].siteCity}, ${widget.extraWorksites[index].siteState} ${widget.extraWorksites[index].siteZip}',
                          style: const TextStyle(fontSize: 20.0),
                        ),
                        leading:
                        widget.extraWorksites[index].isEmpOwned == true
                            ? const Icon(Icons.location_on)
                            : const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        trailing: Text(
                          '${widget.extraWorksites[index].startDate}\n${widget.extraWorksites[index].endDate}',
                          style: const TextStyle(fontSize: 18.0),
                        ),
                        onTap: () {
                          setState(() {
                            widget.tempEmpOwned.text =
                            widget.extraWorksites[index].isEmpOwned == true
                                ? 'Yes'
                                : 'No';
                            widget.tempControllingBiz.text =
                                widget.extraWorksites[index].controllingBiz;
                            widget.tempWorkAddress.text =
                                widget.extraWorksites[index].siteStreet;
                            widget.tempWorkCity.text =
                                widget.extraWorksites[index].siteCity;
                            widget.tempWorkState.text =
                                widget.extraWorksites[index].siteState;
                            widget.tempWorkZip.text =
                                widget.extraWorksites[index].siteZip;
                            widget.tempWorkCounty.text =
                                widget.extraWorksites[index].siteCounty;
                            widget.tempStart.text =
                                widget.extraWorksites[index].startDate;
                            widget.tempEnd.text =
                                widget.extraWorksites[index].endDate;
                            widget.tempWorkersReq.text =
                                widget.extraWorksites[index].workersNeeded;
                          });
                          Alert(
                            context: context,
                            image: WorksitePicker(
                              isPrime: false,
                              empOwned: widget.tempEmpOwned,
                              employer: widget.bizName,
                              controllingBiz: widget.tempControllingBiz,
                              address: widget.tempWorkAddress,
                              city: widget.tempWorkCity,
                              state: widget.tempWorkState,
                              zip: widget.tempWorkZip,
                              county: widget.tempWorkCounty,
                              start: widget.start,
                              tempStart: widget.tempStart,
                              end: widget.end,
                              tempEnd: widget.tempEnd,
                              workersReq: widget.workersReq.text,
                              tempWorkersReq: widget.tempWorkersReq,
                            ),
                            buttons: [
                              DialogButton(
                                color: usaflAccent,
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.extraWorksites.removeAt(index);
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              DialogButton(
                                color: usaflAccent,
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    widget.extraWorksites.removeAt(index);
                                    widget.extraWorksites.insert(
                                      index,
                                      Worksite(
                                        employer:
                                        widget.tempControllingBiz.text,
                                        owned:
                                        widget.tempEmpOwned.text == 'Yes'
                                            ? true
                                            : false,
                                        street: widget.tempWorkAddress.text,
                                        city: widget.tempWorkCity.text,
                                        state: widget.tempWorkState.text,
                                        zip: widget.tempWorkZip.text,
                                        county: widget.tempWorkCounty.text,
                                        start: widget.tempStart.text,
                                        end: widget.tempEnd.text,
                                        workers: widget.tempWorkersReq.text,
                                      ),
                                    );
                                  });
                                  if ((widget.extraWorksites.firstWhereOrNull(
                                          (worksite) =>
                                      worksite?.isEmpOwned ==
                                          false)) ==
                                      null) {
                                    setState(() {
                                      isFLC = false;
                                    });
                                  } else {
                                    setState(() {
                                      isFLC = true;
                                    });
                                  }
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ).show();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 500.0),
          ],
        ),
      ),
    );
  }
}
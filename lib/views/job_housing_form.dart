import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:usafl/views/application_viewer_screen.dart';
import 'package:usafl/components/extra_housing_list.dart';
import 'package:usafl/components/housing_picker.dart';

class ApplicationHousingInfo extends StatefulWidget {
  const ApplicationHousingInfo({
    super.key,
    required this.state,
    required this.primeHousingStatus,
    required this.primeHousingType,
    required this.primeHousingAddress,
    required this.primeHousingCity,
    required this.primeHousingState,
    required this.primeHousingZip,
    required this.primeHousingCounty,
    required this.primeHousingUnits,
    required this.primeHousingBedrooms,
    required this.primeHousingBeds,
    required this.primeHousingOccupancy,
    required this.primeHousingKitchen,
    required this.tempHousingStatus,
    required this.tempHousingType,
    required this.tempHousingAddress,
    required this.tempHousingCity,
    required this.tempHousingState,
    required this.tempHousingZip,
    required this.tempHousingCounty,
    required this.tempHousingUnits,
    required this.tempHousingBedrooms,
    required this.tempHousingBeds,
    required this.tempHousingOccupancy,
    required this.tempHousingKitchen,
    required this.extraHousing,
    required this.housingCount,
  });

  final TextEditingController state;
  final TextEditingController primeHousingStatus;
  final TextEditingController primeHousingType;
  final TextEditingController primeHousingAddress;
  final TextEditingController primeHousingCity;
  final TextEditingController primeHousingState;
  final TextEditingController primeHousingZip;
  final TextEditingController primeHousingCounty;
  final TextEditingController primeHousingUnits;
  final TextEditingController primeHousingBedrooms;
  final TextEditingController primeHousingBeds;
  final TextEditingController primeHousingOccupancy;
  final TextEditingController primeHousingKitchen;
  final TextEditingController tempHousingStatus;
  final TextEditingController tempHousingType;
  final TextEditingController tempHousingAddress;
  final TextEditingController tempHousingCity;
  final TextEditingController tempHousingState;
  final TextEditingController tempHousingZip;
  final TextEditingController tempHousingCounty;
  final TextEditingController tempHousingUnits;
  final TextEditingController tempHousingBedrooms;
  final TextEditingController tempHousingBeds;
  final TextEditingController tempHousingOccupancy;
  final TextEditingController tempHousingKitchen;
  final List<Housing> extraHousing;
  final TextEditingController housingCount;

  @override
  State<ApplicationHousingInfo> createState() => _ApplicationHousingInfoState();
}

class _ApplicationHousingInfoState extends State<ApplicationHousingInfo> {

  double countCompleted() {
    int sum = (widget.primeHousingStatus.text != '' ? 1 : 0) +
        (widget.primeHousingType.text != '' ? 1 : 0) +
        (widget.primeHousingAddress.text != '' ? 1 : 0) +
        (widget.primeHousingCity.text != '' ? 1 : 0) +
        (widget.primeHousingState.text != 'State' ? 1 : 0) +
        (widget.primeHousingZip.text != '' ? 1 : 0) +
        (widget.primeHousingCounty.text != '' ? 1 : 0) +
        (widget.primeHousingUnits.text != '' ? 1 : 0) +
        (widget.primeHousingBedrooms.text != '' ? 1 : 0) +
        (widget.primeHousingBeds.text != '' ? 1 : 0) +
        (widget.primeHousingOccupancy.text != '' ? 1 : 0) +
        (widget.primeHousingKitchen.text != 'Select' ? 1 : 0);
    return sum/12;
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
                      widget.housingCount.text = countCompleted().toString();
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
                        widget.primeHousingAddress.text == ''
                            ? 'Add Primary Worker Housing'
                            : 'Edit Primary Worker Housing',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (widget.primeHousingAddress.text == '') {
                      setState(() {
                        widget.tempHousingStatus.text = 'Select Housing Status';
                        widget.tempHousingType.text =
                            'What kind of housing is this?';
                        widget.tempHousingAddress.text = '';
                        widget.tempHousingCity.text = '';
                        widget.tempHousingState.text = widget.state.text;
                        widget.tempHousingZip.text = '';
                        widget.tempHousingCounty.text = '';
                        widget.tempHousingUnits.text = '';
                        widget.tempHousingBedrooms.text = '';
                        widget.tempHousingBeds.text = '';
                        widget.tempHousingOccupancy.text = '';
                        widget.tempHousingKitchen.text = 'Select';
                      });
                    } else {
                      setState(() {
                        widget.tempHousingStatus.text =
                            widget.primeHousingStatus.text;
                        widget.tempHousingType.text =
                            widget.primeHousingType.text;
                        widget.tempHousingAddress.text =
                            widget.primeHousingAddress.text;
                        widget.tempHousingCity.text =
                            widget.primeHousingCity.text;
                        widget.tempHousingState.text =
                            widget.primeHousingState.text;
                        widget.tempHousingZip.text =
                            widget.primeHousingZip.text;
                        widget.tempHousingCounty.text =
                            widget.primeHousingCounty.text;
                        widget.tempHousingUnits.text =
                            widget.primeHousingUnits.text;
                        widget.tempHousingBedrooms.text =
                            widget.primeHousingBedrooms.text;
                        widget.tempHousingBeds.text =
                            widget.primeHousingBeds.text;
                        widget.tempHousingOccupancy.text =
                            widget.primeHousingOccupancy.text;
                        widget.tempHousingKitchen.text =
                            widget.primeHousingKitchen.text;
                      });
                    }
                    Alert(
                      context: context,
                      image: HousingPicker(
                        isPrime: true,
                        status: widget.tempHousingStatus,
                        type: widget.tempHousingType,
                        address: widget.tempHousingAddress,
                        city: widget.tempHousingCity,
                        state: widget.tempHousingState,
                        zip: widget.tempHousingZip,
                        county: widget.tempHousingCounty,
                        units: widget.tempHousingUnits,
                        bedrooms: widget.tempHousingBedrooms,
                        beds: widget.tempHousingBeds,
                        occupancy: widget.tempHousingOccupancy,
                        kitchen: widget.tempHousingKitchen,
                      ),
                      buttons: [
                        DialogButton(
                          color: usaflAccent,
                          child: const Text(
                            'Cancel',
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
                            'Save',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.primeHousingStatus.text =
                                  widget.tempHousingStatus.text;
                              widget.primeHousingType.text =
                                  widget.tempHousingType.text;
                              widget.primeHousingAddress.text =
                                  widget.tempHousingAddress.text;
                              widget.primeHousingCity.text =
                                  widget.tempHousingCity.text;
                              widget.primeHousingState.text =
                                  widget.tempHousingState.text;
                              widget.primeHousingZip.text =
                                  widget.tempHousingZip.text;
                              widget.primeHousingCounty.text =
                                  widget.tempHousingCounty.text;
                              widget.primeHousingUnits.text =
                                  widget.tempHousingUnits.text;
                              widget.primeHousingBedrooms.text =
                                  widget.tempHousingBedrooms.text;
                              widget.primeHousingBeds.text =
                                  widget.tempHousingBeds.text;
                              widget.primeHousingOccupancy.text =
                                  widget.tempHousingOccupancy.text;
                              widget.primeHousingKitchen.text =
                                  widget.tempHousingKitchen.text;
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
                  visible: widget.primeHousingAddress.text != '',
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.home),
                      title: Text(
                        '${widget.primeHousingAddress.text}\n${widget.primeHousingCity.text}, ${widget.primeHousingState.text} ${widget.primeHousingZip.text}',
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
                        'Add Additional Worker Housing',
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
                      widget.tempHousingStatus.text = 'Select Housing Status';
                      widget.tempHousingType.text =
                          'What kind of housing is this?';
                      widget.tempHousingAddress.text = '';
                      widget.tempHousingCity.text = '';
                      widget.tempHousingState.text = widget.state.text;
                      widget.tempHousingZip.text = '';
                      widget.tempHousingCounty.text = '';
                      widget.tempHousingUnits.text = '';
                      widget.tempHousingBeds.text = '';
                      widget.tempHousingBedrooms.text = '';
                      widget.tempHousingOccupancy.text = '';
                      widget.tempHousingKitchen.text = 'Select';
                    });
                    Alert(
                      context: context,
                      image: HousingPicker(
                        isPrime: false,
                        status: widget.tempHousingStatus,
                        type: widget.tempHousingType,
                        address: widget.tempHousingAddress,
                        city: widget.tempHousingCity,
                        state: widget.tempHousingState,
                        zip: widget.tempHousingZip,
                        county: widget.tempHousingCounty,
                        units: widget.tempHousingUnits,
                        bedrooms: widget.tempHousingBedrooms,
                        beds: widget.tempHousingBeds,
                        occupancy: widget.tempHousingOccupancy,
                        kitchen: widget.tempHousingKitchen,
                      ),
                      buttons: [
                        DialogButton(
                          color: usaflAccent,
                          child: const Text(
                            'Cancel',
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
                            'Save',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onPressed: () {
                            setState(() {
                              widget.extraHousing.add(
                                Housing(
                                  status: widget.tempHousingStatus.text,
                                  type: widget.tempHousingType.text,
                                  street: widget.tempHousingAddress.text,
                                  city: widget.tempHousingCity.text,
                                  state: widget.tempHousingState.text,
                                  zip: widget.tempHousingZip.text,
                                  county: widget.tempHousingCounty.text,
                                  units: widget.tempHousingUnits.text,
                                  bedrooms: widget.tempHousingBedrooms.text,
                                  beds: widget.tempHousingBeds.text,
                                  occupancy: widget.tempHousingOccupancy.text,
                                  kitchen: widget.tempHousingKitchen.text,
                                ),
                              );
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ).show();
                  },
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 500.0,
                  child: ListView.builder(
                    itemCount: widget.extraHousing.length,
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
                              '${widget.extraHousing[index].housingStreet},\n${widget.extraHousing[index].housingCity}, ${widget.extraHousing[index].housingState} ${widget.extraHousing[index].housingZip}',
                              style: const TextStyle(fontSize: 20.0),
                            ),
                            leading: widget.extraHousing[index].housingStatus ==
                                    'Employer-owned Housing'
                                ? const Icon(Icons.home)
                                : const Icon(Icons.home_outlined),
                            onTap: () {
                              setState(() {
                                widget.tempHousingStatus.text =
                                    widget.extraHousing[index].housingStatus;
                                widget.tempHousingType.text =
                                    widget.extraHousing[index].housingType;
                                widget.tempHousingAddress.text =
                                    widget.extraHousing[index].housingStreet;
                                widget.tempHousingCity.text =
                                    widget.extraHousing[index].housingCity;
                                widget.tempHousingState.text =
                                    widget.extraHousing[index].housingState;
                                widget.tempHousingZip.text =
                                    widget.extraHousing[index].housingZip;
                                widget.tempHousingCounty.text =
                                    widget.extraHousing[index].housingCounty;
                                widget.tempHousingUnits.text =
                                    widget.extraHousing[index].housingUnits;
                                widget.tempHousingBedrooms.text =
                                    widget.extraHousing[index].housingBedrooms;
                                widget.tempHousingBeds.text =
                                    widget.extraHousing[index].housingBeds;
                                widget.tempHousingOccupancy.text =
                                    widget.extraHousing[index].housingOccupancy;
                                widget.tempHousingKitchen.text =
                                    widget.extraHousing[index].housingKitchen;
                              });
                              Alert(
                                context: context,
                                image: HousingPicker(
                                  isPrime: false,
                                  status: widget.tempHousingStatus,
                                  type: widget.tempHousingType,
                                  address: widget.tempHousingAddress,
                                  city: widget.tempHousingCity,
                                  state: widget.tempHousingState,
                                  zip: widget.tempHousingZip,
                                  county: widget.tempHousingCounty,
                                  units: widget.tempHousingUnits,
                                  bedrooms: widget.tempHousingBedrooms,
                                  beds: widget.tempHousingBeds,
                                  occupancy: widget.tempHousingOccupancy,
                                  kitchen: widget.tempHousingKitchen,
                                ),
                                buttons: [
                                  DialogButton(
                                    color: usaflAccent,
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.extraHousing.removeAt(index);
                                      });
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
                                        widget.extraHousing.removeAt(index);
                                        widget.extraHousing.insert(
                                          index,
                                          Housing(
                                            status:
                                                widget.tempHousingStatus.text,
                                            type: widget.tempHousingType.text,
                                            street:
                                                widget.tempHousingAddress.text,
                                            city: widget.tempHousingCity.text,
                                            state: widget.tempHousingState.text,
                                            zip: widget.tempHousingZip.text,
                                            county:
                                                widget.tempHousingCounty.text,
                                            units: widget.tempHousingUnits.text,
                                            bedrooms:
                                                widget.tempHousingBedrooms.text,
                                            beds: widget.tempHousingBeds.text,
                                            occupancy: widget
                                                .tempHousingOccupancy.text,
                                            kitchen:
                                                widget.tempHousingKitchen.text,
                                          ),
                                        );
                                      });
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
                // const SizedBox(height: 30.0),
                // TextButton(
                //   child: Container(
                //     width: double.infinity,
                //     height: 45.0,
                //     decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColor,
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     child: const Center(
                //       child: Text('Save & Continue',
                //         style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 24.0,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //     ),
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       widget.housingCount.text = countCompleted().toString();
                //     });
                //     Navigator.pop(context);
                //   },
                // ),
                const SizedBox(height: 500.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

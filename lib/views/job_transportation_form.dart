import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/components/vehicle_picker.dart';
import 'package:usafl/components/application_list.dart';
import 'package:usafl/components/vehicle_list.dart';

class ApplicationTransportInfo extends StatefulWidget {
  const ApplicationTransportInfo({
    super.key,
    required this.transpOption,
    required this.separateVehicles,
    required this.vehiclesProvided,
    required this.vehicleList,
    required this.fuelExpenseHandling,
    required this.vehicleProvisionConfirmation,
    required this.provVehicleForErrands,
    required this.pickupTime,
    required this.pickupLocation,
    required this.pickupCustomLocation,
    required this.dropOffTime,
    required this.dropOffLocation,
    required this.dropOffCustomLocation,
    required this.vehicleOwner,
    required this.transpService,
    required this.errandHandling,
    required this.errandVehicles,
    required this.errandVehiclesList,
    required this.otherWorkers,
    required this.confirmOne,
    required this.confirmTwo,
    required this.confirmThree,
    required this.transpCount,
  });

  final TextEditingController transpOption;
  final TextEditingController separateVehicles;
  final TextEditingController vehiclesProvided;
  final TextEditingController vehicleList;
  final TextEditingController fuelExpenseHandling;
  final TextEditingController vehicleProvisionConfirmation;
  final TextEditingController provVehicleForErrands;
  final TextEditingController pickupTime;
  final TextEditingController pickupLocation;
  final TextEditingController pickupCustomLocation;
  final TextEditingController dropOffTime;
  final TextEditingController dropOffLocation;
  final TextEditingController dropOffCustomLocation;
  final TextEditingController vehicleOwner;
  final TextEditingController transpService;
  final TextEditingController errandHandling;
  final TextEditingController errandVehicles;
  final TextEditingController errandVehiclesList;
  final TextEditingController otherWorkers;
  final TextEditingController confirmOne;
  final TextEditingController confirmTwo;
  final TextEditingController confirmThree;
  final TextEditingController transpCount;

  @override
  State<ApplicationTransportInfo> createState() => _ApplicationTransportInfoState();
}

class _ApplicationTransportInfoState extends State<ApplicationTransportInfo> {
  List<ProvidedVehicle> vehicleList = [];

  double countCompleted() {
    int sum = (widget.transpOption.text != '' ? 1 : 0) +
        (widget.errandHandling.text != '' ? 1 : 0) +
        (widget.otherWorkers.text != '' ? 1 : 0) +
        (widget.confirmOne.text != '' ? 1 : 0) +
        (widget.confirmTwo.text != '' ? 1 : 0) +
        (widget.confirmThree.text != '' ? 1 : 0);
    return sum/11;
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
                      widget.transpCount.text = countCompleted().toString();
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
                  'How do you plan to transport workers between their housing and the worksite?',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: widget.transpOption.text,
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
                        widget.transpOption.text = newValue!;
                      });
                    },
                    items: [
                      'Select',
                      'Provide workers with vehicles and let them drive themselves.',
                      'Transport workers by bus, truck, etc.',
                      'Not Applicable. Housing is within walking distance of the worksite.',
                    ]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  'Will each worker have a provided vehicle, or will workers share vehicles?',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: widget.separateVehicles.text,
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
                        widget.separateVehicles.text = newValue!;
                      });
                    },
                    items: [
                      'Select',
                      'Each worker will have his or her own vehicle.',
                      'Workers will share vehicles.',
                    ]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextButton(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const Center(
                            child: Text('Add Vehicle',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Alert(
                            context: context,
                            image: VehiclePicker(vehicleCount: widget.vehiclesProvided, vehicleList: vehicleList,),
                            buttons: [
                              DialogButton(
                                color: usaflAccent,
                                child: const Text(
                                  'Save',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    String value = '';
                                    widget.vehiclesProvided.text = '${vehicleList.length}';
                                    for (var element in vehicleList) {
                                      value = value + '${element.year} ${element.make} ${element.model} (${element.type}): ${element.seats} seats; ';
                                    }
                                    widget.vehicleList.text = value;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ).show();
                        },
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Flexible(
                      flex: 1,
                      child: ApplicationTextField(
                        label: 'Vehicles provided',
                        controller: widget.vehiclesProvided,
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                ApplicationTextField(
                  label: 'Vehicles List',
                  controller: widget.vehicleList,
                  readOnly: true,
                ),
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
                      widget.transpCount.text = countCompleted().toString();
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



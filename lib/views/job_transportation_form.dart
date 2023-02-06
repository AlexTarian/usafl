import 'package:flutter/material.dart';
import 'package:usafl/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:usafl/components/vehicle_picker.dart';
import 'package:usafl/components/application_text_field.dart';
import 'package:usafl/components/vehicle_list.dart';

class ApplicationTransportInfo extends StatefulWidget {
  const ApplicationTransportInfo({
    super.key,
    required this.transpOption,
    required this.separateVehicles,
    required this.vehiclesProvided,
    required this.vehicleList,
    required this.fuelExpenseHandling,
    required this.provVehicleForErrands,
    required this.pickupLocation,
    required this.pickupCustomLocation,
    required this.dropOffLocation,
    required this.dropOffCustomLocation,
    required this.vehicleOwner,
    required this.transpService,
    required this.errandHandling,
    required this.errandVehicles,
    required this.errandVehiclesList,
    required this.errandExplain,
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
  final TextEditingController provVehicleForErrands;
  final TextEditingController pickupLocation;
  final TextEditingController pickupCustomLocation;
  final TextEditingController dropOffLocation;
  final TextEditingController dropOffCustomLocation;
  final TextEditingController vehicleOwner;
  final TextEditingController transpService;
  final TextEditingController errandHandling;
  final TextEditingController errandVehicles;
  final TextEditingController errandVehiclesList;
  final TextEditingController errandExplain;
  final TextEditingController otherWorkers;
  final TextEditingController confirmOne;
  final TextEditingController confirmTwo;
  final TextEditingController confirmThree;
  final TextEditingController transpCount;

  @override
  State<ApplicationTransportInfo> createState() =>
      _ApplicationTransportInfoState();
}

class _ApplicationTransportInfoState extends State<ApplicationTransportInfo> {
  List<ProvidedVehicle> primaryVehicleList = [];
  List<ProvidedVehicle> errandVehicleList = [];
  bool confirm1 = false;
  bool confirm2 = false;
  bool confirm3 = false;
  List<String> methods = [
    'Select',
    'Provide workers with vehicles and let them drive themselves.',
    'Transport workers by bus, truck, etc.',
    'Not Applicable. Housing is within walking distance of the worksite.',
  ];
  String transMethod = '';

  @override
  void initState() {
    transMethod = widget.transpOption.text;
    confirm1 = widget.confirmOne.text == "true" ? true : false;
    confirm2 = widget.confirmTwo.text == "true" ? true : false;
    confirm3 = widget.confirmThree.text == "true" ? true : false;
    super.initState();
  }

  double countCompleted() {
    int sum = (widget.transpOption.text != 'Select' ? 1 : 0) +
        ((widget.transpOption.text != methods[1] || widget.separateVehicles.text != 'Select') ? 1 : 0) +
        ((widget.transpOption.text != methods[1] || widget.vehiclesProvided.text != '0') ? 1 : 0) +
        ((widget.transpOption.text != methods[1] || widget.fuelExpenseHandling.text != 'Select') ? 1 : 0) +
        ((widget.transpOption.text != methods[1] || widget.provVehicleForErrands.text != 'Select') ? 1 : 0) +
        ((widget.transpOption.text != methods[2] || widget.pickupLocation.text != 'Select') ? 1 : 0) +
        ((widget.pickupLocation.text != 'A designated pickup location:' || widget.pickupCustomLocation.text != '') ? 1 : 0) +
        ((widget.transpOption.text != methods[2] || widget.dropOffLocation.text != 'Select') ? 1 : 0) +
        ((widget.dropOffLocation.text != 'A different, designated drop off location:' ||widget.dropOffCustomLocation.text != '') ? 1 : 0) +
        ((widget.transpOption.text != methods[2] || widget.vehicleOwner.text != 'Select') ? 1 : 0) +
        ((widget.vehicleOwner.text != "My business" || widget.vehiclesProvided.text != '0') ? 1 : 0) +
        ((widget.vehicleOwner.text != "Third-party transportation service" || widget.transpService.text != '') ? 1 : 0) +
        ((widget.provVehicleForErrands.text == 'Yes' || widget.errandHandling.text != 'Select') ? 1 : 0) +
        ((widget.errandHandling.text != 'Provide workers with vehicles and let them drive themselves.' || widget.errandVehicles.text != '0') ? 1 : 0) +
        ((widget.errandHandling.text != 'Provide workers with vehicles and let them drive themselves.' || widget.errandVehiclesList.text != '') ? 1 : 0) +
        ((widget.errandHandling.text != 'Other:' || widget.errandExplain.text != '') ? 1 : 0) +
        (widget.otherWorkers.text != 'Select' ? 1 : 0) +
        (widget.confirmOne.text == 'true' ? 1 : 0) +
        (widget.confirmTwo.text == 'true' ? 1 : 0) +
        (widget.confirmThree.text == 'true' ? 1 : 0);

    return sum / 20;
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
                        fontSize: 20.0, color: Theme.of(context).primaryColor),
                    underline: Container(
                      width: double.infinity,
                      height: 2,
                      color: Colors.transparent,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        widget.transpOption.text = newValue!;
                        transMethod = newValue;

                        if(transMethod == methods[1]) {
                          widget.pickupLocation.text = 'Select';
                          widget.pickupCustomLocation.text = '';
                          widget.dropOffLocation.text = 'Select';
                          widget.dropOffCustomLocation.text = '';
                          widget.vehicleOwner.text = 'Select';
                          widget.transpService.text = '';
                        } else if(transMethod == methods[2]){
                          widget.separateVehicles.text = 'Select';
                          widget.vehiclesProvided.text = '0';
                          widget.vehicleList.text = '';
                          widget.fuelExpenseHandling.text = 'Select';
                          widget.provVehicleForErrands.text = 'Select';
                        } else if(transMethod == methods[3]){
                          widget.separateVehicles.text = 'Select';
                          widget.vehiclesProvided.text = '0';
                          widget.vehicleList.text = '';
                          widget.fuelExpenseHandling.text = 'Select';
                          widget.provVehicleForErrands.text = 'Select';
                          widget.pickupLocation.text = 'Select';
                          widget.pickupCustomLocation.text = '';
                          widget.dropOffLocation.text = 'Select';
                          widget.dropOffCustomLocation.text = '';
                          widget.vehicleOwner.text = 'Select';
                          widget.transpService.text = '';
                        }
                      });
                    },
                    items:
                        methods.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Visibility(
                  visible: transMethod == methods[1],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
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
                          ].map<DropdownMenuItem<String>>((String value) {
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
                                  child: Text(
                                    'Add Vehicle',
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
                                  image: VehiclePicker(
                                    vehicleCount: widget.vehiclesProvided,
                                    vehicleList: primaryVehicleList,
                                  ),
                                  buttons: [
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
                                          String value = '';
                                          widget.vehiclesProvided.text =
                                              '${primaryVehicleList.length}';
                                          for (var element in primaryVehicleList) {
                                            value = value +
                                                '${element.year} ${element.make} ${element.model} (${element.type}): ${element.seats} seats; ';
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
                      Text(
                        'How will you reimburse workers for fuel and maintenance expenses?',
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
                          value: widget.fuelExpenseHandling.text,
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
                              widget.fuelExpenseHandling.text = newValue!;
                            });
                          },
                          items: [
                            'Select',
                            'I will reimburse workers for such expenses once they provide receipts.',
                            'I will give workers a card to pay for such expenses.',
                            'I will give workers fuel from a tank located at headquarters.',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'Will workers be able to use these vehicles for personal errands (e.g., trips to the grocery store)?',
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
                          value: widget.provVehicleForErrands.text,
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
                              widget.provVehicleForErrands.text = newValue!;
                              if(widget.provVehicleForErrands.text == 'Yes'){
                                widget.errandHandling.text = 'Select';
                                widget.errandVehicles.text = '0';
                                widget.errandVehiclesList.text = '';
                              }
                            });
                          },
                          items: [
                            'Select',
                            'Yes',
                            'No',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: transMethod == methods[2],
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      Text('Where will workers be picked up at the start of each workday?',
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
                          value: widget.pickupLocation.text,
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
                              widget.pickupLocation.text = newValue!;
                              if(widget.pickupLocation.text != 'A designated pickup location:'){
                                widget.pickupCustomLocation.text = '';
                              }
                            });
                          },
                          items: [
                            'Select',
                            'The worker housing',
                            'A designated pickup location:',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Visibility(
                        visible: widget.pickupLocation.text == 'A designated pickup location:',
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 15.0),
                            ApplicationTextField(
                              label: 'Pickup Location Address',
                              controller: widget.pickupCustomLocation,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text('Where will workers be dropped off at the end of each workday?',
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
                          value: widget.dropOffLocation.text,
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
                              widget.dropOffLocation.text = newValue!;
                              if(widget.dropOffLocation.text != 'A different, designated drop off location:'){
                                widget.dropOffCustomLocation.text = '';
                              }
                            });
                          },
                          items: [
                            'Select',
                            'The worker housing',
                            'The designated pickup location',
                            'A different, designated drop off location:',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Visibility(
                        visible: widget.dropOffLocation.text == 'A different, designated drop off location:',
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 15.0),
                            ApplicationTextField(
                              label: 'Drop Off Location Address',
                              controller: widget.dropOffCustomLocation,
                            ),

                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Text('Will the vehicles used be owned by your business, or will they belong to a third-party transportation service?',
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
                          value: widget.vehicleOwner.text,
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
                              widget.vehicleOwner.text = newValue!;
                              if(widget.vehicleOwner.text == 'My business'){
                                widget.transpService.text = '';
                              } else if(widget.vehicleOwner.text == 'Third-party transportation service:'){
                                widget.vehiclesProvided.text = '';
                                widget.vehicleList.text = '';
                              }
                            });
                          },
                          items: [
                            'Select',
                            'My business',
                            'Third-party transportation service:',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Visibility(
                        visible: widget.vehicleOwner.text == 'My business',
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 15.0),
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
                                        child: Text(
                                          'Add Vehicle',
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
                                        image: VehiclePicker(
                                          vehicleCount: widget.vehiclesProvided,
                                          vehicleList: primaryVehicleList,
                                        ),
                                        buttons: [
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
                                                String value = '';
                                                widget.vehiclesProvided.text =
                                                '${primaryVehicleList.length}';
                                                for (var element in primaryVehicleList) {
                                                  value = value +
                                                      '${element.year} ${element.make} ${element.model} (${element.type}): ${element.seats} seats; ';
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
                                const SizedBox(width: 15.0),
                                Flexible(
                                  flex: 1,
                                  child: ApplicationTextField(
                                    label: 'Vehicles used',
                                    controller: widget.vehiclesProvided,
                                    readOnly: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: widget.vehicleOwner.text == 'Third-party transportation service:',
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 15.0),
                            ApplicationTextField(
                              label: 'Transportation Service Name',
                              controller: widget.transpService,
                            ),
                          ],
                        ),
                      ),
                    ]
                  ),
                ),
                Visibility(
                  visible: widget.provVehicleForErrands.text != 'Yes',
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 20.0),
                      Text('How will you provide transportation for personal errands (e.g., grocery trips, laundry trips, etc.)?',
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
                          value: widget.errandHandling.text,
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
                              widget.errandHandling.text = newValue!;
                              if(widget.errandHandling.text != 'Other:'){
                                widget.errandExplain.text = '';
                              }
                            });
                          },
                          items: [
                            //NOTE: If you change these values, you'll need to change CountCompleted().
                            'Select',
                            'Provide workers with vehicles and let them drive themselves.',
                            'Transport workers by bus, truck, etc.',
                            'Other:',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Visibility(
                        visible: widget.errandHandling.text == 'Provide workers with vehicles and let them drive themselves.',
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 15.0),
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
                                        child: Text(
                                          'Add Vehicle',
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
                                        image: VehiclePicker(
                                          vehicleCount: widget.errandVehicles,
                                          vehicleList: errandVehicleList,
                                        ),
                                        buttons: [
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
                                                String value = '';
                                                widget.errandVehicles.text =
                                                '${errandVehicleList.length}';
                                                for (var element in errandVehicleList) {
                                                  value = value +
                                                      '${element.year} ${element.make} ${element.model} (${element.type}): ${element.seats} seats; ';
                                                }
                                                widget.errandVehiclesList.text = value;
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
                                    controller: widget.errandVehicles,
                                    readOnly: true,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: widget.errandHandling.text == 'Other:',
                          child: Column(
                            children: <Widget>[
                              const SizedBox(height: 15.0),
                              ApplicationTextField(
                                label: 'Explanation',
                                controller: widget.errandExplain,
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text('Do you have other workers who will not be using the provided housing but will need transportation?',
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
                    value: widget.otherWorkers.text,
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
                        widget.otherWorkers.text = newValue!;
                      });
                    },
                    items: [
                      'Select',
                      'Yes',
                      'No',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CheckboxListTile(
                  title: Text(
                    'I acknowledge that if, at any point in the season, I do have workers who do not use the provided housing but need transportation to the worksite, I will be required to offer free transportation to them as well.',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                  value: confirm1,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      widget.confirmOne.text = value.toString();
                      confirm1 = value!;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                Divider(color: Theme.of(context).primaryColor,thickness: 2.0,),
                const SizedBox(height: 10.0),
                CheckboxListTile(
                  title: Text(
                    'I confirm that transportation described above will be provided to workers at no cost to them.',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                  value: confirm2,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      widget.confirmTwo.text = value.toString();
                      confirm2 = value!;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                Divider(color: Theme.of(context).primaryColor,thickness: 2.0,),
                const SizedBox(height: 10.0),
                CheckboxListTile(
                  title: Text(
                    'I acknowledge that, in the H-2A Program, employers are required to reimburse workers for the expenses involved in traveling from their home country to the worksite and back again at the end of the season. Specifically, these expenses must be reimbursed within the worker\'s first pay period:' +
                    '\n\nConsulate fee: \$190' +
                    '\n\nTravel costs (e.g., flight tickets): Variable' +
                    '\n\nSubsistence Costs (e.g., food, fuel, and lodging costs): \$14 per travel day without receipts or up to \$59 per travel day with receipts' +
                    '\n\nI confirm that I will reimburse these expenses within the workers\' first pay period.',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20.0,
                    ),
                  ),
                  value: confirm3,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (value) {
                    setState(() {
                      widget.confirmThree.text = value.toString();
                      confirm3 = value!;
                    });
                  },
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
                        'Save & Continue',
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

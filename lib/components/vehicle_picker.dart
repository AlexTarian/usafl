import 'package:flutter/material.dart';
import 'application_list.dart';
import 'package:usafl/components/vehicle_list.dart';
import 'package:usafl/constants.dart';

class VehiclePicker extends StatefulWidget {
  const VehiclePicker({
    super.key,
      required this.vehicleCount,
      required this.vehicleList,
  });

  final TextEditingController vehicleCount;
  final List vehicleList;


  @override
  State<VehiclePicker> createState() => _VehiclePickerState();
}

class _VehiclePickerState extends State<VehiclePicker> {
  TextEditingController year = TextEditingController();
  TextEditingController make = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController type = TextEditingController(text: 'Vehicle Type');
  TextEditingController seats = TextEditingController();
  late int selectedIndex = widget.vehicleList.length;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width * .8,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(
              'Add a Vehicle',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Make',
                    controller: make,
                  ),
                ),
                const SizedBox(width: 15.0),
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Model',
                    controller: model,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Year',
                    controller: year,
                  ),
                ),
                const SizedBox(width: 15.0),
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Seats',
                    controller: seats,
                  ),
                ),
              ],
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
                value: type.text,
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
                    type.text = newValue!;
                  });
                },
                items: [
                  'Vehicle Type',
                  'Car',
                  'SUV',
                  'Pickup Truck',
                  'Minivan',
                  'Van',
                  'Truck',
                  'Bus',
                ]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 15.0),
            Row(
              children: [
                Visibility(
                  visible: selectedIndex != widget.vehicleList.length,
                  child: Flexible(
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
                          child: Text('New',
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
                          make.text = '';
                          model.text = '';
                          year.text = '';
                          seats.text = '';
                          type.text = 'Vehicle Type';
                          selectedIndex = widget.vehicleList.length;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Visibility(
                  visible: selectedIndex == widget.vehicleList.length,
                  child: Flexible(
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
                          child: Text('Add',
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
                          widget.vehicleList.add(ProvidedVehicle(
                            vehicleYear: year.text,
                            vehicleMake: make.text,
                            vehicleModel: model.text,
                            vehicleSeats: seats.text,
                            vehicleType: type.text,
                          ));
                          make.text = '';
                          model.text = '';
                          year.text = '';
                          seats.text = '';
                          type.text = 'Vehicle Type';
                          selectedIndex = widget.vehicleList.length;
                        });
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: selectedIndex < widget.vehicleList.length,
                  child: Flexible(
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
                          child: Text('Save',
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
                          widget.vehicleList.insert(selectedIndex,ProvidedVehicle(
                            vehicleYear: year.text,
                            vehicleMake: make.text,
                            vehicleModel: model.text,
                            vehicleSeats: seats.text,
                            vehicleType: type.text,
                          ));
                          widget.vehicleList.removeAt(selectedIndex+1);
                          selectedIndex = selectedIndex;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
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
                        child: Text('Delete',
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
                        widget.vehicleList.removeAt(selectedIndex);
                        make.text = '';
                        model.text = '';
                        year.text = '';
                        seats.text = '';
                        type.text = 'Vehicle Type';
                        selectedIndex = widget.vehicleList.length;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            SizedBox(
              height: MediaQuery.of(context).size.height * .4,
              width: double.infinity,
              child: Flex(
                direction: Axis.vertical,
                children: [Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: widget.vehicleList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                          ),
                          child: ListTile(
                            tileColor: selectedIndex == index ? usaflAccent : null,
                            minVerticalPadding: 10.0,
                            iconColor: Theme.of(context).primaryColor,
                            leading: const Icon(Icons.drive_eta_rounded),
                            title: Text('${widget.vehicleList[index].year} ${widget.vehicleList[index].make} ${widget.vehicleList[index].model}',
                              style: const TextStyle(fontSize: 20.0),),
                            trailing: Text('${widget.vehicleList[index].seats} Seats',style: const TextStyle(fontSize: 20.0),),
                            textColor: Theme.of(context).primaryColor,
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                make.text = widget.vehicleList[index].make;
                                model.text = widget.vehicleList[index].model;
                                year.text = widget.vehicleList[index].year;
                                seats.text = widget.vehicleList[index].seats;
                                type.text = widget.vehicleList[index].type;
                              });
                            },
                          ),
                        ),
                      );
                    },
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

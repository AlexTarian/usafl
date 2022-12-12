import 'package:flutter/material.dart';
import 'package:usafl/components/custom_input_formatter.dart';
import 'application_list.dart';
import 'state_selector.dart';

class HousingPicker extends StatefulWidget {
  const HousingPicker({
    super.key,
    required this.isPrime,
    required this.status,
    required this.type,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.county,
    required this.units,
    required this.beds,
    required this.bedrooms,
    required this.occupancy,
    required this.kitchen,
  });

  final bool isPrime;
  final TextEditingController status;
  final TextEditingController type;
  final TextEditingController address;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController zip;
  final TextEditingController county;
  final TextEditingController units;
  final TextEditingController beds;
  final TextEditingController bedrooms;
  final TextEditingController occupancy;
  final TextEditingController kitchen;

  @override
  State<HousingPicker> createState() => _HousingPickerState();
}

class _HousingPickerState extends State<HousingPicker> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      width: MediaQuery.of(context).size.width * .8,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Theme.of(context).primaryColor),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                value: widget.status.text,
                elevation: 16,
                style: TextStyle(fontSize: 20.0),
                underline: Container(
                  width: double.infinity,
                  height: 2,
                  color: Colors.transparent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.status.text = newValue!;
                  });
                },
                items: [
                  'Select Housing Status',
                  'Employer-owned Housing',
                  'Rental or public Housing'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 15.0),
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
                  value: widget.type.text,
                  elevation: 16,
                  style: TextStyle(fontSize: 20.0),
                  underline: Container(
                    width: double.infinity,
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.type.text = newValue!;
                    });
                  },
                  items: [
                    'What kind of housing is this?',
                    'House',
                    'Apartment',
                    'Motel',
                    'Cottage',
                    'Bungalow',
                    'Camper',
                    'Other'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
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
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Bedrooms',
                    controller: widget.bedrooms,
                    keyboard: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Total Beds',
                    controller: widget.beds,
                    keyboard: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Units',
                    controller: widget.units,
                    keyboard: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10.0),
                Flexible(
                  flex: 1,
                  child: ApplicationTextField(
                    label: 'Max Occupants',
                    controller: widget.occupancy,
                    keyboard: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Flexible(
                  flex: 3,
                  child: Text('Does this housing have a kitchen?'),
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
                      value: widget.kitchen.text,
                      elevation: 16,
                      style: TextStyle(fontSize: 20.0),
                      underline: Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.kitchen.text = newValue!;
                        });
                      },
                      items: ['Select', 'Yes', 'No']
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
          ],
        ),
      ),
    );
  }
}

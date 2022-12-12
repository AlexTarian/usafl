import 'package:flutter/material.dart';
//import 'package:usafl/components/custom_input_formatter.dart';
import 'package:usafl/components/application_list.dart';
import 'package:usafl/components/aewr_list.dart';

class ApplicationContactInfo extends StatefulWidget {
  const ApplicationContactInfo({
    super.key,
    required this.bizName,
    required this.bizNameAlt,
    required this.contactFirst,
    required this.contactMiddle,
    required this.contactLast,
    required this.contactTitle,
    required this.address1,
    required this.address2,
    required this.city,
    required this.state,
    required this.aewr,
    required this.wageRate,
    required this.zip,
    required this.phone,
    required this.ext,
    required this.email,
    required this.fein,
  });

  final TextEditingController bizName;
  final TextEditingController bizNameAlt;
  final TextEditingController contactFirst;
  final TextEditingController contactMiddle;
  final TextEditingController contactLast;
  final TextEditingController contactTitle;
  final TextEditingController address1;
  final TextEditingController address2;
  final TextEditingController city;
  final TextEditingController state;
  final TextEditingController aewr;
  final TextEditingController wageRate;
  final TextEditingController zip;
  final TextEditingController phone;
  final TextEditingController ext;
  final TextEditingController email;
  final TextEditingController fein;

  @override
  State<ApplicationContactInfo> createState() => _ApplicationContactInfoState();
}

class _ApplicationContactInfoState extends State<ApplicationContactInfo> {
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
            Text(
              'Contact Info',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 20.0),
            ),
            const SizedBox(height: 15.0),
            ApplicationTextField(
              label: 'Business Name',
              controller: widget.bizName,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Trade/DBA Name',
              controller: widget.bizNameAlt,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Contact\'s First Name',
              controller: widget.contactFirst,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Contact\'s Middle Name',
              controller: widget.contactMiddle,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Contact\'s Last Name',
              controller: widget.contactLast,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Contact\'s Job Title',
              controller: widget.contactTitle,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Address 1',
              controller: widget.address1,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'Address 2',
              controller: widget.address2,
            ),
            const SizedBox(height: 20.0),
            ApplicationTextField(
              label: 'City',
              controller: widget.city,
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
                      value: widget.state.text,
                      elevation: 16,
                      style: const TextStyle(fontSize: 20.0),
                      underline: Container(
                        width: double.infinity,
                        height: 2,
                        color: Colors.transparent,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          widget.state.text = newValue!;
                          widget.aewr.text = AewrList().stateAewrList[newValue]!;
                          widget.wageRate.text = AewrList().stateAewrList[newValue]!;
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
                      controller: widget.zip,
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
                      controller: widget.phone,
                    )),
                const SizedBox(width: 10.0),
                Flexible(
                    flex: 1,
                    child: ApplicationTextField(
                      label: 'Ext.',
                      controller: widget.ext,
                    )),
              ],
            ),
            const SizedBox(height: 30.0),
            ApplicationTextField(
              label: 'Email',
              controller: widget.email,
            ),
            const SizedBox(height: 30.0),
            ApplicationTextField(
              label: 'FEIN from IRS',
              controller: widget.fein,
            ),
            const SizedBox(height: 500.0),
          ],
        ),
      ),
    );
  }
}
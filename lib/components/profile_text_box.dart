import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usafl/constants.dart';


class ProfileTextBox extends StatefulWidget {
  ProfileTextBox({required this.controller, required this.valueKey, required this.hintText, required this.text, required this.contents});
  final TextEditingController controller;
  final String valueKey;
  final String hintText;
  final String text;
  final String contents;

  @override
  State<ProfileTextBox> createState() => _ProfileTextBoxState();
}

class _ProfileTextBoxState extends State<ProfileTextBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: widget.controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 4.0
                ),
              ),
            ),
            onChanged: (value) {
              setState(() async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString(widget.valueKey, value);
              });
            },
          ),
        ),
        TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(widget.text),
                content: Text(widget.contents),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {Navigator.of(context).pop();},
                    child: const Text("Okay",
                      style: TextStyle(
                        fontSize: 14.0,
                        color: usaflBlue,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          child: Icon(
              Icons.help,
              color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'aewr_list.dart';

class StateSelector extends StatefulWidget {
  const StateSelector({
    Key? key,
    required this.state,
    this.onPressed,
  }) : super(key: key);

  final TextEditingController state;
  final Function(String)? onPressed;

  @override
  State<StateSelector> createState() => _StateSelectorState();
}

class _StateSelectorState extends State<StateSelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      isExpanded: true,
      value: widget.state.text,
      elevation: 16,
      style: TextStyle(fontSize: 20.0, color: Theme.of(context).primaryColor),
      underline: Container(
        width: double.infinity,
        height: 2,
        color: Colors.transparent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          widget.state.text = newValue!;
        });
        widget.onPressed;
      },
      items: AewrList()
          .stateAewrList
          .keys
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

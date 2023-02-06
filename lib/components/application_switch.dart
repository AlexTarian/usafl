import 'package:flutter/material.dart';

class ApplicationSwitch extends StatefulWidget {
  const ApplicationSwitch(
      {super.key,
        required this.label,
        required this.toggle,
        required this.onChanged});

  final String label;
  final bool toggle;
  final Function(bool) onChanged;

  @override
  State<ApplicationSwitch> createState() => _ApplicationSwitchState();
}

class _ApplicationSwitchState extends State<ApplicationSwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(widget.label,
          style:
          TextStyle(color: Theme.of(context).primaryColor, fontSize: 20)),
      value: widget.toggle,
      activeColor: Theme.of(context).primaryColor,
      onChanged: widget.onChanged,
    );
  }
}
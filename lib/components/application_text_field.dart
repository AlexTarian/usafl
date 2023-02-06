import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ApplicationTextField extends StatelessWidget {
  const ApplicationTextField(
      {super.key,
        required this.label,
        this.controller,
        this.initial,
        this.keyboard = TextInputType.text,
        this.readOnly = false,
        this.onTap,
        this.onChanged,
        this.format,
        this.expands = false});

  final String label;
  final TextEditingController? controller;
  final String? initial;
  final TextInputType keyboard;
  final bool readOnly;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final List<TextInputFormatter>? format;
  final bool expands;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      expands: expands,
      maxLines: expands ? null : 1,
      controller: controller,
      initialValue: initial,
      readOnly: readOnly,
      keyboardType: keyboard,
      onChanged: onChanged,
      textAlignVertical: TextAlignVertical.top,
      style: const TextStyle(fontSize: 20.0),
      decoration: InputDecoration(
        labelText: label,
        labelStyle:
        TextStyle(color: Theme.of(context).primaryColor, fontSize: 20.0),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      inputFormatters: format,
      onTap: () {
        onTap;
      },
    );
  }
}
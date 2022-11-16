import 'package:flutter/services.dart';

class CustomMaxValueIntFormatter extends TextInputFormatter {
  final int maxInputValue;

  CustomMaxValueIntFormatter({required this.maxInputValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (maxInputValue != null) {
      final int value = int.parse(newValue.text);
      if (value == null) {
      return TextEditingValue(
        text: truncated,
        selection: newSelection,
      );
    }
    if (value > maxInputValue) {
      truncated = maxInputValue.toString();
    }
  }

  return TextEditingValue(
    text: truncated,
    selection: newSelection,
  );
}
}

class CustomMinValueIntFormatter extends TextInputFormatter {
  final int minInputValue;

  CustomMinValueIntFormatter({required this.minInputValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (minInputValue != null) {
      final int value = int.parse(newValue.text);
      if (value == null) {
        return TextEditingValue(
          text: truncated,
          selection: newSelection,
        );
      }
      if (value < minInputValue) {
        truncated = minInputValue.toString();
      }
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}

class CustomMaxValueDoubleFormatter extends TextInputFormatter {
  final int maxInputValue;

  CustomMaxValueDoubleFormatter({required this.maxInputValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (maxInputValue != null) {
      final double value = double.parse(newValue.text);
      if (value == null) {
        return TextEditingValue(
          text: truncated,
          selection: newSelection,
        );
      }
      if (value > maxInputValue) {
        truncated = maxInputValue.toString();
      }
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}

class CustomMinValueDoubleFormatter extends TextInputFormatter {
  final double minInputValue;

  CustomMinValueDoubleFormatter({required this.minInputValue});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (minInputValue != null) {
      final double value = double.parse(newValue.text);
      if (value == null) {
        return TextEditingValue(
          text: truncated,
          selection: newSelection,
        );
      }
      if (value < minInputValue) {
        truncated = minInputValue.toString();
      }
    }

    return TextEditingValue(
      text: truncated,
      selection: newSelection,
    );
  }
}
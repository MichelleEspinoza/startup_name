import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  const TextBox(this._controller, this._label, {super.key});

  String? get _errorText {
    final text = _controller.value.text;
    if (text.isEmpty &&
        _label != 'Email' &&
        _label != 'Country' &&
        _label != 'Street') {
      return '$_label es requerido';
    }
    RegExp rfc = RegExp(
        r'^([A-ZÑ&]{3,4}) ?(?:- ?)?(\d{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[12]\d|3[01])) ?(?:- ?)?([A-Z\d]{2})([A\d])$');
    RegExp email = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    RegExp phone =
        RegExp(r'^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$');
    if (text.isNotEmpty && _label == 'Rfc' && !rfc.hasMatch(text)) {
      return '$_label No valido';
    }
    if (text.isNotEmpty && _label == 'CP' && text.length != 5) {
      return '$_label No valido';
    }
    if (text.isNotEmpty && _label == 'Email' && !email.hasMatch(text)) {
      return '$_label No valido';
    }
    if (text.isNotEmpty && _label == 'Phone' && !phone.hasMatch(text)) {
      return '$_label No valido';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      // Note: pass _controller to the animation argument
      valueListenable: _controller,
      builder: (context, TextEditingValue value, __) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                filled: true,
                labelText: _label,
                errorText: _errorText,
                suffix: GestureDetector(
                  child: const Icon(Icons.close),
                  onTap: () {
                    _controller.clear();
                  },
                )),
          ),
        );
      },
    );
  }
}

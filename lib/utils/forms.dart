import 'package:flutter/material.dart';
import 'package:cashflow/core/colors.dart';

class Forms extends StatefulWidget {
  // VARIABLES CLASS
  final TextEditingController controller;
  final bool password;
  final TextInputType text;

  // CONSTRUCTOR
  const Forms({
    Key? key,
    required this.controller,
    this.password = false,
    required this.text,
  }) : super(key: key);

  @override
  State<Forms> createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          contentPadding: const EdgeInsets.all(10),
          isDense: true,
          fillColor: input,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: border)),
          filled: true),
      autofocus: true,
      keyboardType: widget.text,
      obscureText: widget.password,
      style: const TextStyle(fontSize: 14.4),
      textAlign: TextAlign.left,
    );
  }
}

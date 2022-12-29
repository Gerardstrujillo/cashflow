import 'package:flutter/material.dart';
import 'package:cashflow/core/colors.dart';

class Search extends StatefulWidget {
  // VARIABLES CLASS
  final TextEditingController controller;
  final bool password;
  final TextInputType text;

  // CONSTRUCTOR
  const Search({
    Key? key,
    required this.controller,
    this.password = false,
    required this.text,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.all(10),
        isDense: true,
        fillColor: input,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: border)),
        filled: true,
        hintText: 'Buscar listas',
      ),
      autofocus: true,
      keyboardType: widget.text,
      obscureText: widget.password,
      style: const TextStyle(fontSize: 13.5),
    );
  }
}

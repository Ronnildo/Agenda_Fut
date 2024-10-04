import 'package:flutter/material.dart';

class DataForm {
  String hintText;
  String labelText;
  TextEditingController controller;
  IconData icon;
  bool obscureText;

  DataForm({
    required this.hintText,
    required this.labelText,
    required this.controller,
    required this.icon,
    required this.obscureText,
  });

  Map<String, dynamic> toMap() {
    return {
      "hinttext": hintText,
      "labelText": labelText,
      "controller": controller,
      "icon": icon,
      "obscureText": obscureText,
    };
  }
}

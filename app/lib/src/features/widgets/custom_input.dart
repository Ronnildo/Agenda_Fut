import "package:flutter/material.dart";

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String labeltext;
  final IconData icon;
  const CustomInput({
    super.key,
    required this.labeltext,
    required this.controller,
    required this.icon,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration:  InputDecoration(
        labelText: widget.labeltext,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          
        ),
        suffixIcon: Icon(widget.icon),
        border: const OutlineInputBorder(

        ),
      ),
    );
  }
}

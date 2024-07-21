import "package:flutter/material.dart";

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String labeltext;
  final IconData icon;
  final bool obscureText;
  const CustomInput({
    super.key,
    required this.labeltext,
    required this.controller,
    required this.icon,
    required this.obscureText,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16,),
      child: TextField(
        controller: widget.controller,
        autofocus: true,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xFFFEFEFE),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          labelText: widget.labeltext,
          labelStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
          floatingLabelStyle: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          suffixIcon: Icon(widget.icon),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          focusColor: Colors.white,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF03045E)),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButtom extends StatefulWidget {
  final void Function() onTap;
  final String title;
  const CustomButtom({
    super.key,
    required this.onTap,
    required this.title,
  });

  @override
  State<CustomButtom> createState() => _CustomButtomState();
}

class _CustomButtomState extends State<CustomButtom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF03045E),
        fixedSize: Size(
          MediaQuery.of(context).size.width,
          50,
        ),
      ),
      child:  Text(
        widget.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}

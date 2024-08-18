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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: widget.onTap,
        child: Text(
          widget.title,
        ),
      ),
    );
  }
}

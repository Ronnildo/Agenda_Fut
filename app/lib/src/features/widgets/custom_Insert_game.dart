// ignore: file_names
import 'package:flutter/material.dart';

class CustomInsertGame extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  const CustomInsertGame({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
  });

  @override
  State<CustomInsertGame> createState() => _CustomInsertGameState();
}

class _CustomInsertGameState extends State<CustomInsertGame> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TextField(
            controller: widget.controller,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFEFEFE),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              floatingLabelStyle: Theme.of(context).textTheme.labelSmall,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1.5,
                ),
              ),
              focusColor: Colors.white,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF03045E),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

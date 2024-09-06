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
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 10,
        left: 16,
        right: 16,
      ),
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
              fillColor:  Colors.white,
              contentPadding: const EdgeInsets.all(16),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              floatingLabelStyle: Theme.of(context).textTheme.labelSmall,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF03045E),
                  width: 100,
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

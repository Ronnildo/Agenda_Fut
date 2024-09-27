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
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextField(
            controller: widget.controller,
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor:  Colors.white,
              contentPadding: const EdgeInsets.all(20),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              labelStyle: Theme.of(context).textTheme.labelMedium,
              floatingLabelStyle: Theme.of(context).textTheme.titleLarge,
              hoverColor: Theme.of(context).colorScheme.primary,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              border:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                ),
              ),
              focusColor: Colors.white,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

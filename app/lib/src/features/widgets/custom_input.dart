import "package:app/src/features/controllers/game_provider.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final IconData icon;
  final bool obscureText;
  final String error;
  const CustomInput({
    super.key,
    required this.hintText,
    required this.label,
    required this.controller,
    required this.icon,
    required this.obscureText,
    required this.error,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextField(
            controller: widget.controller,
            autofocus: true,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFEFEFE),
              contentPadding: const EdgeInsets.all(20),
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.labelSmall,
              floatingLabelStyle: Theme.of(context).textTheme.labelMedium,
              suffixIcon: Icon(widget.icon),
              errorBorder: Provider.of<GameProvider>(context).error != ""
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 4,
                      ),
                    )
                  : null,
              // errorStyle: const TextStyle(fontSize: 14, color: Colors.green),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 4,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              focusColor: Colors.green,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import "package:flutter/material.dart";

class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;
  final IconData icon;
  final bool obscureText;
  const CustomInput({
    super.key,
    required this.hintText,
    required this.label,
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
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextField(
            controller: widget.controller,
            autofocus: true,
            obscureText: widget.obscureText,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFFEFEFE),
              enabledBorder:
                  const OutlineInputBorder(borderSide: BorderSide.none),
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
              floatingLabelStyle: Theme.of(context).textTheme.bodySmall,
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
        ],
      ),
    );
  }
}

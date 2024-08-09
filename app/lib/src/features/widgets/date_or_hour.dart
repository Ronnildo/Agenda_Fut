import 'package:flutter/material.dart';

class DateOrHour extends StatefulWidget {
  final TextEditingController controller;
  final String dayOrHour;
  final String hintText;
  final void Function() onTap;
  const DateOrHour({
    super.key,
    required this.controller,
    required this.dayOrHour,
    required this.hintText,
    required this.onTap,
  });

  @override
  State<DateOrHour> createState() => _DateOrHourState();
}

class _DateOrHourState extends State<DateOrHour> {
  @override
  Widget build(BuildContext context) {
    // print(widget.controller.text);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.dayOrHour),
        SizedBox(
          height: 56,
          width: 170,
          child: TextField(
            controller: widget.controller,
            keyboardType: TextInputType.datetime,
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
              suffixIcon: InkWell(
                onTap: widget.onTap,
                child: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class DropDownPriority extends StatefulWidget {
  final TextEditingController controller;
  const DropDownPriority({super.key, required this.controller});

  @override
  State<DropDownPriority> createState() => _DropDownPriorityState();
}

class _DropDownPriorityState extends State<DropDownPriority> {
  final TextEditingController _priority = TextEditingController();
  final List<String> _typeUsers = ["Fase de Grupos", "Oitavas", "Quartas", "Semifinal", "Final", "Outro"];
  String dropDownValue = "";
  @override
  void initState() {
    super.initState();
    dropDownValue = _typeUsers.first;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fase",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          DropdownMenu(
              controller: widget.controller,
              initialSelection: dropDownValue,
              width: MediaQuery.of(context).size.width - 32,
              inputDecorationTheme: const InputDecorationTheme(
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                filled: true,
              ),
              textStyle: Theme.of(context).textTheme.labelSmall,
              menuStyle: const MenuStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              dropdownMenuEntries: _typeUsers.map<DropdownMenuEntry<String>>(
                (String value) {
                  return DropdownMenuEntry(
                    value: value,
                    label: value,
                  );
                },
              ).toList(),
              onSelected: (String? value) {
                setState(() {
                  dropDownValue = value!;
                });
                setState(() {
                  widget.controller.text = dropDownValue; 
                });
              }),
        ],
      ),
    );
  }
}

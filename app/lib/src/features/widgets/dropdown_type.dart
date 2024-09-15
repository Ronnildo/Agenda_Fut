import 'package:flutter/material.dart';

class DropDownTypeUser extends StatefulWidget {
  const DropDownTypeUser({super.key});

  @override
  State<DropDownTypeUser> createState() => _DropDownTypeUserState();
}

class _DropDownTypeUserState extends State<DropDownTypeUser> {
  final TextEditingController _typeController = TextEditingController();
  final List<String> _typeUsers = ["Atleta", "Treinador", "Organizador"];
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
            "Tipo de Usuário",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          DropdownMenu(
              controller: _typeController,
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
              }),
        ],
      ),
    );
  }
}

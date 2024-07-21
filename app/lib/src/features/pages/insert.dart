import 'package:app/src/features/widgets/custom_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController _competitionController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _inforsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late TextEditingController _timeController = TextEditingController();


  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  TextDirection textDirection = TextDirection.ltr;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24Hours = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDDDD1),
      appBar: AppBar(
        title: const Text("Inserir Jogo"),
        backgroundColor: const Color(0xFFDDDDD1),
      ),
      body: Column(
        children: [
          Placeholder(
            fallbackHeight: 92,
            fallbackWidth: 85,
            color: Colors.grey,
            child: Container(),
          ),
          const Text("Foto da Equipe"),
          CustomInput(
              labeltext: "Nome da Competição",
              controller: _competitionController,
              icon: Icons.abc,
              obscureText: false),
          CustomInput(
              labeltext: "Nome da Equipe",
              controller: _competitionController,
              icon: Icons.abc,
              obscureText: false),
          CustomInput(
              labeltext: "Local da Competição",
              controller: _competitionController,
              icon: Icons.abc,
              obscureText: false),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 56,
                  width: 170,
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFEFEFE),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: "00/00/2000",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.keyboard_arrow_down_rounded)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 56,
                  width: 170,
                  child: TextField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFFFEFEFE),
                      enabledBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                      labelText: "00:00 AM",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                      suffixIcon: InkWell(
                          onTap: () async {
                            final TimeOfDay? time = await showTimePicker(
                              context: context,
                              initialTime: selectedTime ?? TimeOfDay.now(),
                              initialEntryMode: entryMode,
                              orientation: orientation,
                              builder: (context, Widget? child) {
                                return Directionality(
                                  textDirection: textDirection,
                                  child: MediaQuery(
                                    data: MediaQuery.of(context).copyWith(
                                      alwaysUse24HourFormat: use24Hours,
                                    ),
                                    child: child!,
                                  ),
                                );
                              },
                            );
                            setState(() {
                              selectedTime = time;
                            });
                            if(selectedTime != null){
                              String hour = selectedTime.toString(); 
                              _timeController.text = hour;
                            }
                          },
                          child: const Icon(Icons.keyboard_arrow_down_rounded)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

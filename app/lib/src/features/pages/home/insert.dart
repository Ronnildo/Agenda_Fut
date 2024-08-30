import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/custom_Insert_game.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/date_or_hour.dart';
import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:intl/intl.dart' as Date;

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController _competitionController = TextEditingController();
  final TextEditingController _teamController = TextEditingController();
  final TextEditingController _advControlelr = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _inforsController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24Hours = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          "Inserir Jogo",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 20,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ContainerImage(
                onTap: () {},
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Text(
                  "Escudo da Equipe ou Banner do Jogo/Competição",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            CustomInsertGame(
              controller: _competitionController,
              label: "Nome da Competição",
              hintText: "Ex: Copa América",
            ),
            CustomInsertGame(
              controller: _teamController,
              label: "Casa",
              hintText: "Ex: Juventus",
            ),
            CustomInsertGame(
              controller: _advControlelr,
              label: "Fora",
              hintText: "Ex: Boca Juniros",
            ),
            CustomInsertGame(
              controller: _locationController,
              label: "Local da Competição",
              hintText: "Ex: Arena Bets",
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DateOrHour(
                    controller: _dateController,
                    dayOrHour: "Data",
                    hintText: "Ex: 20/06/2024",
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(2024), lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        print(
                            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = Date.DateFormat('dd/MM/yyyy').format(
                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(
                            formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        setState(() {
                          _dateController.text =
                              formattedDate; //set foratted date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                  DateOrHour(
                    controller: _timeController,
                    dayOrHour: "Horário",
                    hintText: "Ex: 15:30 PM",
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: selectedTime ?? TimeOfDay.now(),
                        initialEntryMode: entryMode,
                        orientation: orientation,
                        builder: (context, Widget? child) {
                          return Directionality(
                            textDirection: TextDirection.ltr,
                            child: MediaQuery(
                              data: MediaQuery.of(context).copyWith(
                                alwaysUse24HourFormat: use24Hours,
                              ),
                              child: child!,
                            ),
                          );
                        },
                      );
                      if (selectedTime != null) {
                        String hour = selectedTime.toString();
                        _timeController.text = hour;
                      }
                      setState(() {
                        selectedTime = time;

                        _timeController.text =
                            "${time!.hour.toString()}:${time.minute.toString()}";
                      });
                    },
                  ),
                ],
              ),
            ),
            CustomButtom(
              onTap: () {
                Navigator.pop(context);
              },
              title: "Adicionar",
            )
          ],
        ),
      ),
    );
  }
}

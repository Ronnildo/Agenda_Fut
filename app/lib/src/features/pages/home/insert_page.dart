import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/custom_Insert_game.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/date_or_hour.dart';
import 'package:app/src/features/widgets/dropdown_type.dart';
import 'package:app/src/models/game_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// ignore: library_prefixes
import 'package:intl/intl.dart' as Data;
import 'package:provider/provider.dart';

class InsertPage extends StatefulWidget {
  const InsertPage({super.key});

  @override
  State<InsertPage> createState() => _InsertPageState();
}

class _InsertPageState extends State<InsertPage> {
  final TextEditingController _competitionController =
      TextEditingController(text: "Barrense");
  final TextEditingController _homeController =
      TextEditingController(text: "Cobras");
  final TextEditingController _awayControlelr =
      TextEditingController(text: "Golden");
  final TextEditingController _localeController =
      TextEditingController(text: "Ginasio o Duty");
  final TextEditingController _faseController =
      TextEditingController(text: "Barrense");
  final TextEditingController _dateController =
      TextEditingController(text: "20/09/2024:");
  final TextEditingController _timeController = TextEditingController();

  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24Hours = false;
  DateTime? _pickedDate;

  @override
  Widget build(BuildContext context) {
    print(_faseController.text);
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
            const Center(
              child: ContainerImage(),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  top: 5,
                ),
                child: Text(
                  "Banner do Jogo/Competição",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
            CustomInsertGame(
              controller: _competitionController,
              label: "Nome da Competição",
              hintText: "Ex: Copa América",
            ),
            CustomInsertGame(
              controller: _homeController,
              label: "Casa",
              hintText: "Ex: Juventus",
            ),
            CustomInsertGame(
              controller: _awayControlelr,
              label: "Fora",
              hintText: "Ex: Boca Juniros",
            ),
            CustomInsertGame(
              controller: _localeController,
              label: "Local da Competição",
              hintText: "Ex: Arena Bets",
            ),
            DropDownPriority(
              controller: _faseController,
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
                      _pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate: DateTime(2024), lastDate: DateTime(2101),
                      );
                      // setState(() {
                      //   DateTime formatDate = DateTime.parse(_dateController.text);
                      //   print(formatDate);

                      // });
                      if (_pickedDate != null) {
                        print(
                            _pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = Data.DateFormat('dd/MM/yyyy').format(
                            _pickedDate!); // format date in required form here we use yyyy-MM-dd that means time is removed
                        // print(
                        //     formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        setState(() {
                          _dateController.text =
                              formattedDate; //set foratted date to TextField value.
                        });
                      } else {
                        // print("Date is not selected");
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
                      print(time!);
                      setState(() {
                        selectedTime = time;

                        _timeController.text =
                            "${time.hour}:${time.minute > 10 ? time.minute : "0${time.minute}"}";
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CustomButtom(
                onTap: insertGame,
                title: "Adicionar",
              ),
            ),
            // Consumer<GameProvider>(
            //   builder: (context, value, child) {
            //     if (value.isLoading) {
            //       return Text(value.error);
            //     }
            //     clear();
            //     return Text(value.status);
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  insertGame() {
    String name = _competitionController.text;
    String home = _homeController.text;
    String away = _awayControlelr.text;
    String locale = _localeController.text;
    String fase = _faseController.text;
    DateTime date = Data.DateFormat("dd/MM/yyyy hh:mm")
        .parse("${_dateController.text} ${_timeController.text}");

    Provider.of<GameProvider>(context, listen: false).addGame(
      GameModel(
        nameCompetition: name,
        home: home,
        away: away,
        locale: locale,
        fase: fase,
        date: date,
      ),
    );
  }

  clear() {
    _competitionController.clear();
    _homeController.clear();
    _awayControlelr.clear();
    _localeController.clear();
    _faseController.clear();
    _dateController.clear();
  }
}

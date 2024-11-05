// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/pages/home/widgets/custom_insert_game.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/pages/home/widgets/date_or_hour.dart';
import 'package:app/src/features/pages/home/widgets/dropdown_type.dart';
import 'package:app/src/features/pages/home/widgets/upload_image.dart';
import 'package:app/src/features/widgets/snackbar_auth.dart';
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
  final TextEditingController _competitionController = TextEditingController();
  final TextEditingController _homeController = TextEditingController();
  final TextEditingController _awayControlelr = TextEditingController();
  final TextEditingController _localeController = TextEditingController();
  final TextEditingController _faseController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24Hours = false;
  DateTime? _pickedDate;
  late XFile? _file = XFile("");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Inserir Jogo",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 20,
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: UploadImageContainer(
                filePath: _file!.path == "" ? "" : _file!.path,
                uploadImage: uploadImage,
                text: "Banner do Jogo/Arte",
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

                      if (_pickedDate != null) {
                        //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = Data.DateFormat('dd/MM/yyyy').format(
                            _pickedDate!); // format date in required form here we use yyyy-MM-dd that means time is removed

                        setState(() {
                          _dateController.text =
                              formattedDate; //set foratted date to TextField value.
                        });
                      } else {
                        setState(() {
                          String formattedDate = Data.DateFormat('dd/MM/yyyy')
                              .format(DateTime.now());
                          _dateController.text = formattedDate;
                        });
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
                      } else {
                        String hour = TimeOfDay.now().hour.toString();
                        String minute = TimeOfDay.now().minute.toString();
                        _timeController.text = "$hour:$minute";
                      }

                      setState(() {
                        selectedTime = time!;
                        if (time.minute < 10) {
                          _timeController.text = "${time.hour}:0${time.minute}";
                        } else if (time.minute == 0 && time.hour != 0) {
                          _timeController.text = "${time.hour}:${time.minute}0";
                        } else if (time.hour == 0 && time.minute == 0) {
                          _timeController.text =
                              "0${time.hour}:${time.minute}0";
                        } else {
                          _timeController.text = "${time.hour}:${time.minute}";
                        }
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
          ],
        ),
      ),
    );
  }

  Future<void> uploadImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _file = file;
      });
    }
  }

  Future insertGame() async {
    File file = File(_file!.path);

    if (_competitionController.text != "" &&
        _homeController.text != "" &&
        _dateController.text != "" &&
        _timeController.text != "") {
      DateTime date = Data.DateFormat("dd/MM/yyyy hh:mm")
          .parse("${_dateController.text} ${_timeController.text}");
      GameModel data = GameModel(
        nameCompetition: _competitionController.text,
        home: _homeController.text,
        away: _awayControlelr.text,
        locale: _localeController.text,
        fase: _faseController.text,
        date: date,
      );
      await Provider.of<GameProvider>(context, listen: false)
          .addGame(file, date.toString(), data);
      CustomSnackBar(context: context).show(
        await Provider.of<GameProvider>(context, listen: false).status,
      );
      clear();
    } else {
      CustomSnackBar(context: context).showError(
          "Aconteceu um erro ao adicionar partida. Tente Novamente.");
    }
  }

  clear() {
    _competitionController.clear();
    _homeController.clear();
    _awayControlelr.clear();
    _localeController.clear();
    _faseController.text = "Fase de Grupos";
    _dateController.clear();
    _timeController.clear();
    setState(() {
      _file = XFile("");
    });
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/pages/details/widgets/consumer_image_game.dart';
import 'package:app/src/features/pages/home/widgets/banner_ad.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:app/src/features/pages/home/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  final String nameCompetition;
  final String fase;
  final DateTime date;
  const DetailsPage({
    super.key,
    required this.id,
    required this.nameCompetition,
    required this.fase,
    required this.date,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final TextEditingController _homeController = TextEditingController();
  final TextEditingController _awayController = TextEditingController();
  final TextEditingController _localeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  XFile _file = XFile("");

  bool _editDetails = false;

  @override
  void initState() {
    Provider.of<GameProvider>(context, listen: false)
        .getImage(widget.nameCompetition, widget.date.toString());
    Provider.of<GameProvider>(context, listen: false).setId(widget.id);
    Provider.of<GameProvider>(context, listen: false)
        .getMatcheDetails(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        leadingWidth: 22,
        title: Text(
          "Detalhes da Partida",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<GameProvider>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Consumer<GameProvider>(
                  builder: (context, value, child) {
                    // print(value.fileUp);
                    if (!value.isLoading && value.fileUp != "") {
                      return Center(
                        child: ConsumerImageGame(
                          pathImage: value.fileUp,
                          uploadImage: uploadImage,
                        ),
                      );
                    }
                    return Center(
                      child: UploadImageContainer(
                        filePath: _file.path,
                        uploadImage: uploadImage,
                        text: "Banner do Jogo/Arte",
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10,
                  ),
                  child: Text(
                    "Descrição da Partida:",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                ListInforDetails(
                  controller: _homeController,
                  title: "Casa",
                  subTitle: value.home,
                  edit: _editDetails,
                  icon: Icons.shield,
                  onTap: updateDetails,
                ),
                ListInforDetails(
                  controller: _awayController,
                  title: "Fora",
                  subTitle: value.away,
                  icon: Icons.shield,
                  edit: _editDetails,
                  onTap: updateDetails,
                ),
                ListInforDetails(
                  controller: _localeController,
                  title: "Local",
                  subTitle: value.locale,
                  icon: Icons.location_on,
                  edit: _editDetails,
                  onTap: updateDetails,
                ),
                ListInforDetails(
                  controller: _dateController,
                  title: "Data",
                  subTitle: DateFormat("dd/MM/yyyy").format(
                    value.date!,
                  ),
                  icon: Icons.event,
                  edit: _editDetails,
                  onTap: updateDetails,
                ),
                ListInforDetails(
                  controller: _timeController,
                  title: "Horário",
                  subTitle: DateFormat("HH:mm").format(
                    value.date,
                  ),
                  icon: Icons.schedule,
                  edit: _editDetails,
                  onTap: updateDetails,
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: CustomButtom(onTap: save, title: "Salvar Alterações"),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: const BannerAdMob(
        adUnitId: "ca-app-pub-3101866454473029/4032911718",
      ),
    );
  }

  Future<void> uploadImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _file = file;
        Provider.of<GameProvider>(context, listen: false).updateImageGame(
            widget.nameCompetition, widget.date.toString(), _file.path);
      });
    }
  }

  Future<void> updateDetails() async {
    if (!_editDetails) {
      setState(() {
        _editDetails = true;
        _homeController.text =
            Provider.of<GameProvider>(context, listen: false).home;
        _awayController.text =
            Provider.of<GameProvider>(context, listen: false).away;
        _localeController.text =
            Provider.of<GameProvider>(context, listen: false).locale;
        _dateController.text = DateFormat("dd/MM/yyyy")
            .format(Provider.of<GameProvider>(context, listen: false).date);
        _timeController.text = DateFormat("HH:mm")
            .format(Provider.of<GameProvider>(context, listen: false).date);
      });
    }
  }

  Future<void> save() async {
    setState(() {
      _editDetails = false;
    });

    if (_homeController.text ==
            Provider.of<GameProvider>(context, listen: false).home &&
        _awayController.text ==
            Provider.of<GameProvider>(context, listen: false).away &&
        _localeController.text ==
            Provider.of<GameProvider>(context, listen: false).locale &&
        _dateController.text ==
            DateFormat("dd/MM/yyyy").format(
                Provider.of<GameProvider>(context, listen: false).date) &&
        _timeController.text ==
            DateFormat("HH:mm").format(
                Provider.of<GameProvider>(context, listen: false).date)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.error,
          content: const Text("Nada alterado para ser salvo."),
        ),
      );
    } else {
      if (_homeController.text !=
                  Provider.of<GameProvider>(context, listen: false).home &&
              _awayController.text !=
                  Provider.of<GameProvider>(context, listen: false).away &&
              _localeController.text ==
                  Provider.of<GameProvider>(context, listen: false).locale ||
          _dateController.text ==
              DateFormat("dd/MM/yyyy").format(
                  Provider.of<GameProvider>(context, listen: false).date) ||
          _timeController.text ==
              DateFormat("HH:mm").format(
                Provider.of<GameProvider>(context, listen: false).date,
              )) {
        DateTime dateConvert = DateFormat("dd/MM/yyyy hh:mm")
            .parse("${_dateController.text} ${_timeController.text}");
        await Provider.of<GameProvider>(context, listen: false).updateMatchGame(
          widget.id,
          widget.nameCompetition,
          _homeController.text,
          _awayController.text,
          _localeController.text,
          widget.fase,
          dateConvert,
        );
        Provider.of<GameProvider>(context, listen: false)
            .getMatcheDetails(widget.id);
      }
    }
  }
}

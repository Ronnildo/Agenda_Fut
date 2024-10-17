import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/pages/details/widgets/consumer_image_game.dart';
import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:app/src/features/widgets/mini_card_game.dart';
import 'package:app/src/features/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  final String nameCompetition;
  final String home;
  final String away;
  final DateTime date;
  final String locale;
  const DetailsPage({
    super.key,
    required this.nameCompetition,
    required this.home,
    required this.away,
    required this.date,
    required this.locale,
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
  @override
  void initState() {
    _file.path != "" ? Provider.of<GameProvider>(context, listen: false)
        .getImage(widget.nameCompetition, widget.date.toString()) : null;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Consumer<GameProvider>(builder: (context, value, child) {
              if (!value.isLoading && value.fileUp != "") {
                return Center(
                  child: ConsumerImageGame(
                    pathImage: value.fileUp,
                    uploadImage: uploadImage,
                  ),
                );
              }
              return _file.path == ""
                  ? Center(
                      child: ContainerImage(
                        path: value.fileUp,
                        uploadImage: uploadImage,
                      ),
                    )
                  : Center(
                      child: UploadImageContainer(
                        filePath: _file.path,
                        uploadImage: uploadImage,
                      ),
                    );
            }),
            Center(
              child: Text(
                "Escudo da Equipe ou Banner do jogo",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
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
              subTitle: widget.home,
              edit: false,
              icon: Icons.shield,
              onTap: () {},
            ),
            ListInforDetails(
              controller: _awayController,
              title: "Fora",
              subTitle: widget.away,
              icon: Icons.shield,
              edit: false,
              onTap: () {},
            ),
            ListInforDetails(
              controller: _localeController,
              title: "Local",
              subTitle: widget.locale,
              icon: Icons.location_on,
              edit: false,
              onTap: () {},
            ),
            ListInforDetails(
              controller: _dateController,
              title: "Data",
              subTitle: DateFormat("dd/MM/yyyy").format(widget.date),
              icon: Icons.event,
              edit: false,
              onTap: () {},
            ),
            ListInforDetails(
              controller: _timeController,
              title: "Horário",
              subTitle: DateFormat("HH:mm").format(widget.date),
              icon: Icons.schedule,
              edit: false,
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Divider(
                thickness: 1,
                height: 8,
                color: Colors.grey.withOpacity(0.4),
              ),
            ),
            ListTile(
              title: Text(
                "Outras Jogos",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              // Criar função de ocultar
              trailing: const Icon(
                Icons.arrow_drop_down,
                size: 30,
                color: Colors.black,
              ),
            ),
            MiniCardGame(
                colorBar: Colors.red,
                teamName: "Atlético",
                advTeamName: "Real FC",
                localeName: "Ginásio Poliesportivo",
                date: DateTime(2024, 10, 21),
                onTap: () {}),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: CustomButtom(onTap: save, title: "Salvar Alterações"),
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

  Future<void> save() async {
    Provider.of<GameProvider>(context, listen: false)
        .updateImageGame(widget.nameCompetition, widget.date.toString(),_file.path);
  }
}

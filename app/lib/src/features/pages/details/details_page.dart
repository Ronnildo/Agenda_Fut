import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:app/src/features/widgets/mini_card_game.dart';
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
  XFile? file;
  @override
  void initState() {
    Provider.of<GameProvider>(context, listen: false)
        .getImage(widget.nameCompetition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(Provider.of<GameProvider>(context).getGame(widget.title));
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
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<GameProvider>(
              builder: (context, value, child) {
                if (!value.isLoading && value.status != "failed") {
                  Center(
                    child: ContainerImage(
                      path: value.fileUp,
                      uploadImage: () {},
                    ),
                  );
                }
                return Center(
                  child: ContainerImage(
                    path: "",
                    uploadImage: () {},
                  ),
                );
              },
            ),
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
              title: "Equipe",
              subTitle: widget.home,
              icon: Icons.shield,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Adversário",
              subTitle: widget.away,
              icon: Icons.shield,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Local",
              subTitle: widget.locale,
              icon: Icons.location_on,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Data",
              subTitle: DateFormat("dd/MM/yyyy").format(widget.date),
              icon: Icons.event,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Horário",
              subTitle: DateFormat("HH:mm").format(widget.date),
              icon: Icons.schedule,
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
              child: CustomButtom(onTap: () {}, title: "Salvar Alterações"),
            ),
          ],
        ),
      ),
    );
  }
}

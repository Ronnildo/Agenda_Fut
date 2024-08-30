import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:app/src/features/widgets/mini_card_game.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
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
            Center(
              child: ContainerImage(
                onTap: () {},
              ),
            ),
            Center(
              child: Text(
                "Escudo da Equipe ou Banner do jogo",
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 10,
              ),
              child: Text(
                "Descrição:",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            ListInforDetails(
              title: "Equipe",
              subTitle: "Atlético",
              icon: Icons.shield,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Adversário",
              subTitle: "Boca Juniors",
              icon: Icons.shield,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Local",
              subTitle: "Arena Tony",
              icon: Icons.location_on,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Data",
              subTitle: "20/06/2024",
              icon: Icons.event,
              onTap: () {},
            ),
            ListInforDetails(
              title: "Horário",
              subTitle: "16:30 AM",
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
                style: Theme.of(context).textTheme.bodyLarge,
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


import 'package:app/src/features/pages/details/details_page.dart';
import 'package:app/src/features/pages/home/insert_page.dart';
import 'package:app/src/features/pages/auth/perfil_page.dart';
import 'package:app/src/features/widgets/calendar_scroll.dart';
import 'package:app/src/features/widgets/custom_card_game.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import '../../widgets/new_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final EasyInfiniteDateTimelineController _easyInfiniteDateTimelineController =
      EasyInfiniteDateTimelineController();
  String pathImage = "";
// Procurar API de Calendário
  DateTime _focusDate = DateTime.now();

  detalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailsPage(),
      ),
    );
  }

  DateTime selectDate = DateTime.now();

  focusChange(DateTime selectDate) {
    setState(() {
      _focusDate = selectDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(DateTime.now());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        // Implementar lógica de troca por foto
        title: Text(
          "Atleta",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 20,
        automaticallyImplyLeading: false,
        actions: [     
          pathImage.isEmpty
              ? InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PerfilPage(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.account_circle,
                    size: 50,
                  ),
                )
              : Image(
                  image: AssetImage(pathImage),
                  width: 50,
                  height: 50,
                ),
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ScrollCalendar(
                timelineController: _easyInfiniteDateTimelineController,
                focusDate: _focusDate,
                focusChange: () => focusChange(selectDate),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.blue,
                ),
              ),
              CustomCardGame(
                colorBar: Colors.red,
                competitionName: "Campeonato Barrense 2024",
                teamName: "Atlético Madruga",
                advTeamName: "Mangabeira FC",
                localeName: "Ginásio Poliesportivo o Duty",
                date: DateTime.now(),
                onTap: detalhes,
                urlImage: "assets/images/escudo.png",
              ),
              NewCard(
                // colorBar: Colors.amber,
                title: "Campeonato Barrense 2024",
                home: "Real Madrid FC ",
                alway: "Vasco FC Teste",
                locale: "Ginásio Poliesportivo o Duty",
                date: DateTime.now(),
                fase: "Fase de Grupos",
                // onTap: detalhes,
                // urlImage: "assets/images/escudo.png",
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const InsertPage(),
            ),
          );
        },
        backgroundColor: const Color(0xFF03045E),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

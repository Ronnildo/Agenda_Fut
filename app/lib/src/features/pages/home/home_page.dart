import 'package:app/src/features/pages/details/details_page.dart';
import 'package:app/src/features/pages/home/insert_page.dart';
import 'package:app/src/features/pages/details/perfil_page.dart';
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

              EasyInfiniteDateTimeLine(
                controller: _easyInfiniteDateTimelineController,
                firstDate: DateTime.now(),
                focusDate: _focusDate,
                lastDate: DateTime(2102),
                onDateChange: focusChange,
                locale: 'pt',
                activeColor: Colors.white,
                dayProps: EasyDayProps(
                  width: 60,
                  height: 80,
                  dayStructure: DayStructure.dayNumDayStr,
                  todayHighlightColor:
                      Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  todayHighlightStyle: TodayHighlightStyle.withBackground,
                  todayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      borderRadius: BorderRadius.circular(39),
                    ),
                    dayNumStyle: const TextStyle(
                      color: Color(0xFF17A909),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    dayStrStyle: const TextStyle(
                      color: Color(0xFF17A909),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  inactiveDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(39),
                    ),
                    dayStrStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                    dayNumStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  activeDayStyle: DayStyle(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(39),
                      border: Border.all(width: 1),
                    ),
                    dayStrStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    dayNumStyle: const TextStyle(
                      color: Color(0xFF17A909),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  borderColor: Colors.black,
                ),
              ),
              const Divider(endIndent: 8, height: 24),
              NewCard(
                // colorBar: Colors.amber,
                title: "Campeonato Barrense 2024",
                home: "Real Madrid FC ",
                alway: "Vasco FC Teste",
                locale: "Ginásio Poliesportivo o Duty",
                date: DateTime.now(),
                fase: "Fase de Grupos",
                onTap: detalhes,
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
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

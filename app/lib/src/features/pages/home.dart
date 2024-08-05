import 'package:app/src/features/pages/details.dart';
import 'package:app/src/features/pages/insert.dart';
import 'package:app/src/features/widgets/calendar_card.dart';
import 'package:app/src/features/widgets/custom_card_game.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final EasyInfiniteDateTimelineController _easyInfiniteDateTimelineController =
      EasyInfiniteDateTimelineController();
  String pathImage = "";
  List<int> data = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
  ]; // Procurar API de Calendário
  DateTime _focusDate = DateTime.now();
  DateTime time = DateTime.parse("2024-12-27 15:30:00.00");
  DateTime time2 = DateTime.parse("2024-12-27 15:30:00.00");
  //  TabController _tabController;

  detalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(DateTime.now());
    return Scaffold(
      backgroundColor: const Color(0xFFDDDDD1),
      appBar: AppBar(
        // Implementar lógica de troca por foto
        leading: const Icon(
          Icons.menu,
          size: 36,
          color: Colors.black,
        ),
        actions: [
          Text(
            "Jogador",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            width: 10,
          ),
          pathImage.isEmpty
              ? const Icon(
                  Icons.account_circle,
                  size: 50,
                )
              : Image(
                  image: AssetImage(pathImage),
                  width: 50,
                  height: 50,
                ),
        ],
        backgroundColor: const Color(0xFFDDDDD1),
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
                onDateChange: (selectDate) {
                  setState(() {
                    _focusDate = selectDate;
                  });
                },
                locale: 'pt',
                activeColor: Color(0xFF03045E),
                dayProps: EasyDayProps(
                  width: 60,
                  height: 80,
                  dayStructure: DayStructure.dayNumDayStr,
                  todayHighlightColor: const Color(0xFF03045E).withOpacity(0.5),
                  todayHighlightStyle: TodayHighlightStyle.withBackground,
                  todayStyle: const DayStyle(
                    dayNumStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                    dayStrStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  inactiveDayStyle: const DayStyle(
                    dayStrStyle: TextStyle(
                      color: Colors.blueAccent,
                    ),
                  ),
                  activeDayStyle: const DayStyle(
                    dayStrStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  borderColor: Colors.black,
                ),
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

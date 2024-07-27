import 'package:app/src/features/pages/details.dart';
import 'package:app/src/features/pages/insert.dart';
import 'package:app/src/features/widgets/calendar_card.dart';
import 'package:app/src/features/widgets/custom_card_game.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

  DateTime time = DateTime.parse("2024-12-27 15:30:00.00");
  DateTime time2 = DateTime.parse("2024-12-27 15:30:00.00");
  //  TabController _tabController;

  detalhes(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsPage(),),);
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
          const Text(
            "Jogador",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
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
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFF2D2B1E),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return CalendarCard(
                      value: data[index],
                    );
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Divider(
                  height: 2,
                  thickness: 1,
                  color: Colors.greenAccent,
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

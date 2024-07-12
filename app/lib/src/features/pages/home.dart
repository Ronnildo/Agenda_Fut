import 'package:app/src/features/tabs/competitions.dart';
import 'package:app/src/features/tabs/games.dart';
import 'package:app/src/features/widgets/calendar_card.dart';
import 'package:app/src/features/widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  ];
  //  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDDDDD1),
      appBar: AppBar(
        // Implementar lógica de troca por foto
        leading: const Icon(Icons.menu),
        actions: const [
          Text("Jogador",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.account_circle,
            size: 50,
          ),
        ],
        backgroundColor: const Color(0xFFDDDDD1),
        // title: const Text("Jogador"),
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
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
                  return const Divider(
                    thickness: 2,
                    height: 6,
                    indent: 10,
                    color: Colors.red,
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
            const CustomCard()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

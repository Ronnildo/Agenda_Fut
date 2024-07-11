import 'package:app/src/features/tabs/competitions.dart';
import 'package:app/src/features/tabs/games.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //  TabController _tabController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFDDDDD1),
        appBar: AppBar(
          // Implementar lógica de troca por foto
          leading: const Icon(Icons.account_circle),
          backgroundColor: const Color(0xFFDDDDD1),
          title: const Text("Jogador"),
          // bottom:  TabBar(
          //   indicatorWeight: 4,
          //   labelStyle: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   // controller: _tabController,
          //   indicatorColor: Colors.green,
          //   tabs: []
          // ),
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 60,
              color: const Color(0xFF242020),
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                itemCount: 9,
                scrollDirection: Axis.horizontal,
                
                separatorBuilder: (context, index) {
                  return Divider(thickness: 2, height: 2,);
                },
                itemBuilder: (context, index) {
                  return Text(
                    "12",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}

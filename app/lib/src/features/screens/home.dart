import 'package:flutter/material.dart';

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
      appBar: AppBar(
        // Implementar lógica de troca por foto
        leading: const Icon(Icons.account_circle),
        title: const Text("Jogador"),
        bottom:  const TabBar(
          indicatorWeight: 4,
          labelStyle:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          // controller: _tabController,
          indicatorColor: Colors.green,
          tabs: [
            Tab(
              text: "Meus Jogos",
            ),
            Tab(
              text: "Campeonatos",
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Placeholder(
            child: Row(),
          ),
        ],
      ),
    );
  }
}

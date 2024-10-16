import 'dart:io';

import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:app/src/features/pages/details/details_page.dart';
import 'package:app/src/features/pages/home/insert_page.dart';
import 'package:app/src/features/pages/details/perfil_page.dart';
import 'package:app/src/features/widgets/new_card.dart';
import 'package:app/src/models/game_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  DateTime selectDate = DateTime.now();

  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getNameUser();
    Provider.of<UserProvider>(context, listen: false).getPhoto();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // Implementar lógica de troca por foto
        title: Text(
          Provider.of<UserProvider>(context).name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 20,
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          Consumer<UserProvider>(
            builder: (context, value, child) {
              if (value.status == "sucess") {
                return InkWell(
                  onTap: perfilpage,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      image: DecorationImage(
                        image: FileImage(
                          File(value.pathImage),
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                );
              }
              return InkWell(
                onTap: perfilpage,
                child: const Icon(
                  Icons.account_circle,
                  size: 50,
                ),
              );
            },
          ),
          IconButton(
              onPressed: singOut,
              icon: const Icon(
                Icons.logout,
                size: 28,
              ))
        ],
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: SingleChildScrollView(
          // padding: const EdgeInsets.all(10),
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
              FutureBuilder(
                  future: Provider.of<GameProvider>(context, listen: false)
                      .getGames(_focusDate),
                  builder: (context, snapshot) {
                    return StreamBuilder<QuerySnapshot>(
                      stream: Provider.of<GameProvider>(context).games,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView(
                            shrinkWrap: true,
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              GameModel game = GameModel.fromJson(data);
                              i == data.length ? i = 0 : i;
                              return NewCard(
                                id: Provider.of<GameProvider>(context,
                                        listen: false)
                                    .ids[i],
                                title: game.nameCompetition!,
                                home: game.home!,
                                alway: game.away!,
                                fase: game.fase!,
                                date: game.date!,
                                locale: game.locale!,
                                onTap: () => details(
                                  game.nameCompetition!,
                                  game.home!,
                                  game.away!,
                                  game.date!,
                                  game.locale!,
                                ),
                                delete: delete,
                              );
                            }).toList(),
                          );
                        }

                        return const Center(
                          child: Text("Insira uma partida +"),
                        );
                      },
                    );
                  }),
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

  perfilpage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PerfilPage(),
      ),
    );
  }

  // Função de navegação para tela de detalhes
  details(String nameCompetition, String home, String away, DateTime date,
      String locale) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          nameCompetition: nameCompetition,
          home: home,
          away: away,
          date: date,
          locale: locale,
        ),
      ),
    );
  }

  delete() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Deletar partida?"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Provider.of<GameProvider>(context, listen: false).delete();
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.green,
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Text("Sim"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Text("Não"),
              ),
            ],
          ),
        );
      },
    );
  }

  singOut() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Sair do Aplicativo?"),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false).singOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Login(),
                      ));
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.green,
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Text("Sim"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                  textStyle: WidgetStatePropertyAll(
                    TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                child: const Text("Não"),
              ),
            ],
          ),
        );
      },
    );
  }

  focusChange(DateTime selectDate) {
    setState(() {
      _focusDate = selectDate;
    });

    Provider.of<GameProvider>(context, listen: false).getGames(_focusDate);
  }
}

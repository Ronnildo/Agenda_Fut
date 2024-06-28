import 'package:app/src/features/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class MyGames extends StatefulWidget {
  const MyGames({super.key});

  @override
  State<MyGames> createState() => _MyGamesState();
}

class _MyGamesState extends State<MyGames> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            CustomInput(
              labeltext: "Competição",
              controller: _searchController,
              icon: Icons.search,
              obscureText: false,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 220,
              decoration: BoxDecoration(
                color: const Color(0xFF3DB62A),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6,
                    spreadRadius: 0.6,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    children: [
                      const Text(
                        "Nome da Competição",
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                        maxLines: 9,
                        softWrap: true,
                      ),
                      Container(
                        height: 24,
                        width: 140,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.5,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "Fase",
                          style: TextStyle(
                            fontFamily: "IrishGrover",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Equipe",
                          style: TextStyle(
                            fontFamily: "IrishGrover",
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Localização",
                          style: TextStyle(
                            fontFamily: "IrishGrover",
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Datas do Jogos:",
                    style: TextStyle(
                      fontFamily: "IrishGrover",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const Wrap(
                    spacing: 8,
                    children: [
                      Text(
                        "1° Jogo: 16/08/2024 16:30h",
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "2° Jogo: 16/08/2024 15:45h",
                        style: TextStyle(
                          fontFamily: "IrishGrover",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      // Text(
                      //   "3° Jogo: 16/08/2024",
                      //   style: TextStyle(
                      //     fontFamily: "IrishGrover",
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 16,
                      //   ),
                      // ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: const Color(0xFF0077B6),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 6,
            spreadRadius: 0.6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 16,
            height: 180,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xFFDF0606),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Campeonato Barrense",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  // foreground: Paint()
                  //   ..style = PaintingStyle.stroke
                  //   ..strokeWidth = 3
                  //   ..color = Colors.black,
                  decorationColor: Colors.white,

                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.shield),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Equipe",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.edit,
                    size: 16,
                  ),
                ],
              ),
              Divider(
                thickness: 0,
                color: Colors.green,
                height: 10,
              ),
              Text(
                "Local:",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                "Arena Mangueirão",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),

              // Container(
              //   height: 24,
              //   width: 140,
              //   decoration: BoxDecoration(
              //     border: Border.all(
              //       width: 0.5,
              //       color: Colors.white,
              //     ),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   alignment: Alignment.center,
              //   child: const Text(
              //     "Fase",
              //     style: TextStyle(
              //       fontFamily: "IrishGrover",
              //       color: Colors.white,
              //       fontWeight: FontWeight.w700,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "16",
                  style: TextStyle(
                      fontSize: 55, fontWeight: FontWeight.bold, height: 0),
                ),
                Text(
                  "Julho",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 5,
                    height: 0,
                  ),
                ),
                Text(
                  "Segunda-Feira",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.alarm,
                        size: 16,
                      ),
                      Text(
                        "9:00 - 11:00 AM",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                    ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}

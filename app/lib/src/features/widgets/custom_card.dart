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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 14,
            height: 180,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Color(0xFFDF0606),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              const Text(
                "Competição",
                style: TextStyle(
                  fontFamily: "IrishGrover",
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                maxLines: 9,
                softWrap: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Equipe",
                    style: TextStyle(
                      fontFamily: "IrishGrover",
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
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
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

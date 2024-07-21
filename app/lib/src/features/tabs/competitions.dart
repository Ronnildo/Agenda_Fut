import 'package:app/src/features/widgets/custom_input.dart';
import 'package:flutter/material.dart';

class MyCompetitions extends StatefulWidget {
  const MyCompetitions({super.key});

  @override
  State<MyCompetitions> createState() => _MyCompetitionsState();
}

class _MyCompetitionsState extends State<MyCompetitions> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomInput(
            labeltext: "Competição",
            controller: _searchController,
            icon: Icons.search,
            obscureText: false,
          ),
        ],
      ),
    );
  }
}

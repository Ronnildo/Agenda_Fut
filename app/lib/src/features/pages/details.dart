import 'package:app/src/features/widgets/custom_button.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Competição"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                const Icon(
                  Icons.add_a_photo,
                  size: 40,
                ),
              ],
            ),
          ),
          const Center(
            child: Text(
              "Escudo da Equipe",
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 10,
            ),
            child: Text(
              "Detalhes da Partida:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListInforDetails(
            title: "Equipe",
            subTitle: "Atlético",
            icon: Icons.shield,
            onTap: () {},
          ),
          ListInforDetails(
            title: "Adversário",
            subTitle: "Boca Juniors",
            icon: Icons.shield,
            onTap: () {},
          ),
          ListInforDetails(
            title: "Local",
            subTitle: "Arena Tony",
            icon: Icons.location_on,
            onTap: () {},
          ),
          ListInforDetails(
            title: "Data",
            subTitle: "20/06/2024",
            icon: Icons.event,
            onTap: () {},
          ),
          ListInforDetails(
            title: "Horário",
            subTitle: "16:30 Am",
            icon: Icons.schedule,
            onTap: () {},
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Divider(
              thickness: 1,
              height: 8,
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            child: Text(
              textAlign: TextAlign.left,
              "Outros Informações da Competição:",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomButtom(onTap: () {}, title: "Salvar Alterações"),
          ),
        ],
      ),
    );
  }
}

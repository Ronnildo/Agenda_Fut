import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          "Perfil",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leadingWidth: 20,
        actions: const [
          Padding(
            padding: EdgeInsets.only(
              right: 12,
            ),
            child: Icon(
              Icons.sunny,
              size: 26,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: ContainerImage(
            onTap: () {},
          )),
          Text(
            "Foto do Perfil",
            style: Theme.of(context).textTheme.labelSmall,
          ),
          ListInforDetails(
              title: "Nome",
              subTitle: "Atleta",
              icon: Icons.person,
              onTap: () {}),
          ListInforDetails(
              title: "Posição",
              subTitle: "Meia-Atacante",
              icon: Icons.info,
              onTap: () {}),
          ListInforDetails(
              title: "Número",
              subTitle: "86 9988-8899",
              icon: Icons.phone,
              onTap: () {}),
        ],
      ),
    );
  }
}
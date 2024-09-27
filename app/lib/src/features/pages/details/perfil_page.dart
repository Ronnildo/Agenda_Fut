import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // XFile? file;
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
          // Center(child: ContainerImage(onTap: () {})),
          Text(
            "Foto do Perfil",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              return ListInforDetails(
                title: "Nome",
                subTitle: value.name,
                icon: Icons.person,
                onTap: () {},
              );
            },
          ),
          ListInforDetails(
            title: "Posição",
            subTitle: "Meia-Atacante",
            icon: Icons.info,
            onTap: () {},
          ),
          ListInforDetails(
            title: "Número",
            subTitle: "86 9988-8899",
            icon: Icons.phone,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

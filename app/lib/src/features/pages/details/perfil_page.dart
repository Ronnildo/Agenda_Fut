import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/details/widgets/consumer_image_perfil.dart';
import 'package:app/src/features/widgets/container_img.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  XFile _file = XFile("");
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getNameUser();
    Provider.of<UserProvider>(context, listen: false).getPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // XFile? file;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
            child: Consumer<UserProvider>(
              builder: (context, value, child) {
                if (value.status == "sucess") {
                  return ConsumerImagePerfil(pathImage: value.pathImage, uploadImage: (){},);
                } else if (value.isLoading) {
                  return const CircularProgressIndicator();
                } else {
                  return ContainerImage(
                      uploadImage: uploadImage, path: _file.path);
                }
              },
            ),
          ),
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

  Future<void> uploadImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      _file = file;
    }
    // ignore: use_build_context_synchronously
    Provider.of<UserProvider>(context, listen: false).setPhoto(_file.path);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false).status,
            // ignore: use_build_context_synchronously
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        duration: const Duration(
          seconds: 3,
        ),
        // ignore: use_build_context_synchronously
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/details/widgets/consumer_image_perfil.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:app/src/features/widgets/upload_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PerfilPage extends StatefulWidget {
  const PerfilPage({super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool editName = false;
  bool editPos = false;
  bool editPhone = false;
  XFile _file = XFile("");
  @override
  void initState() {
    Provider.of<UserProvider>(context, listen: false).getUser();
    Provider.of<UserProvider>(context, listen: false).getPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  return ConsumerImagePerfil(
                    pathImage: value.pathImage,
                    uploadImage: uploadImage,
                  );
                }
                return UploadImageContainer(
                  filePath: _file.path,
                  uploadImage: uploadImage,
                );
              },
            ),
          ),
          Text(
            "Foto do Perfil",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              if (!value.isLoading) {
                return ListInforDetails(
                  controller: _nameController,
                  edit: editName,
                  title: "Nome",
                  subTitle: value.name,
                  icon: Icons.person,
                  onTap: () => updateName(_nameController.text),
                );
              }
              return ListInforDetails(
                controller: _nameController,
                edit: editName,
                title: "Nome",
                subTitle: value.name,
                icon: Icons.person,
                onTap: () => updateName(_nameController.text),
              );
            },
          ),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              if (!value.isLoading) {
                return ListInforDetails(
                  controller: _positionController,
                  edit: editPos,
                  title: "Posição",
                  subTitle: value.position,
                  icon: Icons.info,
                  onTap: () => updatePosition(_positionController.text),
                );
              }
              return ListInforDetails(
                controller: _positionController,
                edit: editPos,
                title: "Posição",
                subTitle: value.position,
                icon: Icons.info,
                onTap: () => updatePosition(_positionController.text),
              );
            },
          ),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              if (!value.isLoading) {
                return ListInforDetails(
                  controller: _phoneController,
                  edit: editPhone,
                  title: "Número",
                  subTitle: value.phone,
                  icon: Icons.phone,
                  onTap: () => updatePhone(_phoneController.text),
                );
              }
              return ListInforDetails(
                controller: _phoneController,
                edit: editPhone,
                title: "Número",
                subTitle: value.phone,
                icon: Icons.phone,
                onTap: () => updatePhone(_phoneController.text),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> updateName(String name) async {
    if (!editName) {
      setState(() {
        editName = true;
      });
    }
    if (name != "" &&
        Provider.of<UserProvider>(context, listen: false).name != name) {
      setState(() {
        editName = false;
      });
      await Provider.of<UserProvider>(context, listen: false)
          .updateUserName(_nameController.text);
      if (Provider.of<UserProvider>(context, listen: false).status ==
          "sucess") {
        Provider.of<UserProvider>(context, listen: false).getUser();
      } else {
        setState(() {
          editName = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Não foi possível atualizar seu nome."),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } 
  }

  Future<void> updatePosition(String position) async {
    if (!editPos) {
      setState(() {
        editPos = true;
      });
    }
    if (Provider.of<UserProvider>(context, listen: false).position == "") {
      await Provider.of<UserProvider>(context, listen: false)
          .setPostionUser(position);
      if (Provider.of<UserProvider>(context, listen: false).status ==
          "sucess") {
        print("Up");
        Provider.of<UserProvider>(context, listen: false).getUser();
      } else {
        setState(() {
          editPos = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Não foi possível atualizar sua posição."),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    } else {
      if (Provider.of<UserProvider>(context, listen: false).position !=
          position) {
        setState(() {
          editPos = false;
        });
        await Provider.of<UserProvider>(context, listen: false)
            .updateUserName(_nameController.text);
        if (Provider.of<UserProvider>(context, listen: false).status ==
            "sucess") {
          Provider.of<UserProvider>(context, listen: false).getUser();
        } else {
          setState(() {
            editPos = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text("Não foi possível atualizar sua posição."),
              duration: const Duration(seconds: 2),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
          );
        }
      }
    }
  }

  Future<void> updatePhone(String phone) async {
    if (!editPhone) {
      setState(() {
        editPhone = true;
      });
    }
    if (Provider.of<UserProvider>(context, listen: false).phone != phone) {
      setState(() {
        editPhone = false;
      });
      await Provider.of<UserProvider>(context, listen: false)
          .updateUserName(_nameController.text);
      if (Provider.of<UserProvider>(context, listen: false).status ==
          "sucess") {
        Provider.of<UserProvider>(context, listen: false).getUser();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Não foi possível atualizar o seu número."),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        );
      }
    }
  }

  Future<void> uploadImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      _file = file;
      await Provider.of<UserProvider>(context, listen: false)
          .setPhoto(_file.path);
    }
    if (Provider.of<UserProvider>(context, listen: false).status == "sucess") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              "Imagem de perfil carregada.",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
      Provider.of<UserProvider>(context, listen: false).getPhoto();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(
            child: Text(
              Provider.of<UserProvider>(context, listen: false).error,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      );
    }
  }
}

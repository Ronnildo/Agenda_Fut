// ignore_for_file: use_build_context_synchronously
import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/details/widgets/consumer_image_perfil.dart';
import 'package:app/src/features/pages/home/widgets/banner_ad.dart';
import 'package:app/src/features/widgets/list_details.dart';
import 'package:app/src/features/pages/home/widgets/upload_image.dart';
import 'package:app/src/features/widgets/snackbar_auth.dart';
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
                if (!value.isLoading || value.pathImage != "") {
                  return ConsumerImagePerfil(
                    pathImage: value.pathImage,
                    uploadImage: uploadImage,
                  );
                }
                return UploadImageContainer(
                  filePath: _file.path,
                  uploadImage: uploadImage,
                  text: "Foto de Perfil",
                );
              },
            ),
          ),
          // Text(
          //   "Foto do Perfil",
          //   style: Theme.of(context).textTheme.bodyMedium,
          // ),
          Consumer<UserProvider>(
            builder: (context, value, child) {
              if (!value.isLoading) {
                return ListInforDetails(
                  controller: _nameController,
                  edit: editName,
                  title: "Nome",
                  subTitle: value.name,
                  icon: Icons.person,
                  onTap: updateName,
                );
              }
              return ListInforDetails(
                controller: _nameController,
                edit: editName,
                title: "Nome",
                subTitle: value.name,
                icon: Icons.person,
                onTap: updateName,
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
                  onTap: updatePosition,
                );
              }
              return ListInforDetails(
                controller: _positionController,
                edit: editPos,
                title: "Posição",
                subTitle: value.position,
                icon: Icons.info,
                onTap: updatePosition,
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const BannerAdMob(
        adUnitId: "ca-app-pub-3101866454473029/1955179764",
      ),
    );
  }

  Future<void> updateName() async {
    if (!editName) {
      setState(() {
        editName = true;
        _nameController.text =
            Provider.of<UserProvider>(context, listen: false).name;
      });
    } else {
      setState(() {
        editName = false;
      });
      if (_nameController.text ==
              Provider.of<UserProvider>(context, listen: false).name ||
          _nameController.text == "") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Não foi possível atualizar seu nome."),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } else {
        await Provider.of<UserProvider>(context, listen: false)
            .updateUserName(_nameController.text);
        await Provider.of<UserProvider>(context, listen: false).getUser();
      }
    }
  }

  Future<void> updatePosition() async {
    if (!editPos) {
      setState(() {
        editPos = true;
        _positionController.text =
            Provider.of<UserProvider>(context, listen: false).position;
      });
    } else {
      setState(() {
        editPos = false;
      });
      if (_positionController.text == "" ||
          _positionController.text ==
              Provider.of<UserProvider>(context, listen: false).position) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Não foi possível atualizar sua posição."),
            duration: const Duration(seconds: 2),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      } else {
        await Provider.of<UserProvider>(context, listen: false)
            .setPostionUser(_positionController.text);
        await Provider.of<UserProvider>(context, listen: false).getUser();
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
    } else {
      return;
    }
    if (Provider.of<UserProvider>(context, listen: false).status == "sucess") {
      CustomSnackBar().show(context, "Imagem de perfil carregada.");
      Provider.of<UserProvider>(context, listen: false).getPhoto();
    } else {
      CustomSnackBar().showError(
          context, Provider.of<UserProvider>(context, listen: false).error);
    }
  }
}

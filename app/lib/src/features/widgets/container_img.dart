import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContainerImage extends StatefulWidget {
  const ContainerImage({
    super.key,
  });

  @override
  State<ContainerImage> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  XFile? fileUpload;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: fileUpload != null
                  ? FileImage(File(fileUpload!.path))
                  : FileImage(
                      File(""),
                    ),
              fit: BoxFit.cover,
            ),
          ),
          child: fileUpload == null
              ? const Icon(
                  Icons.photo,
                  size: 32,
                )
              : null,
        ),
        InkWell(
          onTap: uploadImage,
          child: Icon(
            Icons.add_a_photo,
            size: 40,
            color: fileUpload == null ? Colors.black : Colors.white,
          ),
        ),
      ],
    );
  }

  void uploadImage() async {
    ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          fileUpload = file;
        });
      }
    } catch (e) {
      e;
    }
  }
}

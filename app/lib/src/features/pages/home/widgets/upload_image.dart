import 'dart:io';

import 'package:flutter/material.dart';

class UploadImageContainer extends StatefulWidget {
  final String filePath;
  final void Function() uploadImage;
  const UploadImageContainer({
    required this.filePath,
    required this.uploadImage,
    super.key,
  });

  @override
  State<UploadImageContainer> createState() => _UploadImageContainerState();
}

class _UploadImageContainerState extends State<UploadImageContainer> {
  @override
  void dispose() {
    super.dispose();
  }

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
              image: FileImage(File(widget.filePath)),
              fit: BoxFit.cover,
            ),
          ),
          child: const Icon(
            Icons.photo,
            size: 32,
          ),
        ),
        InkWell(
          onTap: widget.uploadImage,
          child: const Icon(
            Icons.add_a_photo,
            size: 35,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ConsumerImagePerfil extends StatefulWidget {
  final String pathImage;
  final void Function() uploadImage;
  const ConsumerImagePerfil({
    super.key,
    required this.pathImage,
    required this.uploadImage,
  });

  @override
  State<ConsumerImagePerfil> createState() => _ConsumerImagesState();
}

class _ConsumerImagesState extends State<ConsumerImagePerfil> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                foregroundImage: FileImage(
                  File(widget.pathImage),
                ),
              ),
            );
          },
        );
      },
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              image: DecorationImage(
                image: FileImage(
                  File(widget.pathImage),
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          InkWell(
            onTap: widget.uploadImage,
            child: const Icon(
              Icons.add_a_photo,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

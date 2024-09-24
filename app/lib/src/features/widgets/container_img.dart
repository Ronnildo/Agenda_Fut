import 'dart:io';
import 'package:app/src/features/controllers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContainerImage extends StatefulWidget {
  final String path;
  final void Function() uploadImage;
  const ContainerImage({
    required this.uploadImage,
    required this.path,
    super.key,
  });

  @override
  State<ContainerImage> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GameProvider>(builder: (context, value, child) {
      if (value.fileUp != "") {
        return Stack(alignment: Alignment.bottomRight, children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                // ignore: unnecessary_null_comparison
                image: FileImage(File(
                    Provider.of<GameProvider>(context, listen: false).fileUp)),
                fit: BoxFit.cover,
              ),
            ),
            // ignore: unnecessary_null_comparison
            child: widget.path == null
                ? const Icon(
                    Icons.photo,
                    size: 32,
                  )
                : null,
          ),
          InkWell(
            onTap: widget.uploadImage,
            child: const Icon(
              Icons.add_a_photo,
              size: 35,
              // ignore: unnecessary_null_comparison
              color: Colors.black,
            ),
          ),
        ]);
      }
      return Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.photo,
                size: 32,
              )),
          InkWell(
            onTap: widget.uploadImage,
            child: const Icon(
              Icons.add_a_photo,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
      );
    });
  }
}

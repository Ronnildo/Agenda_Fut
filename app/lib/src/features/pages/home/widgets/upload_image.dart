import 'dart:io';

import 'package:app/src/features/widgets/upload_image.dart';
import 'package:flutter/material.dart';

class UploadImageContainer extends StatefulWidget {
  final String filePath;
  final void Function() uploadImage;
  final String text;
  const UploadImageContainer({
    required this.filePath,
    required this.uploadImage,
    required this.text,
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
    return Column(
      children: [
        Stack(
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
            IconUploadImage(uploadImage: widget.uploadImage),
          ],
        ),
        Text(
          widget.text,
          textAlign: TextAlign.center,
          maxLines: 2,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }
}

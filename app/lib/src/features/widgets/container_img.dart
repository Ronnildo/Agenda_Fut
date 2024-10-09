import 'package:flutter/material.dart';

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
    );
  }
}

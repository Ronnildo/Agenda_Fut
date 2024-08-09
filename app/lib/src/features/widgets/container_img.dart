import 'package:flutter/material.dart';

class ContainerImage extends StatefulWidget {
  final void Function() onTap;
  const ContainerImage({
    super.key,
    required this.onTap,
  });

  @override
  State<ContainerImage> createState() => _ContainerImageState();
}

class _ContainerImageState extends State<ContainerImage> {
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
          onTap: widget.onTap,
          child: const Icon(
            Icons.add_a_photo,
            size: 40,
          ),
        ),
      ],
    );
  }
}

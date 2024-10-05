import 'package:flutter/material.dart';

class ConsumerImageGame extends StatefulWidget {
  final String pathImage;
  final void Function() uploadImage;
  const ConsumerImageGame({
    super.key,
    required this.pathImage,
    required this.uploadImage,
  });

  @override
  State<ConsumerImageGame> createState() => _ConsumerImageGameState();
}

class _ConsumerImageGameState extends State<ConsumerImageGame> {
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
            image: DecorationImage(
              image: NetworkImage(
                widget.pathImage,
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
    );
  }
}

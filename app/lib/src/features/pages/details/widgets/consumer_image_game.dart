import 'package:app/src/features/widgets/upload_image.dart';
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
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircleAvatar(
                foregroundImage: NetworkImage(widget.pathImage),
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          Stack(
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
              IconUploadImage(uploadImage: widget.uploadImage),
            ],
          ),
          Text(
            "Banner do Jogo/Arte",
            textAlign: TextAlign.center,
            maxLines: 2,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class IconUploadImage extends StatefulWidget {
  final void Function() uploadImage;
  const IconUploadImage({
    super.key,
    required this.uploadImage,
  });

  @override
  State<IconUploadImage> createState() => _IconUploadImageState();
}

class _IconUploadImageState extends State<IconUploadImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: const Color(0xFFDDDDD1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: widget.uploadImage,
        child: const Icon(
          Icons.add_a_photo,
          size: 28,
          color: Colors.black,
        ),
      ),
    );
  }
}

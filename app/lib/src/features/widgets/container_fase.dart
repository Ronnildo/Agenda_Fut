import 'package:flutter/material.dart';

class ContainerFase extends StatefulWidget {
  final String fase;
  final double width;
  final double heigth;
  const ContainerFase({
    super.key,
    required this.fase,
    required this.width,
    required this.heigth,
  });

  @override
  State<ContainerFase> createState() => _ContainerFaseState();
}

class _ContainerFaseState extends State<ContainerFase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.heigth,
      decoration: BoxDecoration(
        color: const Color(0xFF4E9F1D),
        borderRadius: BorderRadius.circular(24),
      ),
      alignment: Alignment.center,
      child: Text(
        widget.fase,
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 7,
          fontWeight: FontWeight.w700,
          
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";

class CustomTitle extends StatefulWidget {
  const CustomTitle({super.key});

  @override
  State<CustomTitle> createState() => _CustomTitleState();
}

class _CustomTitleState extends State<CustomTitle> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MyPainter(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.8,
        width: MediaQuery.of(context).size.width, 
        child: Center(
          child:  Text(
            "Fut Agenda",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}

class _MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final title = Paint()..color = const Color(0xFF03045E);

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height / 1.4);

    canvas.drawPath(path, title);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

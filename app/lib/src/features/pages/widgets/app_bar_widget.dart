import 'package:app/src/features/pages/widgets/custom_title.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: CustomTitle(heightdiv: 100),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(120);
}

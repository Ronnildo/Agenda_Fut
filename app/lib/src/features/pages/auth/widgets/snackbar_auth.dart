import "package:flutter/material.dart";

class SnackBarUserAuth extends StatefulWidget {
  final String message;
  const SnackBarUserAuth({super.key, required this.message});

  @override
  State<SnackBarUserAuth> createState() => _SnackBarUserAuthState();
}

class _SnackBarUserAuthState extends State<SnackBarUserAuth> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Center(
        child: Text(
          widget.message,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      duration: const Duration(
        seconds: 3,
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(seconds: 2),
        splashScreenBody: Center(
          child: Text(
            "Fut Agenda",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        useImmersiveMode: true,
        nextScreen: const Login(),
      ),
    );
  }
}

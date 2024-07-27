import 'package:app/src/features/pages/login.dart';
import 'package:flutter/material.dart';

class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
          displayMedium: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        shadowColor: Colors.black,
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

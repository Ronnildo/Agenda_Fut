import 'package:app/src/features/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';


class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

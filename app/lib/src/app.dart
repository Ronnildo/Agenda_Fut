import 'package:app/src/core/theme.dart';
import 'package:app/src/features/pages/auth/login_page.dart';
import 'package:flutter/material.dart';

class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: CustomTheme.lightThemeData(context),
      home: const Login(),
    );
  }
}

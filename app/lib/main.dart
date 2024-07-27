import 'package:app/src/app.dart';

// import 'package:app/src/features/screens/login.dart';
// import 'package:app/src/features/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting('pt_BR', "null");
  // await Supabase.initialize(
  //   url: const String.fromEnvironment('SUPABASE_URL',
  //       defaultValue: 'URL inválida'),
  //   anonKey: const String.fromEnvironment('SUPABASE_KEY',
  //       defaultValue: 'Chave não encontrada'),
  // );
  
  runApp(const AgendaApp());
}

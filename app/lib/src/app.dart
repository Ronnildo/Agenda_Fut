import 'package:app/src/core/domain/datasources/remote/user_remote_datasource_imp.dart';
import 'package:app/src/core/domain/repositories/login/login_user_repository_imp.dart';
import 'package:app/src/core/domain/repositories/register/register_user_repository_imp.dart';
import 'package:app/src/features/pages/login/controllers/login_user_controller.dart';
import 'package:app/src/features/pages/register/controllers/register_user_controller.dart';
import 'package:app/src/features/pages/register/domain/usecases/register_use_usecase/register_user_usecase_imp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:app/src/config/theme/theme.dart';
import 'package:app/src/features/controllers/game_provider.dart';
import 'package:app/src/features/controllers/user_provider.dart';
import 'package:app/src/features/pages/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AgendaApp extends StatelessWidget {
  const AgendaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth),
        Provider(create: (_) => UserRemoteDataSourceImp(FirebaseAuth.instance)),
        Provider(
            create: (context) => RegisterUserRepositoryImp(
                UserRemoteDataSourceImp(FirebaseAuth.instance))),
        Provider(
            create: (context) => RegisterUserUseCaseImp(
                RegisterUserRepositoryImp(
                    UserRemoteDataSourceImp(FirebaseAuth.instance)))),
        ChangeNotifierProvider(
            create: (context) => RegisterUserController(RegisterUserUseCaseImp(
                RegisterUserRepositoryImp(
                    UserRemoteDataSourceImp(FirebaseAuth.instance))))),
        ChangeNotifierProvider(
            create: (context) => LoginUserController(LoginUserRepositoryImp(
                UserRemoteDataSourceImp(FirebaseAuth.instance)))),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => GameProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const <LocalizationsDelegate>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        title: 'Fut Agenda',
        theme: CustomTheme.lightThemeData(context),
        supportedLocales: const [
          Locale("pt", "BR"),
        ],
        home: const SplashPage(),
      ),
    );
  }
}

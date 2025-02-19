import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/firebase_options_dev.dart';
import 'package:app/src/config/flavors.dart';
import 'package:app/src/features/controllers/notification_controller.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../main.dart' as main_common;

Future<void> main() async {
  Flavor.flavorType = FlavorTypes.dev;
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting('pt_BR', "null");
  
  MobileAds.instance.initialize();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  await NotificationController().initNotifications();

  await FirebaseAppCheck.instance.activate(
    webProvider: ReCaptchaV3Provider('recaptcha-v3-site-key'),
    androidProvider: AndroidProvider.playIntegrity,
  );

  main_common.main();
}
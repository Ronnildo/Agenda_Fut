import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class NotificationController {
  final _firabaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firabaseMessaging.requestPermission();

    final fcmToken = await _firabaseMessaging.getToken();

    debugPrint(fcmToken);

    initPushNotification();
  }

  void handleMessage(RemoteMessage? message) {
    if (message == null) return;
  }

  Future initPushNotification() async {
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}

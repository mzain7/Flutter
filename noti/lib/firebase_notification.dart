//firebase notification

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

Future<void> _handleBackgroundMessage(RemoteMessage message) async {
  print("Tile: ${message.notification!.title}");
  print("Body: ${message.notification!.body}");
  print("Data: ${message.data}");
}

class FirebaseApi {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    final fCMToken = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $fCMToken");
    FirebaseMessaging.onBackgroundMessage(_handleBackgroundMessage);
    
  }
}

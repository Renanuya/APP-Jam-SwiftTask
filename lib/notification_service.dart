import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin localNotification =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"));
    localNotification.initialize(initializationSettings);
  }

  static void pushNotification() async {
    try {
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
            "pushNotification", "Görev Bildirimleri",
            channelDescription: "Bu kanal görev bildirimleri içindir",
            importance: Importance.max,
            priority: Priority.high),
      );
      await localNotification.show(
          0,
          'Yeni bir görev var',
          'Görev listenize yeni bir görev eklendi, detaylar için görev listesine göz atın.',
          notificationDetails);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static void createNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().microsecond ~/ 1000;
      NotificationDetails notificationDetails = const NotificationDetails(
        android: AndroidNotificationDetails(
            "pushNotificationFirebase", "Önemli Bildirimler",
            channelDescription: "Bu kanal önemli bildirimler içindir",
            importance: Importance.max,
            priority: Priority.high),
      );
      await localNotification.show(id, message.notification!.title,
          message.notification!.body, notificationDetails);
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

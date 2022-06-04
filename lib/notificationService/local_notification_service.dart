import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebaseflutter/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    //Initialization Settings for iOS
    const IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //Initialization Settings for Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async {
        if (kDebugMode) {
          print("onSelectNotification*******");
        }
        if (payload!.isNotEmpty) {
          if (kDebugMode) {
            print("Custom data key ********* = $payload");
          }

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => Home(
                title: payload,
              ),
            ),
          );

        }
      },
    );
  }

  static void createAndDisplayNotification(RemoteMessage message) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails(
            "FahmyAbadaNotificationApp",
            "FahmyAbadaNotificationAppChannel",
            playSound: true,
            importance: Importance.max,
            priority: Priority.high,
          ),
          iOS: IOSNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ));

      await _notificationsPlugin.show(
        id,
        message.data['title'],
        message.data['body'],
        notificationDetails,
        //payload : holds the data that is passed through the notification when the notification is tapped
        payload: message.data['title'],
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pushnotification/NotificationScreen.dart';
import 'package:pushnotification/main.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;


  final _androidChannel = const AndroidNotificationChannel(
    "high_importnace_channel",
  "High Importance Notications",
  description: "This channel is use fr Important Notification ",
  importance: Importance.defaultImportance);

void handleMessage(RemoteMessage? message) {
  if(message == null) return;

  navigatorkey.currentState?.pushNamed(
    NotificationScreen.route,
    arguments: message,
  );
}

Future initPushNotifications()
async{
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge:true,
    sound:true
  );


  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
}

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print(("Token: $fCMToken"));
    initPushNotifications();

  }
}
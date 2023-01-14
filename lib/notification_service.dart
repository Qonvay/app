import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationService {
  FirebaseNotificationService._();
  static FirebaseNotificationService get instance => FirebaseNotificationService._();

  final FirebaseMessaging _fcm=FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initilize() async {
    _requestFCMPermissions();
    _requestLocalNotiPermissions();

    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings(
        requestAlertPermission: false,
        requestBadgePermission: false,
        requestSoundPermission: false,
        onDidReceiveLocalNotification: didReceiveNotification
    );
    InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse:onDidReceiveNotificationResponse);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      showNotification(message);
    });
//    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String payload = notificationResponse.payload.toString();
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  void _requestFCMPermissions() {
    _fcm.requestPermission(
      provisional: true,
      criticalAlert: true,
      announcement: true,
      carPlay: true,
    );
  }
  void _requestLocalNotiPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  void didReceiveNotification(int? id, String? title, String? body, String? payload,) async {
    print("notification clicked:$title:$body");
  }
  onSelectNotification(payload) {
    print("notification clicked:$payload");
  }


  showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('qonvay', 'qonvay channel',
        channelDescription: 'qonvay',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        ticker: 'ticker');

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
    DarwinNotificationDetails(presentSound: true, presentAlert: true,presentBadge: true);
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
        iOS: iOSPlatformChannelSpecifics,
        android: androidPlatformChannelSpecifics);

/*
    String title="";
    if(message.data['type']=='personal' || message.data['type']=='accept_request' || message.data['type']=='sent_request')
    {
      title=message.data['title']+getTranslated(Get.context, message.data['key']);
    }else if(message.data['type']=='group_message')
    {
      title=getTranslated(Get.context, message.data['key'])+message.data['title']+getTranslated(Get.context, 'group');
    }
*/

    await flutterLocalNotificationsPlugin
        .show(message.hashCode, message.notification!.title,message.notification!.body,
        platformChannelSpecifics,
        payload:
        "${message.notification!.title},${message.notification!.body}")
        .onError((error, stackTrace) => print(error));
  }






}

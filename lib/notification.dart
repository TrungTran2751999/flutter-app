
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  void requestNotificationPermissision()async{
    NotificationSettings notificationSettings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true
    );
    if(notificationSettings.authorizationStatus == AuthorizationStatus.authorized){
        print('grated permission');
    }else if(notificationSettings.authorizationStatus==AuthorizationStatus.authorized){
        print('provisional grated permission');
    }else{
        print('denied permission');
    }
  }
  void initLocalNotifications() async{
    var androidInitializationSettings = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosInitializationSettings = const DarwinInitializationSettings();
    var initalizationSetting = InitializationSettings(
        android: androidInitializationSettings,
        iOS: iosInitializationSettings
    );
    await _flutterLocalNotificationsPlugin.initialize(
        initalizationSetting
    );
  }
  void showNotification(String title, String body)async{
    AndroidNotificationChannel channel = AndroidNotificationChannel(
        Random.secure().nextInt(100000).toString(),
        'High Inportance Notification',
        importance: Importance.max
    );
    AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
        channel.id.toString(),
        channel.name.toString(),
        channelDescription: 'your channel description',
        importance: Importance.high,
        priority: Priority.high,
        ticker: 'ticker'
    );
    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true
    );
    NotificationDetails notificationDetails = NotificationDetails(
        android: androidNotificationDetails,
        iOS: darwinNotificationDetails
    );
     await _flutterLocalNotificationsPlugin.show(
        0, // ID thông báo
        title, // Tiêu đề thông báo
        body, // Nội dung thông báo
         notificationDetails,
        payload: 'notification');
    // Future.delayed(Duration.zero, (){
    //   _flutterLocalNotificationsPlugin.show(
    //       0,
    //       message.notification!.title.toString(),
    //       message.notification!.body.toString(),
    //       notificationDetails
    //   );
    // });

  }
  void firebaseInit() async {
    FirebaseMessaging.onMessage.listen((message) {
      if (kDebugMode) {
        print(message.notification!.title.toString());
        print(message.notification!.body.toString());
        print(message.data['id']);
        print(message.data['name']);
      }
      showNotification(message.notification!.title.toString(), message.notification!.body.toString());
    });
  }
  Future<String> getDeviceToken()async{
    String? token = await messaging.getToken();
    return token!;
  }
  void isTokenRefresh()async {
    messaging.onTokenRefresh.listen((event) {
      print('token reset');
      event.toString();
    });
  }
  void handleMessage(BuildContext context, RemoteMessage message){

  }
}
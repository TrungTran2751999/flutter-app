import 'dart:convert';

import 'package:app/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.requestNotificationPermissision();
    notificationService.initLocalNotifications(context);
    notificationService.firebaseInit();
    notificationService.setupInteractMessage(context);
    // notificationService.isTokenRefresh();
    notificationService.getDeviceToken().then((value){
     print('deviceToken');
     print(value);
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Firebase"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TextButton(onPressed: () {
          notificationService.getDeviceToken().then((value)async{
            var data = {
              'to': value.toString(),
              'priority': 'high',
              'notification':{
                'title': "Tiêu đề",
                'body': "Đây là nội dung của tiêu đề"
              },
              'data':{
                'id': "1",
                "name": "fuckkkk"
              }
            };
            await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
              body: jsonEncode(data),
                headers: {
                    'Content-Type': 'application/json; charset=UTF-8',
                    'Authorization': 'key=AAAA0yy1RGE:APA91bFw4_v36gef3tp1_Om2_sX1T5ESri8Qi04RRgTq2OcgF_jyqFAbGe-uBEBqQPQe8Zp3fDtIPMF1jL1S71dPHudbBcJzJA-9mqMRXGbspcaXMWZRbI2lCPtFd293aitM9SaJoQ0u'
                }
            );
          });
        },
          child: Text("Send Notification"),),
      ),
    );
  }
}


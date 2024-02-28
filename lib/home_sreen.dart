import 'package:app/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    notificationService.initLocalNotifications();
    notificationService.firebaseInit();
    notificationService.isTokenRefresh();
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
    );
  }
}


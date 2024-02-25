
import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
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
  void firebaseInit(){
    FirebaseMessaging.onMessage.listen((message) {
      print(message.notification!.title.toString());
      print(message.notification!.body.toString());
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
}
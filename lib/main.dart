import 'package:app/firebase_options.dart';
import 'package:app/home_sreen.dart';
import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/CardBody.dart';
import 'package:app/widget/CardModal.dart';
import 'package:app/widget/Detai.dart';
import 'package:app/widget/HomeView.dart';
import 'package:app/widget/LoginView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'modal/DataItems.dart';

void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async{
  await Firebase.initializeApp();
}




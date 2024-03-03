import 'dart:convert';

import 'package:app/util/LoginUser.dart';
import 'package:app/widget/LoginView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Util{
  static Future<void> showMyDialog(BuildContext context, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thông báo'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(content)
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Đóng'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  static void sendNotficate(String title, String content)async{
    var data = {
      'to': LoginUser.deviceToken,
      'priority': 'high',
      'notification':{
        'title': title,
        'body': content
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
  }
}
import 'package:app/network/NetWork.dart';
import 'package:app/util/Util.dart';
import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/Detai.dart';
import 'package:app/widget/HomeView.dart';
import 'package:app/widget/MainView.dart';
import 'package:app/widget/Register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../notification.dart';
class LoginView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return LoginViews();
  }

}
class LoginViews extends State<LoginView>{
  NotificationService notificationService = NotificationService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notificationService.requestNotificationPermissision();
    notificationService.initLocalNotifications(context);
    notificationService.firebaseInit();
    notificationService.setupInteractMessage(context);
  }
  late String userName;
  late String passWord;
  late bool isLoading;
  late Widget loadingWidget = const Text(
    "LOGIN",
    style: TextStyle(
        color: Colors.white
    ),
  );
  void login(BuildContext context){
    setState(() {
      loadingWidget = const Center(
        child: CircularProgressIndicator(),
      );
    });
    notificationService.getDeviceToken().then((value) {
      var data = {
        "userName": userName,
        "password": passWord,
        "token": value
      };
      NetWork.login(data, value).then((res) {
        if (res) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainView())
          );
        } else {
          Util.showMyDialog(context, "Tài khoản hoặc mật khẩu không tồn tại");
        }
        setState(() {
          loadingWidget = const Text(
            "LOGIN",
            style: TextStyle(
                color: Colors.white
            ),
          );
        });
      });
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
          ),
        ),
        backgroundColor: Colors.black54,
      ),
      body: WillPopScope(
        onWillPop: () async {
          // Xử lý sự kiện nút quay lại một cách thủ công
          // Bạn có thể thực hiện các hành động mong muốn tại đây
          // Trả về false để hủy chức năng nút quay lại
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (value) => {
                          userName = value
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'UserName'
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextField(
                        onChanged: (value) => {
                          passWord = value
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password'
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: (){
                              login(context);
                            },
                            child: loadingWidget
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => RegisterView())
                              );
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      )
    );
  }

}
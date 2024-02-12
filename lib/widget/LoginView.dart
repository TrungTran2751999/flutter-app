import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/Detai.dart';
import 'package:app/widget/HomeView.dart';
import 'package:app/widget/MainView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget{
  late String userName;
  late String passWord;
  void login(BuildContext context){
    if(userName=="user" && passWord == "123456"){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MainView())
        );
    }
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
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
      )
    );
  }

}
import 'package:app/network/NetWork.dart';
import 'package:app/util/Util.dart';
import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/Detai.dart';
import 'package:app/widget/HomeView.dart';
import 'package:app/widget/LoginView.dart';
import 'package:app/widget/MainView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class RegisterView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Registers();
  }

}
class Registers extends State<RegisterView>{
  late String userName;
  late String passWord;
  late String name;
  late bool isLoading;
  late Widget loadingWidget = const Text(
    "REGISTER",
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
    var data = {
      "userName": userName,
      "passWord": passWord,
      "name":name
    };
    NetWork.register(data).then((res){
      if(res=="Success"){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginView())
        );
      }else{
        Util.showMyDialog(context, res);
      }
      setState(() {
        loadingWidget = const Text(
          "REGISTER",
          style: TextStyle(
              color: Colors.white
          ),
        );
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "REGISTER",
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
                            name = value
                          },
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Name'
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
                                    MaterialPageRoute(builder: (context) => LoginView())
                                );
                              },
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
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
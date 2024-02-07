import 'package:app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalBotomm extends StatefulWidget{
  Function fun;
  bool isVisbled;
  ModalBotomm({
    Key?key,
    required this.fun,
    required this.isVisbled,
  }):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ModalBottom(fun: fun, isVisbled: isVisbled);
  }
}

class ModalBottom extends State<ModalBotomm>{
  Function fun;
  bool isVisbled;
  ModalBottom({
    required this.fun,
    required this.isVisbled
  });
  void handleInput(){
      fun(value);
      setState(() {
        isVisbled = !isVisbled;
      });
      print(isVisbled);
  }
  String value = "";
  @override
  Widget build(BuildContext context) {
    return
    Visibility(
      visible: isVisbled,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,//noi modal khi nhap input
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            height: 180,
            color: Colors.white,
            child: Column(
              children: [
                TextField(
                  onChanged: (text) => value = text,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Your Task'
                  ),
                ),
                Container(height: 16,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                      ),
                      onPressed: (){
                        handleInput();
                      },
                      child: Text("Add Job")),
                )

              ],
            ),
          ),
        )
    );

  }

}
import 'package:app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalBotomm extends StatefulWidget{
  Function fun;
  bool isVisbled;
  String value;
  String type;
  ModalBotomm({
    Key?key,
    required this.fun,
    required this.isVisbled,
    required this.value,
    required this.type
  }):super(key: key);
  @override
  State<StatefulWidget> createState() {
    return ModalBottom(fun: fun, isVisbled: isVisbled,value: value, type: type);
  }
}

class ModalBottom extends State<ModalBotomm>{
  Function fun;
  bool isVisbled;
  String value;
  String type;
  TextEditingController textEditingController = TextEditingController();
  ModalBottom({
    required this.fun,
    required this.isVisbled,
    required this.value,
    required this.type
  });
  int id = 0;

  void handleInput(){
    fun(textEditingController.text);
    setState(() {
      isVisbled = !isVisbled;
    });
  }
  void handleEdit(){
    fun(textEditingController.text);
    setState(() {
      isVisbled = !isVisbled;
    });
  }
  @override
  Widget build(BuildContext context) {
    textEditingController.text = value;
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
                  onChanged: (text) => textEditingController.text = text,
                  controller: textEditingController,
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
                        if(type=="CREATE"){
                          handleInput();
                        }else if(type=="EDIT"){
                          handleEdit();
                        }
                      },
                      child: Text(type=="CREATE"?"Add Jobs":type=="EDIT"?"Chinh Sua":"")),
                )

              ],
            ),
          ),
        )
    );

  }

}
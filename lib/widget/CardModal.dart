import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModalBottom extends StatelessWidget{
  ModalBottom({Key?key, required this.fun}):super(key: key);
  Function fun;
  void handleInput(){
      fun(value);
  }
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }

}
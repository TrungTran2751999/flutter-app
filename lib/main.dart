import 'package:app/widget/CardBody.dart';
import 'package:app/widget/CardModal.dart';
import 'package:flutter/material.dart';

import 'modal/DataItems.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyStart(),
  ));
}
class MyStart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyApp();
  }

}
class MyApp extends State<MyStart>{
  final List<DataItems> items = [];
  void addList(String name){
    setState(() {
      items.add(DataItems(DateTime.now().toString(), name));
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: const Center(
         child: Text(
             "Todo List",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
         ),
       ),
       backgroundColor: Colors.blue,
     ),
     body: SingleChildScrollView(
       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
       child: Column(
         children: items.map((item) => CartBody(item: item)).toList()
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         showModalBottomSheet(
             isScrollControlled: true,
             context: context,
             builder: (BuildContext context){
               return ModalBottom(fun: addList);
             }
         );
       },
       backgroundColor: Colors.blue,
       child: const Icon(
           Icons.add,
           size: 40,
           color: Colors.white,
       ),
     ),
   );

  }
}


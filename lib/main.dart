import 'package:app/util/dto/WorkController/WorkDTO.dart';
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
  late List<WorkDTO> items = [];
  void addList(String name){
    setState(() {
      // int index = items.isEmpty ? 0 :items.length-1;
      // items.add(DataItems(index, name));
    });
  }
  void removeItem(int id){
    setState(() {
      items.removeAt(id);
    });
    for(int i=0; i<items.length; i++){
      items[i].id = i;
    }
  }
  Future<List<WorkDTO>?>? _futureWorkList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureWorkList = WorkDTO.getAll();
  }
  @override
  Widget build(BuildContext context) {
    // WorkDTO.getAll().then((value) => items = value!);
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
       child: FutureBuilder(
           future: _futureWorkList,
           builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.waiting) {
               return const Center(
                 child: CircularProgressIndicator(),
               );
             } else if (snapshot.hasError) {
               return Center(
                 child: Text('Errorhhhh: ${snapshot.error}'),
               );
             } else if (snapshot.hasData){
               List<WorkDTO>? workList = snapshot.data;
               if(workList!=null){
                 return Column(
                     children: workList.map((item) => CartBody(item: item, fun: removeItem)).toList()
                 );
               }
             }
             return Center(
               child: Text('Errorvvvvv: ${snapshot.data}'),
             );
           })
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         showModalBottomSheet(
             isScrollControlled: true,
             context: context,
             builder: (BuildContext context){
               return ModalBotomm(fun: addList, isVisbled:true, value: "",type: "CREATE",);
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


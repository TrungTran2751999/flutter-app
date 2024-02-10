import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:app/widget/CardBody.dart';
import 'package:app/widget/CardModal.dart';
import 'package:app/widget/Detai.dart';
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
  Future<List<WorkDTO>?>? _futureWorkList;
  void addList(String name){
    final data = {
      "name": name
    };
    WorkDTO.create(data)
        .then(
            (value) =>
              setState(() {
                _futureWorkList = WorkDTO.getAll();
              })
        );
  }
  void removeItem(int id){
    WorkDTO.delete(id)
        .then((value) =>
          setState((){
            _futureWorkList = WorkDTO.getAll();
          })
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futureWorkList = WorkDTO.getAll();
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
                     children: workList.map((item) =>
                         GestureDetector(
                           onTap: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) => Detail(id:item)),
                             );
                           },
                           child: CartBody(item: item, fun: removeItem),
                         )
                     ).toList()
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


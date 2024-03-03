import 'package:app/util/Util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/dto/WorkController/WorkDTO.dart';
import 'CardBody.dart';
import 'CardModal.dart';
import 'Detai.dart';
class HomeView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}
class HomeViewState extends State<HomeView>{
  Future<List<WorkDTO>>? _futureWorkList;
  void removeItem(int id){
    WorkDTO.delete(id)
        .then((value) =>
        setState((){
          _futureWorkList = WorkDTO.getAll();
        })
    );
  }
  void addList(String name){
    final data = {
      "name": name
    };
    WorkDTO.create(data)
        .then(
            (value) =>
            setState(() {
              _futureWorkList = WorkDTO.getAll();
              // Util.sendNotficate("Thông báo", "${data['name']} đã được thêm vào");
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
    // TODO: implement build
    return Scaffold(
        body:
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                  }),
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
      )
    );
  }
  
}
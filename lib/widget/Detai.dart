import 'package:app/util/dto/WorkController/WorkDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget{
  Detail({
    Key? key,
    required this.id
  }):super(key: key);
  WorkDTO id;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return DetailState(id:id);
  }

}
class DetailState extends State<Detail>{
  DetailState({
    required this.id,
  });
  WorkDTO id;
  Future<WorkDTO?>? _future;
  void initData(){
    setState((){
      _future = WorkDTO.getByDetail(id.id);
    });
  }
  @override
  Widget build(BuildContext context) {
    initData();
    // TODO: implement build
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
      body: FutureBuilder(
          future: _future,
          builder: (context, snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasError){
              return Center(
                child: Text('Errorhhhh: ${snapshot.error}'),
              );
            }else if(snapshot.hasData){
              WorkDTO? result = snapshot.data;
              return Center(
                child: Text(
                  result!.name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 25
                  ),
                ),
              );
            }
            return const Center(
              child: Text(
                "404",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 25
                ),
              ),
            );
          }
      )
    );

  }

}
import 'dart:convert';

import 'package:app/util/StringUtil.dart';
import 'package:http/http.dart' as http;

class WorkDTO{
  late int id;
  late String name;
  WorkDTO({required this.id, required this.name});
  static WorkDTO convertJSON(Map<String, dynamic> json){
    return WorkDTO(
        id: json["id"],
        name: json["name"]
    );
  }
  static Future<List<WorkDTO>> getAll() async{
    var url = Uri.parse(StringUtil.GET_ALL_WORK);
    var response = await http.get(url);
    if(response.statusCode==200){
      var data = response.body;
      List<dynamic> jsonResult = json.decode(data);
      List<WorkDTO> listResult = jsonResult.map((work) => convertJSON(work)).toList();
      return listResult;
    }else{
      return [];
    }
  }
}
import 'dart:convert';

import 'package:app/util/StringUtil.dart';
import 'package:http/http.dart' as http;

class WorkDTO{
  late int id;
  late String name;
  static String result = "";
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
  static Future<WorkDTO?> getByDetail(int id) async{
    var url = Uri.parse("${StringUtil.GET_DETAIL}?id=$id");
    var response = await http.get(url);
    if(response.statusCode==200){
      var data = response.body;
      WorkDTO result = convertJSON(json.decode(data));
      return result;
    }else{
      return null;
    }
  }
  static Future<String> create(Map<String, dynamic> data) async{
    var url = Uri.parse(StringUtil.GET_ALL_WORK);
    var datas = jsonEncode(data);
    var headers = {
      'Content-Type': 'application/json'
    };
    var response = await http.post(url, body: datas, headers: headers);
    if(response.statusCode==200){
      return "SUCCESS";
    }else{
      return "FAIL";
    }
  }
  static Future<String> update(Map<String, dynamic> data) async{
    var url = Uri.parse(StringUtil.UPDATE);
    var datas = jsonEncode(data);
    var headers = {
      'Content-Type': 'application/json'
    };
    var response = await http.post(url, body: datas, headers: headers);

    if(response.statusCode==200){
      return "SUCCESS";
    }else{
      return "FAIL";
    }
  }
  static Future<String> delete(int id) async{
    var url = Uri.parse("${StringUtil.DELETE}?id=$id");
    var response = await http.get(url);
    if(response.statusCode==200){
      return "SUCCESS";
    }else{
      return "FAIL";
    }
  }
}
import 'package:app/util/LoginUser.dart';
import 'package:app/util/StringUtil.dart';
import 'package:http/http.dart' as http;
class NetWork{
  static Future<bool> login(Map<String, dynamic> data, String token)async{
    var url = Uri.parse(StringUtil.LOGIN);
    var response = await http.post(url,body: data);
    LoginUser.deviceToken = token;
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }
  static Future<String> register(Map<String, dynamic> data)async{
    var url = Uri.parse(StringUtil.REGISTER);
    var response = await http.post(url,body: data);
    if(response.statusCode==200){
      return "Success";
    }else{
      return response.body;
    }
  }

}
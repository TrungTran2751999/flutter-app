class LoginUser{
  static late int id;
  static late String userName;
  static late String name;
  static late String deviceToken;
  static setInfo(int id, String userName, String name, String deviceToken){
    LoginUser.id = id;
    LoginUser.userName = userName;
    LoginUser.name = name;
    LoginUser.deviceToken = deviceToken;
  }
}
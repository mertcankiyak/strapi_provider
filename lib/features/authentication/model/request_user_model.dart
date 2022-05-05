import 'package:vexana/vexana.dart';

class RequestUserModel extends INetworkModel{

  RequestUserModel({required this.email, required this.password});


  String? email;
  String? password;

  @override
  fromJson(Map<String, dynamic> json) {
    email = json["email"];
    password = json["password"];
  }

  @override
  Map<String, dynamic>? toJson() {
    return {
      "identifier" : email,
      "password" : password
    };
  }


}
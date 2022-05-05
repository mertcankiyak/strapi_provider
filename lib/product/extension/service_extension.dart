import 'package:strapi_provider/product/enum/service_enum.dart';

extension ServiceExtension on ServiceEnum{

  String rawValue(){
    switch(this){
      case ServiceEnum.BASEURL :
        return "http://192.168.1.5:1337";
      case ServiceEnum.LOGINPATH :
        return "/api/auth/local";
    }
  }
}
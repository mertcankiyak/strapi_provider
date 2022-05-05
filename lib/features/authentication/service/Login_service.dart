import 'package:flutter/material.dart';
import 'package:strapi_provider/features/authentication/model/request_user_model.dart';
import 'package:strapi_provider/features/authentication/model/response_user_model.dart';
import 'package:strapi_provider/features/authentication/service/ILogin_Service.dart';
import 'package:strapi_provider/product/enum/service_enum.dart';
import 'package:vexana/vexana.dart';
import 'package:strapi_provider/product/extension/service_extension.dart';

class LoginService extends ILoginService {
  final NetworkManager _networkManager = NetworkManager(
      options: BaseOptions(baseUrl: ServiceEnum.BASEURL.rawValue()));

  @override
  Future<ResponseUserModel?> login({required RequestUserModel requestUserModel}) async {
    final response = await _networkManager.send<ResponseUserModel, ResponseUserModel>(
        ServiceEnum.LOGINPATH.rawValue(),
        parseModel: ResponseUserModel(),
        data: requestUserModel.toJson(),
        method: RequestType.POST);
    return response.data;
  }
}



import 'package:strapi_provider/features/authentication/model/request_user_model.dart';
import 'package:strapi_provider/features/authentication/model/response_user_model.dart';

abstract class ILoginService{
  Future<ResponseUserModel?> login({required RequestUserModel requestUserModel});
}
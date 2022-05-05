import 'package:flutter/cupertino.dart';
import 'package:strapi_provider/features/authentication/model/request_user_model.dart';
import 'package:strapi_provider/features/authentication/model/response_user_model.dart';
import 'package:strapi_provider/features/authentication/service/Login_service.dart';
import 'package:strapi_provider/features/authentication/viewmodel/ILogin_viewmodel.dart';
import 'package:strapi_provider/product/locator.dart';

enum LoginStatus { LoginInit, LoginSuccess, LoginLoading, LoginError }

class LoginViewModel with ChangeNotifier implements ILoginViewModel {
  final LoginService _loginService = locator<LoginService>();
  LoginStatus _loginStatus = LoginStatus.LoginInit;

  LoginStatus get loginStatus => _loginStatus;

  set loginStatus(LoginStatus value) {
    _loginStatus = value;
    notifyListeners();
  }

  String? _loginErrorText;

  String? get loginErrorText => _loginErrorText;

  set loginErrorText(String? value){
    _loginErrorText = value;
    notifyListeners();
  }

  ResponseUserModel? _responseUserModel;

  ResponseUserModel? get responseUserModel => _responseUserModel;

  set responseUserModel(ResponseUserModel? value){
    _responseUserModel = value;
    notifyListeners();
  }

  @override
  Future<ResponseUserModel?> login(
      {required RequestUserModel requestUserModel}) async {
    try {
      loginStatus = LoginStatus.LoginLoading;
      responseUserModel = await _loginService.login(requestUserModel: requestUserModel);
      if(responseUserModel != null && responseUserModel?.jwt != null){
        loginStatus = LoginStatus.LoginSuccess;
        return responseUserModel;
      }else{
        loginStatus = LoginStatus.LoginError;
        loginErrorText = "Please try again";
      }
    } catch (e) {
      loginStatus = LoginStatus.LoginError;
      loginErrorText = "Login Error: "+e.toString();
    }
  }
}

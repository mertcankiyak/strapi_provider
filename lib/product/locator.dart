
import 'package:get_it/get_it.dart';
import 'package:strapi_provider/features/authentication/service/Login_service.dart';

final locator = GetIt.asNewInstance();

void setupLocator(){
  locator.registerLazySingleton(() => LoginService());
}
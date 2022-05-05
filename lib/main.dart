import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strapi_provider/features/authentication/view/login_view.dart';
import 'package:strapi_provider/features/authentication/viewmodel/login_viewmodel.dart';
import 'package:strapi_provider/features/home/view/home_view.dart';
import 'package:strapi_provider/product/locator.dart';
import 'package:strapi_provider/product/state/login/login_states.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Provider & Strapi',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer(
        builder: (BuildContext context, LoginViewModel userModel, _) {
          switch (userModel.loginStatus) {
            case LoginStatus.LoginInit:
              return LoginView();
            case LoginStatus.LoginSuccess:
              return HomeView(responseUserModel: userModel.responseUserModel,);
            case LoginStatus.LoginError:
              return LoginError();
            case LoginStatus.LoginLoading:
              return LoadingView();
            default:
              return Container();
          }
        },
      ),
    );
  }
}



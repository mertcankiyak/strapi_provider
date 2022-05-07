import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strapi_provider/features/authentication/model/response_user_model.dart';
import 'package:strapi_provider/features/authentication/viewmodel/login_viewmodel.dart';
import 'package:strapi_provider/product/constants/string_constants.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key, this.responseUserModel}) : super(key: key);
  ResponseUserModel? responseUserModel;

  @override
  Widget build(BuildContext context) {
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF56969),
        elevation: 0,
        title: Text("Home Page"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(

              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.green,child: Icon(Icons.check),),
                subtitle:  Text("Token: "+(responseUserModel?.jwt ?? "")),
                title: Text("User ID: "+(responseUserModel?.user?.id.toString() ?? "")),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.07),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
                onPressed: () async {
                  _loginViewModel.loginStatus = LoginStatus.LoginInit;
                },
                child: Text(signOut)),
          ),
        ],
      ),
    );
  }
}

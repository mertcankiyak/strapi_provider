import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strapi_provider/features/authentication/viewmodel/login_viewmodel.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class LoginError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF56969),
        elevation: 0,
        title: Text("Error Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("You made an incomplete or incorrect entry. Please try logging in again.", style: Theme.of(context).textTheme.headline6, textAlign: TextAlign.center,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(  style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07),
                ),
                backgroundColor:
                MaterialStateProperty.all(Colors.redAccent)),onPressed: () {
              _loginViewModel.loginStatus = LoginStatus.LoginInit;
            }, child: Text("Try Login")),
          )
        ],
      ),
    );
  }
}
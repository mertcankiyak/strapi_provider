import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strapi_provider/features/authentication/model/request_user_model.dart';
import 'package:strapi_provider/features/authentication/model/response_user_model.dart';
import 'package:strapi_provider/features/authentication/viewmodel/login_viewmodel.dart';
import 'package:strapi_provider/product/constants/string_constants.dart';
import 'package:strapi_provider/product/mixin/form_validator.dart';

class LoginView extends StatelessWidget with FormValidate {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final _loginViewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: emailValidation,
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: emailText,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: passwordControl,
                  controller: _passwordController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: passwordText),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width,
                              MediaQuery.of(context).size.height * 0.07),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black45)),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                       ResponseUserModel? gelenVeri = await _loginViewModel.login(
                          requestUserModel: RequestUserModel(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          ),
                        );
                      }
                    },
                    child: Text(logIn)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

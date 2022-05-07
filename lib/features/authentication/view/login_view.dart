import 'dart:ui';

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
      backgroundColor: Color(0xFFEBE9F3),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildWelcome(context),
                  buildEmailText(),
                  buildPasswordText(),
                  buildLoginButton(context, _loginViewModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildWelcome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Welcome",
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Padding buildEmailText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: TextFormField(
          style: TextStyle(fontSize: 18),
          validator: emailValidation,
          controller: _emailController,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(24),
              border: InputBorder.none,
              hintText: emailText),
        ),
      ),
    );
  }

  Padding buildPasswordText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: TextFormField(
          obscureText: true,
          style: TextStyle(fontSize: 18),
          validator: passwordControl,
          controller: _passwordController,
          decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(24),
              border: InputBorder.none,
              hintText: passwordText),
        ),
      ),
    );
  }

  Padding buildLoginButton(
      BuildContext context, LoginViewModel _loginViewModel) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.height * 0.08),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: Colors.red))),
              backgroundColor: MaterialStateProperty.all(Color(0xFFF56969))),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              _loginViewModel.login(
                requestUserModel: RequestUserModel(
                  email: _emailController.text.trim(),
                  password: _passwordController.text.trim(),
                ),
              );
            }
          },
          child: Text(
            logIn,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
          )),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginController {

  BuildContext? context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  Future? init(BuildContext context){
    this.context = context;
  }

  registerPageRedi (BuildContext context) async {
    await Future.delayed(Duration(seconds: 1), () {
      Navigator.pushNamed(
          context,
          'register'
      );
    });
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (kDebugMode) {
      print('Email: $email Contraseña: $password');
    }
  }
}

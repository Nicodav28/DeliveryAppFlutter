import 'package:flutter/material.dart';

class LoginController {

  BuildContext? context;

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
}

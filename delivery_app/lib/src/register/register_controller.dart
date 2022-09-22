import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterController{

  BuildContext? context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController passConfirmController = new TextEditingController();

  Future? init(BuildContext context){
    this.context = context;
  }

  loginPageRedi (BuildContext context){
    Navigator.pushNamed(
        context,
        'login'
    );
  }

  void register(){
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirmation = passConfirmController.text.trim();

    if (kDebugMode) {
      print('Email: $email ---- Nombre: $name ---- Apellido: $lastName ---- Telefono: $phone Contraseña: $password ---- Confirmacion Contraseña: $passwordConfirmation');
    }
  }
}
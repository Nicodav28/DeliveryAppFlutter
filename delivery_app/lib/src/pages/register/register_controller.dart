import 'package:delivery_app/src/models/response_api.dart';
import 'package:delivery_app/src/models/user.dart';
import 'package:delivery_app/src/provider/users_provider.dart';
import 'package:delivery_app/src/utils/my_snackbar.dart';
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

  UsersProvider usersProvider = new UsersProvider();

  Future? init(BuildContext context){
    this.context = context;
    usersProvider.init(context);
  }

  loginPageRedi (BuildContext context){
    Navigator.pushNamed(
        context,
        'login'
    );
  }

  void register() async{
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text.trim();
    String password = passwordController.text.trim();
    String passwordConfirmation = passConfirmController.text.trim();

    if(email.isEmpty || name.isEmpty || password.isEmpty || passwordConfirmation.isEmpty){
        MySnackbar.show(context!, 'Todos los campos deben ser diligenciados');
        return;
    }

    if(password != passwordConfirmation){
      MySnackbar.show(context!, 'Las contraseñas no coinciden, por favor verificalas e ingresalas nuevamente');
      return;
    }

    if(password.length < 6){
      MySnackbar.show(context!, 'La contraseña debe contener al menos 6 caracteres');
      return;
    }

    User user = User(
      email: email,
      namer: name,
      lastname: lastName,
      phone: phone,
      password: password
    );

    ResponseApi responseApi = await usersProvider.create(user);

    MySnackbar.show(context!, responseApi.message!);

    if (kDebugMode) {
      print('Email: $email ---- Nombre: $name ---- Apellido: $lastName ---- Telefono: $phone Contraseña: $password ---- Confirmacion Contraseña: $passwordConfirmation');
    }
  }
}
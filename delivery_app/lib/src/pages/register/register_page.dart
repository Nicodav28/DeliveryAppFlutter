
import 'package:delivery_app/src/pages/register/register_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

RegisterController _registerController = new RegisterController();

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _registerController.init(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
                top: -80,
                left: -100,
                child: _circleLoginSvg()
            ),
            Positioned(
                top: 65,
                left: 27,
                child: _registerText()
            ),
            Positioned(
                top: 51,
                left: -5,
                child: _iconButton()
            ),
            Container(
              margin: EdgeInsets.only(top: 150),
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _userProfileImage(),
                    const SizedBox(height: 30),
                    _emailTextField(),
                    _emailTextName(),
                    _emailTextLastName(),
                    _emailTextPhone(),
                    _emailTextPassword(),
                    _emailTextPasswordConfirmation(),
                    _registerButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _userProfileImage(){
    return const CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey200,
    );
  }

  Widget _circleLoginSvg(){
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor
      ),
    );
  }

  Widget _iconButton() {
    return IconButton(
        onPressed: () => _registerController.loginPageRedi(context),
        icon: const Icon(Icons.arrow_back_ios, color: Colors.white)
    );
  }

  Widget _registerText(){
    return const Text(
      'REGISTRO',
      style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'NimbusSans'
      ),
    );
  }

  Widget _emailTextField(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo Electronico',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.email, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDark
          ),
        ),
      ),
    );
  }

  Widget _emailTextName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _registerController.nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDark
          ),
        ),
      ),
    );
  }

  Widget _emailTextLastName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _registerController.lastNameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: 'Apellido',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person_outline, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDark
          ),
        ),
      ),
    );
  }

  Widget _emailTextPhone(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _registerController.phoneController,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          hintText: 'Telefono',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.phone, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDark
          ),
        ),
      ),
    );
  }

  Widget _emailTextPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _registerController.passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDark
          ),
        ),
      ),
    );
  }

  Widget _emailTextPasswordConfirmation(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)
      ),
      child: TextField(
        controller: _registerController.passConfirmController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        decoration: InputDecoration(
          hintText: 'Confirmar Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.lock_outline, color: MyColors.primaryColor),
          hintStyle: TextStyle(
              color: MyColors.primaryColorDark
          ),
        ),
      ),
    );
  }



  Widget _registerButton(){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: _registerController.register,
        child: Text('REGISTRARME'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
            ),
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
      ),
    );
  }
}
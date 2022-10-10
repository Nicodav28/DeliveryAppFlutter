import 'package:delivery_app/src/pages/login/login_controller.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';

LoginController _loginController = new LoginController();

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  void initState() {//Primer metodo que se ejecuta cuando inicial el App
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {//Inicializa controladores
        _loginController.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {//Se ejecuta por cada HotReload
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
                top: 60,
                left: 25,
                child: _loginText()
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      // _imageBanner(context),
                      _animateBanner(context),
                      _emailTextField(),
                      _passTextField(),
                      _loginButton(),
                      _rowElement(context)
                    ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

Widget _imageBanner(BuildContext context) {

  return Container(
    margin: EdgeInsets.only(
        top: 100,
        bottom: MediaQuery.of(context).size.height * 0.22
    ),
    child: Image.asset(
      'assets/img/delivery.png',
      width: 200,
      height: 200,
    ),
  );
}

Widget _animateBanner(BuildContext context){
  return Container(
    margin: EdgeInsets.only(
        top: 155,
        bottom: MediaQuery.of(context).size.height * 0.15
    ),
    child: Lottie.asset(
        'assets/json/delivery.json',
        width: 350,
        height: 200,
        fit: BoxFit.fill
    ),
  );
}

Widget _emailTextField(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
    ),
    child: TextField(
      controller: _loginController.emailController,
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

Widget _passTextField(){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
    decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30)
    ),
    child: TextField(
      controller: _loginController.passwordController,
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

Widget _loginButton(){
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
    child: ElevatedButton(
      onPressed: _loginController.login,
      child: Text('INGRESAR'),
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

Widget _loginText(){
  return Text(
    'LOGIN',
    style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
        fontFamily: 'NimbusSans'
    ),
  );
}

Widget _rowElement(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'No tienes Cuenta?',
        style: TextStyle(
            color: MyColors.primaryColor
        ),
      ),
      const SizedBox(width: 7,),
      GestureDetector(
        onTap: () => _loginController.registerPageRedi(context),
        child: Text(
            'Registrate',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: MyColors.primaryColor
            )
        ),
      )
    ],
  );
}

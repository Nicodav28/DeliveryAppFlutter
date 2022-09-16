// import 'package:flutter/cupertino.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
                'assets/img/delivery.png',
              width: 200,
              height: 200,
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Correo Electronico'
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: 'Contraseña'
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Text('INGRESAR')
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'No tienes Cuenta?',
                    style: TextStyle(
                      color: MyColors.primaryColor
                    ),
                ),
                const SizedBox(width: 7,),
                Text(
                  'Registrate',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: MyColors.primaryColor
                  )
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}

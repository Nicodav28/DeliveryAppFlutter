import 'package:delivery_app/src/pages/login/login_page.dart';
import 'package:delivery_app/src/pages/register/register_page.dart';
import 'package:delivery_app/src/utils/my_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => const LoginPage(),
        'register' : (BuildContext context) => const RegisterPage()
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: MyColors.primaryColor),
          scaffoldBackgroundColor: const Color(0xFFFFFFFF),
          // fontFamily: 'NimbusSans',
          primaryColor: MyColors.primaryColor
      ),
    );
  }
}
import 'package:chat_app/screen/login_screen.dart';
import 'package:chat_app/screen/register_screen.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //initially , show login page
  bool showLoginPage = true;

  //toggle between login and register page
  void  tooglePages(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if(showLoginPage){
      return loginScreen(
        onTap: tooglePages,
      );
    }else {
      return RegisterScreen(
        onTap: tooglePages,
      );
    }
  }
}



import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textField.dart';
import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class loginScreen extends StatelessWidget {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  //tap to go register page

  final void Function()? onTap;

  loginScreen({super.key,
    required this.onTap
  });


  void login(BuildContext context) async{
    //auth service
    final  authService = AuthService();

    //try login

    try{

      await authService.signInWithEmailPassword(_emailController.text, _passWordController.text);
    }
   //catch any errors
   catch(e){
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
          title: Text(e.toString()),
      ),);
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .background,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Icon(Icons.message,
                size: 100,
                color: Theme.of(context).primaryColor
              ),
              SizedBox(height: 20,),
        
              //welcome back messange
              Text('Welcome Back!',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  )
              ),
              SizedBox(height: 30,),
        
              //email textfield
              MyTextField(
                controller: _emailController,
                hintText: 'Enter Email',
                obscureText: false,
        
              ),
              SizedBox(
                height: 10,
              ),
        
              // pw textfield
              MyTextField(
                controller: _passWordController,
                hintText: 'Enter Password',
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
        
              //login button
              MyButton(
                text: 'Login',
                onTap: () => login(context),
        
              ),
        
              SizedBox(
                height: 25,
              ),
        
        
              //register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not an Account? ',
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontSize: 20),
        
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text('Register now',style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,fontSize: 20)),
                  ),
                ],
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}



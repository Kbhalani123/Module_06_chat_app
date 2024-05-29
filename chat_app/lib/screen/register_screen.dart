import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textField.dart';
import '../services/auth/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _CpassWordController = TextEditingController();

  // Tap to go login screen
  final void Function()? onTap;

  RegisterScreen({super.key, required this.onTap});

  void register(BuildContext context) async {
    // Get auth service
    final _auth = AuthService();

    if (_passWordController.text == _CpassWordController.text) {
      try {
        await _auth.signUpWithEmailPassword(
            _emailController.text, _passWordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Alert!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25)),
          content: Text("Password don't match",style: TextStyle(fontSize: 15)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Icon(
                Icons.message,
                size: 100,
                color: Colors.blue.shade500,
              ),
              SizedBox(height: 30),

              // Welcome message
              Text(
                "Let's create an account",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 30),

              // Email text field
              MyTextField(
                controller: _emailController,
                hintText: 'Enter Email',
                obscureText: false,
              ),
              SizedBox(height: 10),

              // Password text field
              MyTextField(
                controller: _passWordController,
                hintText: 'Enter Password',
                obscureText: true,
              ),
              SizedBox(height: 10),

              // Confirm password text field
              MyTextField(
                controller: _CpassWordController,
                hintText: 'Enter Confirm Password',
                obscureText: true,
              ),
              SizedBox(height: 20),

              // Register button
              MyButton(
                text: 'Register',
                onTap: () => register(context),
              ),
              SizedBox(height: 25),

              // Login now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Theme.of(context).colorScheme.tertiary,fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      'Login now',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,fontSize:20),
                    ),
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

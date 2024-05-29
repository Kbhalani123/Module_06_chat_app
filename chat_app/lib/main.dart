
import 'package:chat_app/services/auth/auth_gate.dart';
import 'package:chat_app/themes/themes_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: 'AIzaSyBnUzvk6k8yg8xqUyFF4Vha6Lcoc2rI8gY',
      appId: '1:388306975810:android:e1a68fc47aadc2f972c1db',
      messagingSenderId: '388306975810',
      projectId: 'chating-app-29088',
      storageBucket: 'chating-app-29088.appspot.com'
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode,
    );
  }
}

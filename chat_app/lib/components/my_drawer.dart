import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(){
  final auth = AuthService();
  auth.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[ Column(
          children: [
            //logo
            DrawerHeader(
                child: Center(
                  child: Icon(Icons.message,color: Theme.of(context).primaryColor,size: 70),
                )),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: ListTile(
                title: const Text('H  O  M  E',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                leading: const Icon(Icons.home,color: Colors.black),
                onTap: (){
                  //pop the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: ListTile(
                title: const Text('L O G  O U T',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                leading: const Icon(Icons.logout,color: Colors.black),
                onTap: logout,
              ),
            ),



            //home list
          ],
        ),
    ]
      ),
    );
  }
}

import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/screen/chat_screen.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:flutter/material.dart';

import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';


class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  //chat  & auth service
  final ChatSerivce _chatSerivce = ChatSerivce();
  final AuthService _authService = AuthService();


  void  logout(){
    //get auth service
    final _auth  = AuthService();
     _auth.signOut();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor:  Theme.of(context).colorScheme.primary,
      title: const Text('Home',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30)),

      ),

      drawer: const MyDrawer(),
      body:  _buildUserList(),
    );
  }

  //build a list of user except for the current  logged  in user
Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatSerivce.getUserStream(),
      builder:(context, snapshot) {
        //error
      if(snapshot.hasError){
        return const Text('Error');

      }
        //loading...
      if(snapshot.connectionState == ConnectionState.waiting){
        return const Text('Loading...');
      }
        //return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );

}
// build individual list tile for user
Widget _buildUserListItem(Map<String,dynamic> userData, BuildContext context){
    // display  all user except  current user
  if(userData['email'] != _authService.getCurrentUser()!.email){
    return UserTile(

      email: userData['email'],
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen(
          receiverEmail: userData['email'],
          receiverID: userData['uid'],

        ),));
      },
    );
  }else{
    return Container();
  }
  }
}




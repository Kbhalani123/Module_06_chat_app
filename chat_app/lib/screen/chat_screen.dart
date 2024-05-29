

import 'package:chat_app/components/chat_layer.dart';
import 'package:chat_app/components/my_textField.dart';
import 'package:chat_app/services/auth/auth_service.dart';
import 'package:chat_app/services/chat/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

   ChatScreen({
    super.key,
    required this.receiverEmail,
    required this.receiverID

  });
  //text controller
  final TextEditingController _messageController = TextEditingController();

  //chat and auth serivces
  final ChatSerivce _chatSerivce = ChatSerivce();
  final AuthService _authService = AuthService();

  //send message

  void sendMessage() async {
    //if there  is something inside  the textfield
  if(_messageController.text.isNotEmpty){
    //send the message
    await _chatSerivce.sendMessage(receiverID, _messageController.text);

    //clear text controller
    _messageController.clear();
  }

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: Text(receiverEmail,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
           children: [
             //diplay all message
             Expanded(child: _buildMessageList()),
             //user input
             _buildUserInput(),

           ],
        ),
      )
    );
  }

  //build message list
Widget _buildMessageList(){
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatSerivce.getMessage(receiverID, senderID),
        builder: (context, snapshot) {
          //error
          if(snapshot.hasError){
            return Text('Errors..');
          }
          //loading
          if(snapshot.connectionState == ConnectionState.waiting){
            return Text('Loading..');
          }
          //return list view
          return ListView(
            children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
          );



        },);
}
//build message item
Widget _buildMessageItem(DocumentSnapshot doc){
    Map<String, dynamic> data  = doc.data() as Map<String, dynamic>;
    // is current user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;



    //align message to the right if sender is  the current user, otherwise
    var alignment;
    if (isCurrentUser) {
      alignment = Alignment.centerRight;
    } else {
      alignment = Alignment.centerLeft;
    }



    return Container(
      alignment: alignment,
        child: Column(
          crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [

            ChatLayer(message: data['message'], isCurrentUser: isCurrentUser)
          ],
        ));
}

//build message input
Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          //textfield should take up the space
          Expanded(
            child: MyTextField(
              controller: _messageController,
              hintText: 'Send a Chat',
              obscureText: false,

            ),
          ),
          //send button
          CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25,
              child: IconButton(onPressed: sendMessage, icon: Icon(Icons.send,size: 25,color: Colors.black,)))
        ],
      ),
    );
}


}

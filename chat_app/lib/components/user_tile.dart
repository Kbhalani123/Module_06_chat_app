import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String email;
  final void Function()? onTap;


  const UserTile({
    super.key,
    required this.email,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
           color: Colors.blue.shade200,
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            //icon
            Icon(Icons.person,size: 26),
            SizedBox(width: 15,),
            //user name 
            Text(email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

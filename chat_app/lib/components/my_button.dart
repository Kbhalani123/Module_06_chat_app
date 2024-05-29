import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final String text;
  final void Function()? onTap;

  const MyButton ({
    super.key,
    required this.text,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(8)
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Center(
            child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),)),
      ),
    );
  }
}

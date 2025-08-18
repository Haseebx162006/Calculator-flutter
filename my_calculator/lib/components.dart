import 'package:flutter/material.dart';
class Mybutton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onpress;
  const Mybutton({super.key,required this.title,this.color=const Color(0xffa5a5a5),
  required this.onpress
  });
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 10),
        child: InkWell(
          onTap: onpress,
          child: Container(
            height: 74,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            width: 80,
            child: Center(
              child: Text(title,style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
        ),
      ),

    );
  }
}

import 'package:flutter/material.dart';

class ButtonTabBar extends StatelessWidget {
  ButtonTabBar({super.key, required this.text,required this.isSelected});
  String text;
  bool isSelected;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isSelected ?const Color(0xffFD4556) : Colors.transparent,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Text(text,style:const TextStyle(color: Colors.white,fontSize: 14)),
    );
  }
}

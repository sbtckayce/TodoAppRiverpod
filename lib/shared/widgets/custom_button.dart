

import 'package:flutter/material.dart';

import '../../theme/pallete.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onPressed, required this.bgButton, this.fontSize=20, 
   this.colorText= Pallete.whiteColor});
  final String text;
  final Function()? onPressed;
  final Color bgButton;
  final Color colorText;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          
        ),padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10)
      ),
      onPressed: onPressed, child: Text(text,style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: fontSize,color: colorText,)));
  }
}
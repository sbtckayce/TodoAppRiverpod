import 'package:flutter/material.dart';

import '../../theme/pallete.dart';


class BuildTextFormField extends StatelessWidget {
  const BuildTextFormField(
      {super.key,
      required this.text,
      required this.hintText,
      required this.controller, this.ontap,
    });
  final String text;
  final String hintText;
  final TextEditingController controller;
  final Function()? ontap;
 
 
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Pallete.blackColor,fontSize: 20,fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
         
          
          controller: controller,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 16,
              color: Pallete.blackColor,
              letterSpacing: 2,
              ),
              onTap: ontap,
             
          decoration: InputDecoration(
            
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Pallete.blackColor,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                letterSpacing: 2,
                ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Pallete.blueColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Pallete.blueColor)),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../theme/pallete.dart';


class BuildDateTimeField extends StatelessWidget {
  const BuildDateTimeField(
      {super.key,
      required this.text,
    
      required this.controller, this.ontap, this.readOnly=true, required this.suffixIcon,
    });
  final String text;
 
  final TextEditingController controller;
  final Function()? ontap;
  final bool? readOnly;
  final Widget suffixIcon;
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
          readOnly: readOnly!,
          
          controller: controller,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              color: Pallete.blackColor,
              letterSpacing: 2,
              ),
              onTap: ontap,
             
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
           
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

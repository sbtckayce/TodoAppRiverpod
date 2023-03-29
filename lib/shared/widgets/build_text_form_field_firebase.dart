import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_riverpod/theme/pallete.dart';

class BuildTextFormFieldFirebase extends StatelessWidget {
  const BuildTextFormFieldFirebase(
      {super.key,
      required this.title,
      required this.hintText,
      this.controller,
      this.widget,
      this.readOnly = false});
  final String title;
  final String hintText;
  final TextEditingController? controller;
  final Widget? widget;
  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
              textStyle:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(width: 1, color: Pallete.blueFrColor)),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller,
                  readOnly: readOnly!,
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                     
                      hintText: hintText,
                      enabledBorder:const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0)),
                      focusedBorder:const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 0))),
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    )
            ],
          ),
        )
      ],
    );
  }
}

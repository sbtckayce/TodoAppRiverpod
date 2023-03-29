import 'package:flutter/material.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.errorText});
  final Object errorText;
  @override
  Widget build(BuildContext context) {
    return Text(errorText.toString());
  }
}
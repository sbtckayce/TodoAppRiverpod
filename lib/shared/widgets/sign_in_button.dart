
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feature/auth/controller/auth_controller.dart';
import '../../theme/pallete.dart';

class SignInButton extends ConsumerWidget {
  const SignInButton({super.key});
 void signInWithGoogle(BuildContext context, WidgetRef ref) {
     ref.read(authControllerProvider.notifier).signInWithGoogle(context);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
              backgroundColor: Pallete.blueFrColor,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
      onPressed: (){
        signInWithGoogle(context, ref);
    }, icon: Image.asset('assets/images/google.png',width: 30,),
     label:  Text('Continue with Google',style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Pallete.whiteColor),));
  }
}
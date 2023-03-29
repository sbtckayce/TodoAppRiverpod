import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_riverpod/feature/auth/controller/auth_controller.dart';
import 'package:todo_riverpod/shared/widgets/sign_in_button.dart';

import '../../../provider/connective_provider.dart';
import '../../../shared/widgets/widgets.dart';
import 'package:sqflite/sqflite.dart' as sql;

import '../../../theme/pallete.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void navigateToTaskFirebase(BuildContext context) {
    Routemaster.of(context).push('/task-firebase');
  }

  void navigateToTaskSqilte(BuildContext context) {
    Routemaster.of(context).push('/task-sqlite');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);

    return Scaffold(
        backgroundColor: Pallete.whiteFrColor,
        appBar: AppBar(
          backgroundColor: Pallete.whiteFrColor,
          title: Text(
            'TODO',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Pallete.blueFrColor, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/splash.png'))),
                      ),
                      const Spacer(),

                      Text(
                        'Welcome to TODO',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Pallete.blackFrColor,fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),

                      Text(
                        'App will helps you to stay organized and perform your tasks much faster.',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Pallete.blueFrColor,fontSize: 20),
                      ),
                      const Spacer(),
                      isLoading ? const LoadingCircle() : const SignInButton()
                    ],
                  ),
                ))));
  }
}

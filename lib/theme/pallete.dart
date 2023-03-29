import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Pallete {
  // sqlite
  static const greenColor = Color(0xFFCFF5DA);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF222222);
  static const pinkColor = Color(0xFFE94848);
  static const blueColor = Color(0xFF1593AF);
  static const greyColor = Color(0xFFD9D9D9);
  static const amberColor = Color(0xFFC1CC41);
  static const purpleColor = Color(0xFFA18AFF);
  static const googleButtonColor = Color.fromRGBO(26, 39, 45, 1);
  static const changeGreenColor = Color(0xFFB8C8B5);
  static const changeAmberColor = Color(0xFFD3CEA9);
  static const changePinkColor = Color(0xFFCDB4B1);
  static const changePurpleColor = Color(0xFFC8BBCD);
  static const changeBlueColor = Color(0xFFA3B8C4);

  static const colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  // firebase
  static const blueFrColor = Color(0xFF92BAF5);
  static const whiteFrColor = Color(0xFFF5F8FC);
  static const blackFrColor = Color(0xFF1E1F1F);

static  const  redStatus = Color(0xFFf53b57);
static const  greenStatus = Color(0xFF0be881);
 static const  whiteStatus = Color(0xFFFFFFFF);

  // Themes
  TextTheme textTheme() {
    return const TextTheme(
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
      headlineMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
    );
  }

  // sqlite
  static var darkModeAppTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: whiteColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: blackColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
      ),
      brightness: Brightness.dark,
      switchTheme: const SwitchThemeData(
          trackColor: MaterialStatePropertyAll(whiteColor),
          thumbColor: MaterialStatePropertyAll(pinkColor)),
      dividerColor: blackColor,
      dialogTheme: const DialogTheme(backgroundColor: amberColor),
      textTheme: GoogleFonts.montserratTextTheme(Typography.blackRedmond),
      primaryColor: blackColor,
      checkboxTheme: const CheckboxThemeData(
          checkColor: MaterialStatePropertyAll(whiteColor),
          fillColor: MaterialStatePropertyAll(blackColor)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: pinkColor,
      ));

  static var lightModeAppTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: blackColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: whiteColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
      ),
      switchTheme: const SwitchThemeData(
          trackColor: MaterialStatePropertyAll(blackColor),
          thumbColor: MaterialStatePropertyAll(blueColor)),
      dividerColor: whiteColor,
      dialogTheme: const DialogTheme(backgroundColor: amberColor),
      checkboxTheme: const CheckboxThemeData(
          checkColor: MaterialStatePropertyAll(blackColor),
          fillColor: MaterialStatePropertyAll(whiteColor)),
      textTheme: GoogleFonts.montserratTextTheme(Typography.whiteRedmond),
      brightness: Brightness.light,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Pallete.blueColor,
      ));
}

enum EThemeMode { light, dark }

final themeProvider =
    StateNotifierProvider<ThemeProvider, ThemeData>((ref) => ThemeProvider());

class ThemeProvider extends StateNotifier<ThemeData> {
  EThemeMode _eThemeMode;
  ThemeProvider({EThemeMode eThemeMode = EThemeMode.dark})
      : _eThemeMode = eThemeMode,
        super(Pallete.darkModeAppTheme) {
    getTheme();
  }
  EThemeMode get eThemeMode => _eThemeMode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final theme = prefs.getString('theme');
    if (theme == 'light') {
      _eThemeMode = EThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _eThemeMode = EThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_eThemeMode == EThemeMode.light) {
      _eThemeMode = EThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    } else {
      _eThemeMode = EThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color.fromARGB(255, 245, 255, 255),
  primaryColor: Colors.red[600],
  fontFamily: "Poppins",
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ColorScheme.light(
    primary: Colors.red[600]!,
    secondary: Colors.black87,
    onSecondary: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black87,
    tertiary: Colors.white,
    tertiaryContainer: Color.fromARGB(255, 255, 255, 255),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF262626),
  primaryColor: Colors.red[600],
  fontFamily: "Poppins",
  textTheme: GoogleFonts.poppinsTextTheme().apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  colorScheme: ColorScheme.dark(
    primary: Colors.red[600]!,
    secondary: Colors.white,
    onSecondary: Colors.black,
    surface: Color(0xFF404040),
    onSurface: Colors.white,
    tertiary: Colors.white,
    tertiaryContainer: Color(0xFF404040),
  ),
);
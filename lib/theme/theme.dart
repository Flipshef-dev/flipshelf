import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
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
    tertiaryContainer: Color.fromARGB(255, 159, 159, 172),
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xFF232530),
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
    surface: Color(0xFF2A2A36),
    onSurface: Colors.white,
    tertiary: Colors.white,
    tertiaryContainer: Color(0xFF2A2D3E),
  ),
);
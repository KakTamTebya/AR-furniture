import 'package:flutter/material.dart';

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xFFD9D9D9),
  primaryColor: const Color(0xFF535353),
  colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF535353)),
  useMaterial3: true,
  hintColor: const Color(0xFF808080),
  appBarTheme: const AppBarTheme (
    centerTitle: true,
    backgroundColor: Color(0xFFD9D9D9),
    surfaceTintColor: Color(0xFFD9D9D9),
    titleTextStyle: TextStyle(
      color: Color(0xFF535353),
      fontWeight: FontWeight.w500,
      fontSize: 22.0,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF535353),
    selectedItemColor: Colors.white,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
  ),
);

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final lightTheme = FlexThemeData.light(
  colors:  FlexSchemeColor.from(
    brightness: Brightness.light,
    primary: Colors.black,
    secondary: Colors.grey,
    tertiary: Colors.white,
    primaryContainer: Colors.white,
    secondaryContainer: Colors.grey.shade300,
    tertiaryContainer: Colors.grey.shade400,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 15,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 25,
    ),
  ),
  background: const Color.fromRGBO(243, 242, 247, 1),
  appBarBackground: const Color.fromRGBO(243, 242, 247, 1),
  scheme: FlexScheme.blue,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  fontFamily: "Poppins",
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    tabBarIndicatorWeight: 10,
    tabBarIndicatorTopRadius: 6.5,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);

final darkTheme = FlexThemeData.dark(
  colors: FlexSchemeColor.from(
    brightness: Brightness.dark,
    primary: Colors.white,
    secondary: Colors.grey,
    tertiary: Colors.black,
    primaryContainer: Colors.grey.shade800,
    secondaryContainer: Colors.grey.shade600,
    tertiaryContainer: Colors.grey.shade700,
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      color: Colors.white,
      fontSize: 35,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 15,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 25,
    ),
  ),
  background: const Color.fromRGBO(28, 28, 30, 1),
  appBarBackground: const Color.fromRGBO(28, 28, 30, 1),
  scheme: FlexScheme.blue,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  fontFamily: "Poppins",
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
    tabBarItemSchemeColor: SchemeColor.onPrimary,
    tabBarUnselectedItemOpacity: 1.00,
    tabBarIndicatorWeight: 10,
    tabBarIndicatorTopRadius: 6.5,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);



import 'package:flex_color_scheme/flex_color_scheme.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.greyLaw,
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
  scheme: FlexScheme.greyLaw,
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
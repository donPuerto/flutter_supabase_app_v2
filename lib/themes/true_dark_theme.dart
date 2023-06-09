import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final trueBlackThemeScheme = FlexThemeData.dark(
  scheme: FlexScheme.brandBlue,
  appBarStyle: FlexAppBarStyle.material,
  appBarElevation: 4.0,
  bottomAppBarElevation: 8.0,
  tabBarStyle: FlexTabBarStyle.forAppBar,
  subThemesData: const FlexSubThemesData(
    interactionEffects: false,
    tintedDisabledControls: false,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    adaptiveElevationShadowsBack: FlexAdaptive.all(),
    adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),
    defaultRadius: 4.0,
    elevatedButtonSchemeColor: SchemeColor.onPrimary,
    elevatedButtonSecondarySchemeColor: SchemeColor.primary,
    inputDecoratorUnfocusedBorderIsColored: false,
    fabUseShape: true,
    fabAlwaysCircular: true,
    chipSchemeColor: SchemeColor.primary,
    chipRadius: 20.0,
    popupMenuElevation: 8.0,
    tooltipRadius: 4,
    dialogElevation: 24.0,
    // datePickerHeaderBackgroundSchemeColor: SchemeColor.primary,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    appBarScrolledUnderElevation: 4.0,
    tabBarIndicatorSize: TabBarIndicatorSize.tab,
    tabBarIndicatorWeight: 5.5,
    tabBarIndicatorTopRadius: 0,
    tabBarDividerColor: Color(0x00000000),
    drawerElevation: 16.0,
    drawerWidth: 304.0,
    bottomSheetElevation: 8.0,
    bottomSheetModalElevation: 20.0,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
    bottomNavigationBarElevation: 8.0,
    menuElevation: 8.0,
    menuBarRadius: 0.0,
    menuBarElevation: 1.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarIndicatorSchemeColor: SchemeColor.secondary,
    navigationBarBackgroundSchemeColor: SchemeColor.surfaceVariant,
    navigationBarElevation: 0.0,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailIndicatorSchemeColor: SchemeColor.secondary,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  fontFamily: GoogleFonts.notoSans().fontFamily,
  darkIsTrueBlack: true,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,


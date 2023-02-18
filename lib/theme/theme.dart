import 'package:flutter/material.dart';

const Color backColor = Colors.white;
const Color mainColor = Color(0xFF00A29A);
const Color mainColorLight = Color(0xFF29B6B0);
const Color mainColorMegaLight = Color(0xFFD3F0EF);
const Color greyDark = Color(0xFF999999);
const Color greyMedium = Color(0xFF8E8E8E);
const Color greyLight = Color(0xFFD9D9D9);
const Color greyMegaLight = Color(0xFFEAEAEA);
const Color error = Color(0xFFE95255);

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  colorScheme: _schemeLight(_themeLight.colorScheme),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  bottomNavigationBarTheme:
      _botNavBarLight(_themeLight.bottomNavigationBarTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  textButtonTheme: TextButtonThemeData(style: _textButtonLight),
  outlinedButtonTheme: OutlinedButtonThemeData(style: _outButtonLight),
  chipTheme: _chipLight(_themeLight.chipTheme),
  primaryColorDark: mainColor,
  textTheme: _textLight(_themeLight.textTheme),
  scaffoldBackgroundColor: backColor,
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    error: error,
    primary: backColor,
    onPrimary: mainColor,
    primaryContainer: mainColor,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: backColor,
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontSize: 14,
      fontFamily: 'Open Sans',
    ),
    bodySmall: base.bodySmall!.copyWith(
      fontSize: 11,
      fontFamily: 'Open Sans',
      color: Colors.black,
    ),
    labelSmall: base.labelSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Open Sans',
      letterSpacing: 0,
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: mainColor,
      fontFamily: 'Montserrat',
    ),
    titleSmall: base.titleSmall!.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    titleMedium: base.titleMedium!.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: 'Montserrat',
    ),
    titleLarge: base.titleLarge!.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w700,
      fontFamily: 'Montserrat',
    ),
  );
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: backColor,
    centerTitle: false,
    foregroundColor: mainColor,
    elevation: 0.0,
  );
}

BottomNavigationBarThemeData _botNavBarLight(
    BottomNavigationBarThemeData base) {
  return base.copyWith(
    backgroundColor: backColor,
    selectedItemColor: mainColor,
    unselectedItemColor: greyDark,
    selectedIconTheme: const IconThemeData(color: mainColor),
    type: BottomNavigationBarType.fixed,
    selectedLabelStyle: const TextStyle(fontSize: 12),
  );
}

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
  backgroundColor: mainColor,
  foregroundColor: Colors.white,
  textStyle: const TextStyle(fontSize: 20, fontFamily: 'Open Sans'),
  padding: const EdgeInsets.all(16),
);

ButtonStyle _outButtonLight = ElevatedButton.styleFrom(
  foregroundColor: mainColor,
  textStyle: const TextStyle(
      fontWeight: FontWeight.w500, fontSize: 16, fontFamily: 'Montserrat'),
  padding: const EdgeInsets.all(16),
);

ButtonStyle _textButtonLight = ElevatedButton.styleFrom(
  foregroundColor: mainColor,
  textStyle: const TextStyle(
      fontSize: 20, fontWeight: FontWeight.w700, fontFamily: 'Montserrat'),
  padding: const EdgeInsets.all(16),
);

ChipThemeData _chipLight(ChipThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    showCheckmark: false,
    padding: const EdgeInsets.all(8),
    backgroundColor: Colors.white,
    selectedColor: Colors.white,
    labelStyle: TextStyle(
        color: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) =>
          states.contains(MaterialState.selected) ? mainColor : greyDark,
    )),
  );
}

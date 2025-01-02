import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static Color blue = const Color(0xFF0000FF);

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    var darkColorSwatch = const MaterialColor(0xffb131f1, {
      50: Color(0xffb131f1),
      100: Color(0xffb131f1),
      200: Color(0xffb131f1),
      300: Color(0xffb131f1),
      400: Color(0xffb131f1),
      500: Color(0xffb131f1),
      600: Color(0xffb131f1),
      700: Color(0xffb131f1),
      800: Color(0xffb131f1),
      900: Color(0xffb131f1)
    });
    /*var lightColorSwatch = const MaterialColor(0xff412872, {
      50: Color(0xff412872),
      100: Color(0xff412872),
      200: Color(0xff412872),
      300: Color(0xff412872),
      400: Color(0xff412872),
      500: Color(0xff412872),
      600: Color(0xff412872),
      700: Color(0xff412872),
      800: Color(0xff412872),
      900: Color(0xff412872)
    });*/
    var lightColorSwatch = const MaterialColor(0xff03168C, {
      50: Color(0xff03168C),
      100: Color(0xff03168C),
      200: Color(0xff03168C),
      300: Color(0xff03168C),
      400: Color(0xff03168C),
      500: Color(0xff03168C),
      600: Color(0xff03168C),
      700: Color(0xff03168C),
      800: Color(0xff03168C),
      900: Color(0xff03168C)
    });
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
            primary: Color(0xff03168C),
            onPrimary: Color(0xffFFFFFF),
            primaryContainer: Color(0xffEFF1FF),
            onPrimaryContainer: Color(0xff01072A),
            secondary: Color(0xffFFB500),
            onSecondary: Color(0xff000000),
            secondaryContainer: Color(0xffFFF8E5),
            onSecondaryContainer: Color(0xff4D3600),
            tertiary: Color(0xffFF8605),
            onTertiary: Color(0xff000000),
            tertiaryContainer: Color(0xffFFF3E6),
            onTertiaryContainer: Color(0xff4D2802),
            error: Color(0xffB81F1E),
            onError: Color(0xffFFFFFF),
            errorContainer: Color(0xffFFDAD6),
            onErrorContainer: Color(0xff410002),
            surface: Color(0xffF9F9FC),
            onSurface: Color(0xff1A1C1E),
            onSurfaceVariant: Color(0xFF43474E),
            outline: Color(0xff73777F),
            outlineVariant: Color(0xffC3C6CF),
            shadow: Color(0xff000000),
            scrim: Color(0xff000000),
            inverseSurface: Color(0xff2F3033),
            onInverseSurface: Color(0xffF0F0F4),
            inversePrimary: Color(0xffCDD0E8),
            surfaceTint: Color(0xffDADADD),
            surfaceVariant: Color(0xFFDFE2EB),
            onBackground: Color(0xFF1A1C1E)),
        bottomSheetTheme: Theme.of(context).bottomSheetTheme.copyWith(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)),
          ),
        ),
        iconTheme:
        IconThemeData(color: isDarkTheme ? Colors.white : Colors.black),
        primaryColor:
        isDarkTheme ? const Color(0xffb131f1) : const Color(0xff03168C),
        primarySwatch: isDarkTheme ? darkColorSwatch : lightColorSwatch,
        /*errorColor:
            isDarkTheme ? const Color(0xffCF6679) : const Color(0xffB00020),
        backgroundColor: isDarkTheme ? Colors.grey : const Color(0xffF1F5FB),*/
        canvasColor: isDarkTheme ? Colors.grey.shade900 : Colors.grey[50],
        shadowColor: isDarkTheme ? Colors.white38 : Colors.grey,
        indicatorColor:
        isDarkTheme ? const Color(0x593cb4e5) : const Color(0xffF0FAFF),
        hintColor:
        isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
        highlightColor:
        isDarkTheme ? const Color(0xff6a4b01) : const Color(0xffFCE192),
        hoverColor:
        isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
        focusColor:
        isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
        disabledColor:
        isDarkTheme ? Colors.grey.shade800 : Colors.grey.shade300,
        cardColor: isDarkTheme ? Colors.grey.shade800 : Colors.grey.shade200,
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        dividerColor: isDarkTheme ? Colors.white : Colors.black87,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
                color: Color(0xff03168C)),
          ),
        ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark(primary: Color(0xffb131f1))
                : const ColorScheme.light(primary: Color(0xff03168C))),
        /*toggleableActiveColor:
            isDarkTheme ? const Color(0xffA9DE81) : const Color(0xff2A7222),*/
        // fontFamily: "Montserrat",
        navigationBarTheme: Theme.of(context)
            .navigationBarTheme
            .copyWith(indicatorColor: const Color(0xFFC5CDFF)),
        fontFamily: GoogleFonts.jost().fontFamily,
        textTheme: TextTheme(
          titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.jost().fontFamily,
          ),
          titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.jost().fontFamily,
          ),
          labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.jost().fontFamily,
          ),
          labelMedium: Theme.of(context).textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.jost().fontFamily,
          ),
        ));
  }
}

extension CustomThemeData on ThemeData {
  MaterialColor get greySwatch => const MaterialColor(0xFF101828, {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF9FAFB),
    100: Color(0xFFF2F4F7),
    200: Color(0xFFE4E7EC),
    300: Color(0xFFD0D5DD),
    400: Color(0xFF98A2B3),
    500: Color(0xFF667085),
    600: Color(0xFF475467),
    700: Color(0xFF344054),
    800: Color(0xFF1D2939),
    900: Color(0xFF101828)
  });

  MaterialColor get goldenSwatch => const MaterialColor(0xFFC29226, {
    300: Color(0xFFFFE993),
    400: Color(0xFFE9DB9A),
    500: Color(0xFFFEF2A0),
    600: Color(0xFFE2BF59),
    700: Color(0xFFCA9A2E),
    800: Color(0xFFB57F12),
    900: Color(0xff846E22),
  });

  MaterialColor get primarySwatch => const MaterialColor(0xFF42307D, {
    25: Color(0xFFFCFAFF),
    50: Color(0xFFF9F5FF),
    100: Color(0xFFF4EBFF),
    200: Color(0xFFE9D7FE),
    300: Color(0xFFD6BBFB),
    400: Color(0xFFB692F6),
    500: Color(0xFF9E77ED),
    600: Color(0xFF7F56D9),
    700: Color(0xFF6941C6),
    800: Color(0xFF53389E),
    900: Color(0xFF42307D)
  });

  MaterialColor get orangeSwatch => const MaterialColor(0xFF7E2410, {
    25: Color(0xFFFFFAF5),
    50: Color(0xFFFFF6ED),
    100: Color(0xFFFFEAD5),
    200: Color(0xFFFDDCAB),
    300: Color(0xFFFEB273),
    400: Color(0xFFFD853A),
    500: Color(0xFFFB6514),
    600: Color(0xFFEC4A0A),
    700: Color(0xFFC4320A),
    800: Color(0xFF9C2A10),
    900: Color(0xFF7E2410)
  });

  MaterialColor get roseSwatch => const MaterialColor(0xFF89123E, {
    25: Color(0xFFFFF5F6),
    50: Color(0xFFFFF1F3),
    100: Color(0xFFFFE4E8),
    200: Color(0xFFFECDD6),
    300: Color(0xFFFEA3B4),
    400: Color(0xFFFD6F8E),
    500: Color(0xFFF63D68),
    600: Color(0xFFE31B54),
    700: Color(0xFFC01048),
    800: Color(0xFFA11043),
    900: Color(0xFF89123E)
  });

  MaterialColor get blueGreySwatch => const MaterialColor(0xFF101323, {
    25: Color(0xFFFCFCFD),
    50: Color(0xFFF8F9FC),
    100: Color(0xFFEAECF5),
    200: Color(0xFFC8CCE5),
    300: Color(0xFF9EA5D1),
    400: Color(0xFF717BBC),
    500: Color(0xFF4E5BA6),
    600: Color(0xFF3E4784),
    700: Color(0xFF363F72),
    800: Color(0xFF293056),
    900: Color(0xFF18004B)
  });

  MaterialColor get goldStrokeSwatch => const MaterialColor(0xff846E22, {
    400: Color(0xFFE9DB9A),
    300: Color(0xFFFFE993),
    900: Color(0xff846E22),
  });

  MaterialColor get darkSwatch => const MaterialColor(0xff1E2022, {
    900: Color(0xff1E2022),
  });
  MaterialColor get greenSwatch => const MaterialColor(0xff008F17, {
    900: Color(0xFF008F17),
  });

  MaterialColor get redSwatch => const MaterialColor(0xFFB81F1E, {
    900: Color(0xFFB81F1E),
  });

  MaterialColor get blueSwatch => const MaterialColor(0xFF1E25D9, {
    900: Color(0xFF1E25D9),
  });

  MaterialColor get dividerColorLight =>
      const MaterialColor(0xffF0F0F4, {900: Color(0xffF0F0F4)});

  MaterialColor get disabledTextColor =>
      const MaterialColor(0xff73777F, {900: Color(0xff73777F)});
}

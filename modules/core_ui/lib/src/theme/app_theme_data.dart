import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../extensions/context_exts.dart';
import '../utils/generate_material_color.dart';

class AppThemeData {
  const AppThemeData({
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.primaryColor,
    required this.typography,
    this.iconColor = Colors.black,
    required this.errorColor,
    required this.dividerColor,
    required this.primaryTextColor,
    required this.successColor,
    required this.boxShadow,
    this.spacing = const Spacing(),
    this.brightness = Brightness.light,
    this.iconSize = const IconSize(),
    required this.listTileTheme,
  });
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final Color primaryColor;
  final Color iconColor;
  final Spacing spacing;
  final IconSize iconSize;
  final Typography typography;
  final Color errorColor;
  final Color dividerColor;
  final Color primaryTextColor;
  final Color successColor;
  final BoxShadow boxShadow;
  final Brightness brightness;
  final ListTileTheme listTileTheme;
  factory AppThemeData.light() {
    const spacing = Spacing();
    const primaryTextColor = Colors.black;
    const secondaryTextColor = Color(0xFF8E8E8E);
    return AppThemeData(
      primaryBackgroundColor: const Color(0xffF0F3F5),
      secondaryBackgroundColor: Colors.white,
      primaryColor: const Color(0xFF00C6C6),
      iconColor: Colors.black,
      brightness: Brightness.light,
      typography: const Typography(
        titleTextColor: primaryTextColor,
        bodyTextColor: primaryTextColor,
        successTextColor: Color(0xff1BC200),
      ),
      spacing: spacing,
      errorColor: const Color(0xffB42C2C),
      dividerColor: const Color(0xffE3E3E3),
      successColor: const Color(0xff1BC200),
      primaryTextColor: Colors.black,
      boxShadow: const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
      listTileTheme: ListTileTheme(
        threeLineCard: ListTileThemeData(
          contentPadding: EdgeInsets.symmetric(
            vertical: spacing.marginSmall,
            horizontal: spacing.marginMedium,
          ),
          horizontalTitleGap: spacing.marginMedium,
          tileColor: const Color(0xFFF7F7F7),
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFE3E3E3)),
            borderRadius: BorderRadius.circular(
              spacing.borderRadiusMedium,
            ),
          ),
          titleAlignment: ListTileTitleAlignment.bottom,
          titleTextStyle: GoogleFonts.inter(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: primaryTextColor,
          ),
          subtitleTextStyle: GoogleFonts.inter(
            fontSize: 13.0,
            color: secondaryTextColor,
          ),
        ),
      ),
    );
  }
  ThemeData build(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryBackgroundColor,
      primarySwatch: generateMaterialColor(primaryColor),
      dividerColor: dividerColor,
      textTheme: typography.build(context),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(context.appTheme.spacing.gutter),
          ),
        ),
        backgroundColor: primaryBackgroundColor,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 1,
        titleTextStyle: TextStyle(
          fontSize: 15.0,
          color: primaryTextColor,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardTheme(
        color: secondaryBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.borderRadiusMedium),
        ),
        shadowColor: const Color.fromRGBO(0, 0, 0, 0.10),
      ),
      iconTheme: IconThemeData(color: iconColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shadowColor: const Color.fromRGBO(230, 172, 13, 0.2),
            padding: EdgeInsets.symmetric(
              vertical: spacing.buttonVertical,
              horizontal: spacing.buttonHorizontal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(spacing.borderRadiusMedium),
            ),
            disabledForegroundColor: Colors.black),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          foregroundColor: Colors.white,
          enableFeedback: true,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: spacing.buttonVertical),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          side: BorderSide(width: 2, color: primaryColor),
          foregroundColor: typography.bodyTextColor,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          iconColor: primaryColor,
          padding: EdgeInsets.symmetric(
            vertical: spacing.buttonVertical,
            horizontal: spacing.buttonHorizontal,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(
          horizontal: spacing.inputHorizontal,
          vertical: spacing.inputVertical,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor),
        ),
      ),
      listTileTheme: ListTileThemeData(
        titleTextStyle: context.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: context.textTheme.bodySmall,
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(primaryColor),
        shape: const CircleBorder(),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: generateMaterialColor(primaryColor),
        brightness: brightness,
      ).copyWith(
        error: errorColor,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: NoShadowCupertinoPageTransitionsBuilder(),
          TargetPlatform.android: NoShadowCupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class Spacing {
  const Spacing({
    this.gutter = 16.0,
    this.marginSmall = 8.0,
    this.marginMedium = 16.0,
    this.marginLarge = 24.0,
    this.marginExtraLarge = 32.0,
    this.borderRadiusMedium = 12.0,
    this.formSpacing = 24.0,
    this.buttonHorizontal = 24.0,
    this.buttonVertical = 16.0,
    this.inputHorizontal = 12.0,
    this.inputVertical = 12.0,
  });
  final double gutter;
  final double marginSmall;
  final double marginMedium;
  final double formSpacing;
  final double marginLarge;
  final double marginExtraLarge;
  final double borderRadiusMedium;
  final double buttonHorizontal;
  final double buttonVertical;
  final double inputHorizontal;
  final double inputVertical;
}

class IconSize {
  const IconSize({
    this.iconSizeExtraSmall = 9.0,
    this.iconSizeSmall = 24.0,
    this.iconSizeMedium = 32.0,
    this.iconSizeLarge = 40.0,
    this.iconSizeExtraLarge = 48.0,
  });
  final double iconSizeExtraSmall;
  final double iconSizeSmall;
  final double iconSizeMedium;
  final double iconSizeLarge;
  final double iconSizeExtraLarge;
}

class Typography {
  const Typography({
    required this.titleTextColor,
    required this.bodyTextColor,
    required this.successTextColor,
  });
  final Color titleTextColor;
  final Color bodyTextColor;
  final Color successTextColor;
  TextTheme build(BuildContext context) {
    final baseTheme = context.textTheme.apply(
      bodyColor: bodyTextColor,
      displayColor: titleTextColor,
    );
    return GoogleFonts.interTextTheme(
      baseTheme.copyWith(
        titleLarge: const TextStyle(fontWeight: FontWeight.w600),
        bodyMedium: const TextStyle(fontSize: 15.0),
        bodySmall: const TextStyle(fontSize: 13.0, color: Color(0xFF8E8E8E)),
        labelSmall: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
          color: bodyTextColor,
        ),
        headlineSmall: TextStyle(
          color: successTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 26.0,
        ),
      ),
    );
  }
}

class ListTileTheme {
  const ListTileTheme({
    required this.threeLineCard,
  });
  final ListTileThemeData threeLineCard;
}

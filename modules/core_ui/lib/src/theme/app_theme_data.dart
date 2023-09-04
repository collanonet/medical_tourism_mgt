import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reactive_pinput/reactive_pinput.dart';
import '../extensions/context_exts.dart';
import '../utils/generate_material_color.dart';
class AppThemeData {
  const AppThemeData({
    required this.primaryBackgroundColor,
    required this.secondaryBackgroundColor,
    required this.primaryColor,
    required this.typography,
    this.iconColor = Colors.black,
    required this.secondaryColor,
    required this.primaryContainerColor,
    required this.errorColor,
    required this.disabledColor,
    required this.dividerColor,
    required this.borderColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.darkGreyIconColor,
    required this.greyTextColor,
    required this.successColor,
    required this.greyCircleColor,
    required this.darkGreyCircleColor,
    required this.greyContainerColor,
    required this.disableButtonColor,
    required this.boxShadow,
    this.spacing = const Spacing(),
    this.appBodyTheme = const AppBodyTheme(),
    this.brightness = Brightness.light,
    this.iconSize = const IconSize(),
    required this.pinPutTheme,
    required this.listTileTheme,
  });
  final Color primaryBackgroundColor;
  final Color secondaryBackgroundColor;
  final Color primaryColor;
  final Color iconColor;
  final Spacing spacing;
  final IconSize iconSize;
  final Typography typography;
  final Color secondaryColor;
  final Color primaryContainerColor;
  final Color errorColor;
  final Color disabledColor;
  final Color dividerColor;
  final Color borderColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color darkGreyIconColor;
  final Color greyTextColor;
  final Color successColor;
  final Color greyCircleColor;
  final Color darkGreyCircleColor;
  final Color disableButtonColor;
  final BoxShadow boxShadow;
  final Brightness brightness;
  final Color greyContainerColor;
  final AppBodyTheme appBodyTheme;
  final PinPutTheme pinPutTheme;
  final ListTileTheme listTileTheme;
  factory AppThemeData.light() {
    const spacing = Spacing();
    const primaryTextColor = Colors.black;
    const secondaryTextColor = Color(0xFF8E8E8E);
    return AppThemeData(
      primaryBackgroundColor: const Color(0xFFF7F7F7),
      secondaryBackgroundColor: Colors.white,
      primaryColor: const Color(0xFFF8B500),
      iconColor: Colors.black,
      brightness: Brightness.light,
      typography: const Typography(
        titleTextColor: primaryTextColor,
        bodyTextColor: primaryTextColor,
        successTextColor: Color(0xff1BC200),
      ),
      disableButtonColor: const Color(0xffBEBEBE),
      spacing: spacing,
      secondaryColor: const Color(0xFFFCE9B7),
      primaryContainerColor: Colors.white,
      errorColor: const Color(0xffB42C2C),
      disabledColor: const Color(0xff8E8E8E),
      dividerColor: const Color(0xffE3E3E3),
      borderColor: const Color(0xFFE3E3E3),
      successColor: const Color(0xff1BC200),
      darkGreyIconColor: const Color(0xff4C5157),
      greyTextColor: const Color(0xff5B5B5B),
      greyCircleColor: const Color(0xff7D7366),
      darkGreyCircleColor: const Color(0xff534F42),
      greyContainerColor: const Color(0xffEBEBEB),
      primaryTextColor: Colors.black,
      secondaryTextColor: const Color(0xFF8A8A8E),
      boxShadow: const BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
      ),
      pinPutTheme: PinPutTheme(
        dotColor: const Color(0xFFB5B6B6),
        focusDotColor: const Color(0xFFF8B500),
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
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryBackgroundColor,
      primarySwatch: generateMaterialColor(primaryColor),
      disabledColor: disabledColor,
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
          disabledBackgroundColor: disableButtonColor,
            disabledForegroundColor: Colors.black
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 1,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: spacing.buttonVertical),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
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
        primaryContainer: primaryContainerColor,
        secondary: secondaryColor,
        error: errorColor,
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
class AppBodyTheme {
  const AppBodyTheme({
    this.primaryCurvedColor = const Color(0xFF7D7366),
    this.secondaryCurvedColor = const Color(0xFFE3E3E3),
  });
  final Color primaryCurvedColor;
  final Color secondaryCurvedColor;
}
class PinPutTheme {
  PinPutTheme._({
    required this.pinTheme,
    required this.focusPinTheme,
  });
  factory PinPutTheme({
    double dotSize = 10.0,
    double focusDotSize = 14.0,
    Color dotColor = Colors.grey,
    Color focusDotColor = Colors.black,
  }) {
    const decoration = BoxDecoration(shape: BoxShape.circle);
    return PinPutTheme._(
      pinTheme: PinTheme(
        width: dotSize,
        height: dotSize,
        decoration: decoration.copyWith(color: dotColor),
      ),
      focusPinTheme: PinTheme(
        width: focusDotSize,
        height: focusDotSize,
        decoration: decoration.copyWith(color: focusDotColor),
      ),
    );
  }
  final PinTheme pinTheme;
  final PinTheme focusPinTheme;
}
class ListTileTheme {
  const ListTileTheme({
    required this.threeLineCard,
  });
  final ListTileThemeData threeLineCard;
}

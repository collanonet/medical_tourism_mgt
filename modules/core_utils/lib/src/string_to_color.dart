// Dart imports:
import 'dart:ui';

class ColorUtils {
  static Color stringToColor(String value) {
    int colorValue = stringToHexInt(value);
    return Color(colorValue).withOpacity(1.0);
  }

  static int stringToHexInt(String color) {
    return int.tryParse('0xFF$color') ?? 0xFFFFFFFF;
  }

  ColorUtils._(); // private constructor
}

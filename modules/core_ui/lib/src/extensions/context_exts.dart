import 'package:flutter/material.dart';

import '../../theme.dart';

extension ThemeExts on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppThemeData get appTheme => AppTheme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension MediaQueryExts on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
}

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
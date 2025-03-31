// Dart imports:
import 'dart:convert';
import 'dart:html' as html;

// Package imports:
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

// Project imports:
import '../core_utils.dart';

/// A utility class for working with strings.
///
/// This class contains static methods for common string operations.
class Strings {
  const Strings._();

  /// Removes all whitespace characters from the given [value] string.
  ///
  /// Returns the modified string.
  static String trim(String value) {
    return value.replaceAll(RegExp(r'\s+'), '');
  }

  static String subString(String value, int length) {
    if (length <= 0) {
      return '';
    }
    return value.length < length ? value : value.substring(0, length);
  }

  static String textAndNumOnly(String value) {
    RegExp specialCharRegExp = RegExp(r'[^\w\s]');

    return value.replaceAll(specialCharRegExp, '');
  }

  /// Returns the initials of the given [name] string.
  ///
  /// If the name contains only one word, the first two letters of that word
  /// will be returned. Otherwise, the first letter of the first and last words
  /// will be returned.
  ///
  /// Returns the initials as a capitalized string.
  static String getInitials(String name) {
    final List<String> names = name.split(' ');

    if (names.length < 2) {
      return subString(names.first, 2).toUpperCase();
    }

    return '${subString(names.first, 1)}${subString(names.last, 1)}'
        .toUpperCase();
  }

  static Future<String> appVersion({
    bool? buildNumber = true,
  }) async {
    try {
      var url = html.window.location.href;

      logger.i('url: $url');
      String uri;
      if (url.contains('localhost')) {
        uri = '1.0.0';
      } else {
        uri = '${url.split('app/').first}app/';
      }
      logger.i('uri: $uri');

      final info = await http.get(
        Uri.parse('$uri/version.json'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      var data = json.decode(info.body);
      if (buildNumber == false) {
        return data['version'];
      }
      return '${data["version"]} (${data["build_number"]})';
    } catch (e) {
      logger.e(e);
      return '1.0.0';
    }
  }

  static String shortDateTimeName(DateTime dateTime) {
    return Jiffy.parseFromDateTime(dateTime)
        .toLocal()
        .format(pattern: 'dd/MMM hh:mm a');
  }

  // convert 10000.05 to 10,000.05
  static String formatCurrency(double value) {
    if (value.toString().isEmpty) {
      return '';
    }
    final parts = value.toString().split('.');
    final formatter = NumberFormat.decimalPattern();
    final formatted = formatter.format(int.parse(parts[0]));
    return "${parts.length > 1 ? '$formatted.${parts[1]}' : formatted} 円" ;
  }
}

extension StringX on String? {
  String? noSpaces() => this == null ? null : Strings.trim(this!);
}

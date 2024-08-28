// Package imports:
import 'package:url_launcher/url_launcher.dart';

Future<void> launchUrlFunc(Uri uri) async {
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

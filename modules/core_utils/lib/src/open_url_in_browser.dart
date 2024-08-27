import 'package:url_launcher/url_launcher.dart';

Future<void> openUrlInBrowser(String url) async {
  Uri uri = Uri.parse(url);  // Parse the URL

  // Check if the URL can be launched
  if (await canLaunchUrl(uri)) {
    // Launch the URL in the external browser
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Opens in browser
    );
  } else {
    throw 'Could not launch $url';
  }
}
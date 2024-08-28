import 'package:url_launcher/url_launcher.dart';

Future<void> openUrlInBrowser({required String fileName}) async {
  String baseUrl =
      'https://medical-tourism-api-dev-collabonet.pixelplatforms.com/files';
  Uri uri = Uri.parse('$baseUrl/$fileName'); // Parse the URL
  // Check if the URL can be launched
  if (await canLaunchUrl(uri)) {
    // Launch the URL in the external browser
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // Opens in browser
    );
  } else {
    throw 'Could not launch $fileName';
  }
}

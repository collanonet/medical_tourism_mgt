import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> downloadFileImpl({
  required String fileName,
  String? downloadName,
}) async {
  final baseUrl = GetIt.I<String>(instanceName: 'fileUrl');
  final uri = Uri.parse('$baseUrl$fileName');

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $uri';
  }
}


import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_report_platform_interface.dart';

/// An implementation of [FeatureReportPlatform] that uses method channels.
class MethodChannelFeatureReport extends FeatureReportPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_report');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_quotation_platform_interface.dart';

/// An implementation of [FeatureQuotationPlatform] that uses method channels.
class MethodChannelFeatureQuotation extends FeatureQuotationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_quotation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

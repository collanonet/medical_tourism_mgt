import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_invoice_platform_interface.dart';

/// An implementation of [FeatureInvoicePlatform] that uses method channels.
class MethodChannelFeatureInvoice extends FeatureInvoicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_invoice');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

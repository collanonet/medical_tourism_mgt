import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_sale_platform_interface.dart';

/// An implementation of [FeatureSalePlatform] that uses method channels.
class MethodChannelFeatureSale extends FeatureSalePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_sale');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

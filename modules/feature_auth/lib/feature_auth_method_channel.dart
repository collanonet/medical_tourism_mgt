import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_auth_platform_interface.dart';

/// An implementation of [FeatureAuthPlatform] that uses method channels.
class MethodChannelFeatureAuth extends FeatureAuthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

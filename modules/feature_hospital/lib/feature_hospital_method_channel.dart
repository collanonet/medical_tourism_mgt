import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_hospital_platform_interface.dart';

/// An implementation of [FeatureHospitalPlatform] that uses method channels.
class MethodChannelFeatureHospital extends FeatureHospitalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_hospital');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_medical_visa_platform_interface.dart';

/// An implementation of [FeatureMedicalVisaPlatform] that uses method channels.
class MethodChannelFeatureMedicalVisa extends FeatureMedicalVisaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_medical_visa');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

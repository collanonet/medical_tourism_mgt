import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_patient_platform_interface.dart';

/// An implementation of [FeaturePatientPlatform] that uses method channels.
class MethodChannelFeaturePatient extends FeaturePatientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_patient');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

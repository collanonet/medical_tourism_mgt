import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_medical_visa_platform_interface.dart';

/// An implementation of [DataMedicalVisaPlatform] that uses method channels.
class MethodChannelDataMedicalVisa extends DataMedicalVisaPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_medical_visa');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

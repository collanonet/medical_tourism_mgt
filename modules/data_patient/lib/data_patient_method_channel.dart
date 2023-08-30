import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_patient_platform_interface.dart';

/// An implementation of [DataPatientPlatform] that uses method channels.
class MethodChannelDataPatient extends DataPatientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_patient');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

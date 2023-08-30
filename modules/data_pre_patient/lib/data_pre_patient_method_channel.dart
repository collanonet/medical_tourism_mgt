import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_pre_patient_platform_interface.dart';

/// An implementation of [DataPrePatientPlatform] that uses method channels.
class MethodChannelDataPrePatient extends DataPrePatientPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_pre_patient');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

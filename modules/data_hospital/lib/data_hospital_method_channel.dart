import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_hospital_platform_interface.dart';

/// An implementation of [DataHospitalPlatform] that uses method channels.
class MethodChannelDataHospital extends DataHospitalPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_hospital');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

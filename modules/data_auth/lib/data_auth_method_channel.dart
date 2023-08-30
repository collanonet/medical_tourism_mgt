import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_auth_platform_interface.dart';

/// An implementation of [DataAuthPlatform] that uses method channels.
class MethodChannelDataAuth extends DataAuthPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_auth');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

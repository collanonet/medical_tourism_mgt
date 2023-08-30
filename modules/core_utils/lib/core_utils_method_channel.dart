import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core_utils_platform_interface.dart';

/// An implementation of [CoreUtilsPlatform] that uses method channels.
class MethodChannelCoreUtils extends CoreUtilsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_utils');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

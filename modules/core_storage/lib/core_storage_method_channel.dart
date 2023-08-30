import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core_storage_platform_interface.dart';

/// An implementation of [CoreStoragePlatform] that uses method channels.
class MethodChannelCoreStorage extends CoreStoragePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_storage');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

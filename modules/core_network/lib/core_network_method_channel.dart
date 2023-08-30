import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core_network_platform_interface.dart';

/// An implementation of [CoreNetworkPlatform] that uses method channels.
class MethodChannelCoreNetwork extends CoreNetworkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_network');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

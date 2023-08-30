import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_agent_platform_interface.dart';

/// An implementation of [DataAgentPlatform] that uses method channels.
class MethodChannelDataAgent extends DataAgentPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_agent');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

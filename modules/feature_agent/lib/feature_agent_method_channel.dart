import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_agent_platform_interface.dart';

/// An implementation of [FeatureAgentPlatform] that uses method channels.
class MethodChannelFeatureAgent extends FeatureAgentPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_agent');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

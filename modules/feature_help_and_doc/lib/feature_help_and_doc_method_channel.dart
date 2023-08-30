import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'feature_help_and_doc_platform_interface.dart';

/// An implementation of [FeatureHelpAndDocPlatform] that uses method channels.
class MethodChannelFeatureHelpAndDoc extends FeatureHelpAndDocPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('feature_help_and_doc');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

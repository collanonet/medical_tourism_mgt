import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'core_l10n_platform_interface.dart';

/// An implementation of [CoreL10nPlatform] that uses method channels.
class MethodChannelCoreL10n extends CoreL10nPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('core_l10n');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

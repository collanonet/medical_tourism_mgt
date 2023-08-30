import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core_l10n_method_channel.dart';

abstract class CoreL10nPlatform extends PlatformInterface {
  /// Constructs a CoreL10nPlatform.
  CoreL10nPlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreL10nPlatform _instance = MethodChannelCoreL10n();

  /// The default instance of [CoreL10nPlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreL10n].
  static CoreL10nPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreL10nPlatform] when
  /// they register themselves.
  static set instance(CoreL10nPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

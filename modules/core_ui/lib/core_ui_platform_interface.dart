import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'core_ui_method_channel.dart';

abstract class CoreUiPlatform extends PlatformInterface {
  /// Constructs a CoreUiPlatform.
  CoreUiPlatform() : super(token: _token);

  static final Object _token = Object();

  static CoreUiPlatform _instance = MethodChannelCoreUi();

  /// The default instance of [CoreUiPlatform] to use.
  ///
  /// Defaults to [MethodChannelCoreUi].
  static CoreUiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [CoreUiPlatform] when
  /// they register themselves.
  static set instance(CoreUiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

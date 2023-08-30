import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_help_and_doc_method_channel.dart';

abstract class FeatureHelpAndDocPlatform extends PlatformInterface {
  /// Constructs a FeatureHelpAndDocPlatform.
  FeatureHelpAndDocPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureHelpAndDocPlatform _instance = MethodChannelFeatureHelpAndDoc();

  /// The default instance of [FeatureHelpAndDocPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureHelpAndDoc].
  static FeatureHelpAndDocPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureHelpAndDocPlatform] when
  /// they register themselves.
  static set instance(FeatureHelpAndDocPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

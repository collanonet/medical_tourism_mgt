import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_medical_visa_method_channel.dart';

abstract class FeatureMedicalVisaPlatform extends PlatformInterface {
  /// Constructs a FeatureMedicalVisaPlatform.
  FeatureMedicalVisaPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureMedicalVisaPlatform _instance = MethodChannelFeatureMedicalVisa();

  /// The default instance of [FeatureMedicalVisaPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureMedicalVisa].
  static FeatureMedicalVisaPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureMedicalVisaPlatform] when
  /// they register themselves.
  static set instance(FeatureMedicalVisaPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

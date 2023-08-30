import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_hospital_method_channel.dart';

abstract class FeatureHospitalPlatform extends PlatformInterface {
  /// Constructs a FeatureHospitalPlatform.
  FeatureHospitalPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureHospitalPlatform _instance = MethodChannelFeatureHospital();

  /// The default instance of [FeatureHospitalPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureHospital].
  static FeatureHospitalPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureHospitalPlatform] when
  /// they register themselves.
  static set instance(FeatureHospitalPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

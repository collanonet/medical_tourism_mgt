import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'feature_report_method_channel.dart';

abstract class FeatureReportPlatform extends PlatformInterface {
  /// Constructs a FeatureReportPlatform.
  FeatureReportPlatform() : super(token: _token);

  static final Object _token = Object();

  static FeatureReportPlatform _instance = MethodChannelFeatureReport();

  /// The default instance of [FeatureReportPlatform] to use.
  ///
  /// Defaults to [MethodChannelFeatureReport].
  static FeatureReportPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FeatureReportPlatform] when
  /// they register themselves.
  static set instance(FeatureReportPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

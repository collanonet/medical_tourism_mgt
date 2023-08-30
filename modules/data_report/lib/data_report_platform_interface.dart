import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_report_method_channel.dart';

abstract class DataReportPlatform extends PlatformInterface {
  /// Constructs a DataReportPlatform.
  DataReportPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataReportPlatform _instance = MethodChannelDataReport();

  /// The default instance of [DataReportPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataReport].
  static DataReportPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataReportPlatform] when
  /// they register themselves.
  static set instance(DataReportPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

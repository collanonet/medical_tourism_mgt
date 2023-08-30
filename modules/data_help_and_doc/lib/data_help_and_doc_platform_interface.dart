import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_help_and_doc_method_channel.dart';

abstract class DataHelpAndDocPlatform extends PlatformInterface {
  /// Constructs a DataHelpAndDocPlatform.
  DataHelpAndDocPlatform() : super(token: _token);

  static final Object _token = Object();

  static DataHelpAndDocPlatform _instance = MethodChannelDataHelpAndDoc();

  /// The default instance of [DataHelpAndDocPlatform] to use.
  ///
  /// Defaults to [MethodChannelDataHelpAndDoc].
  static DataHelpAndDocPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataHelpAndDocPlatform] when
  /// they register themselves.
  static set instance(DataHelpAndDocPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}

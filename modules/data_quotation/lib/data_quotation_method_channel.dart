import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_quotation_platform_interface.dart';

/// An implementation of [DataQuotationPlatform] that uses method channels.
class MethodChannelDataQuotation extends DataQuotationPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_quotation');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}

import 'dart:convert';

import 'package:core_storage/core_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  final storagePrefixKey = 'medical_tourism_';

  @Named('authStorage')
  @singleton
  Storage get authStorage {
    return Storage.create(
      persistence: SharedPreferencesPersistence(prefix: storagePrefixKey),
      converter: JsonConverter(),
    );
  }

  @Named('localeStorage')
  @singleton
  Storage get localeStorage {
    return Storage.create(
      persistence: SharedPreferencesPersistence(prefix: storagePrefixKey),
      converter: JsonConverter(),
    );
  }
}

class JsonConverter with Converter {
  @override
  Future<T?> fromStr<T>(String? value) async {
    if (value == null) return null;
    return jsonDecode(value) as T?;
  }

  @override
  Future<String?> toStr<T>(T? value) async {
    if (value == null) return null;
    return jsonEncode(value);
  }
}

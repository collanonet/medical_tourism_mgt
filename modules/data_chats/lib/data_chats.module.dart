//@GeneratedMicroModule;DataChatsPackageModule;package:data_chats/data_chats.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

// Dart imports:
import 'dart:async' as _i2;

// Package imports:
import 'package:core_network/core_network.dart' as _i5;
import 'package:injectable/injectable.dart' as _i1;

// Project imports:
import 'src/providers/chat_local_provider.dart' as _i3;
import 'src/providers/chat_remote_provider.dart' as _i4;
import 'src/repositories/chat_repository.dart' as _i6;
import 'src/repositories/chat_repository_impl.dart' as _i7;

class DataChatsPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ChatLocalProvider>(() => _i3.ChatLocalProvider());
    gh.factory<_i4.ChatRemoteProvider>(
        () => _i4.ChatRemoteProvider(apiService: gh<_i5.ApiService>()));
    gh.factory<_i6.ChatRepository>(() => _i7.ChatRepositoryIml(
          remote: gh<_i4.ChatRemoteProvider>(),
          local: gh<_i3.ChatLocalProvider>(),
        ));
  }
}

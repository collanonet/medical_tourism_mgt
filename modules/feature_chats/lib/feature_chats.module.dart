//@GeneratedMicroModule;FeatureChatsPackageModule;package:feature_chats/feature_chats.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i2;

import 'package:data_chats/data_chats.dart' as _i5;
import 'package:data_patient/data_patient.dart' as _i7;
import 'package:injectable/injectable.dart' as _i1;
import 'package:socket_chat/socket_chat.dart' as _i6;

import 'src/chat_model.dart' as _i3;

class FeatureChatsPackageModule extends _i1.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i2.FutureOr<void> init(_i1.GetItHelper gh) {
    gh.factory<_i3.ChatModel>(() => _i3.ChatModel(
          chatRepository: gh<_i5.ChatRepository>(),
          socketService: gh<_i6.SocketService>(),
          patientRepository: gh<_i7.PatientRepository>(),
        ));
  }
}

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_agent/data_agent.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentDetailModel {
  AgentDetailModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<AgentResponse>> agent =
      ValueNotifier(const AsyncData());

  void insertData(AgentResponse data) {
    agent.value = AsyncData(data: data);
  }
}

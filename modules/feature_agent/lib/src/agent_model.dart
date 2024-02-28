import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_agent/data_agent.dart';
import 'package:data_auth/data_auth.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentModel with ChangeNotifier {
  AgentModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<List<AgentResponse>>> agents = ValueNotifier(const AsyncData());

  void getAgents() async {
    try {
      agents.value = const AsyncData(loading: true);
      var response = await authRepository.getAgents();
      agents.value = AsyncData(data: response);
    } catch (error) {
      agents.value = AsyncData(error: error);
    }
  }
}
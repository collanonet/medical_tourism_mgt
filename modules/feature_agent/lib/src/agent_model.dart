// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_agent/data_agent.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class AgentModel {
  AgentModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<List<AgentResponse>>> agents =
      ValueNotifier(const AsyncData());

  Future<void> getAgent({FormGroup? form, String? companyName}) async {
    try {
      agents.value = const AsyncData(loading: true);
      logger.d(form?.value);
      logger.d(form?.control('companyName').value);
      var result = await authRepository.getAgents(
        companyName: form?.control('companyName').value == null
            ? null
            : form!.control('companyName').value,
        nameKana: form?.control('nameKana').value == null
            ? null
            : form!.control('nameKana').value,
        country: form?.control('country').value == null
            ? null
            : form!.control('country').value,
        area: form?.control('area').value == null
            ? null
            : form!.control('area').value,
        pastCasesNumber: form?.control('pastCasesNumber').value == null
            ? null
            : form!.control('pastCasesNumber').value,
      );

      agents.value = AsyncData(data: result);
    } catch (e) {
      agents.value = AsyncData(error: e);
    }
  }
}

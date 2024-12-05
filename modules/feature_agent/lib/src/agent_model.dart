// Flutter imports:
import 'package:core_utils/core_utils.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:data_agent/data_agent.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class AgentModel with ChangeNotifier {
  AgentModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<List<AgentResponse>>> agents =
      ValueNotifier(const AsyncData());

  Future<void> getAgent({FormGroup? form, String? companyName}) async {
    agents.value = const AsyncData(loading: true);
    notifyListeners();
    logger.d(form?.value);
    logger.d(form?.control('companyName').value);
    await authRepository
        .getAgents(
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
      fullNameJapaneseKanjiChineseOnly: form?.control('fullNameJapaneseKanjiChineseOnly').value == null ? null : form!.control('fullNameJapaneseKanjiChineseOnly').value,
      pastCasesNumber: form?.control('pastCasesNumber').value == null
          ? null
          : form!.control('pastCasesNumber').value,
    )
        .then((value) {
      agents.value = AsyncData(data: value);
      logger.d(value.length);
    }).catchError((error) {
      agents.value = AsyncData(error: error);
    }).whenComplete(() {
      notifyListeners();
    });
  }
}

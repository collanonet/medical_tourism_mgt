import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_agent/data_agent.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentModel with ChangeNotifier {
  AgentModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<List<AgentResponse>>> agents =
      ValueNotifier(const AsyncData());

  void getAgents({
    String? companyName,
    String? nameKana,
    String? postalCode,
    String? address,
    String? area,
    String? phoneNumber,
    DateTime? transactionStartDate,
    String? howToMainPayment,
    int? pastCasesNumber,
  }) async {
    try {
      agents.value = const AsyncData(loading: true);
      var response = await authRepository.getAgents(
        companyName: companyName,
        nameKana: nameKana,
        postalCode: postalCode,
        address: address,
        area: area,
        phoneNumber: phoneNumber,
        transactionStartDate: transactionStartDate,
        howToMainPayment: howToMainPayment,
        pastCasesNumber: pastCasesNumber,
      );
      agents.value = AsyncData(data: response);
    } catch (error) {
      agents.value = AsyncData(error: error);
    }
  }
}

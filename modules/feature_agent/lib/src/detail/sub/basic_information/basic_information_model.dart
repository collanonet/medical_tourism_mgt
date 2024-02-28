import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_agent/data_agent.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class AgentBasicInformationModel {
  AgentBasicInformationModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

  ValueNotifier<AsyncData<AgentResponse>> agent =
      ValueNotifier(const AsyncData());

  void init({String? id, required FormGroup formGroup}) async {
    logger.d('init $id');
    if (id != null) {
      try {
        agent.value = const AsyncData(loading: true);
        var response = await authRepository.getAgent(id);
        agent.value = AsyncData(data: response);
        insertAgentDataToForm(response, formGroup);
      } catch (error) {
        logger.e(error);
        agent.value = agent.value.copyWith(error: error);
      }
    }
  }

  void insertAgentDataToForm(AgentResponse response, FormGroup formGroup) {
    FormArray referralCommissions =
        formGroup.control('referralCommissions') as FormArray;
    referralCommissions.clear();
    if (response.referralCommissions != null &&
        response.referralCommissions!.isNotEmpty) {
      for (var element in response.referralCommissions!) {
        referralCommissions.add(
          FormGroup({
            'id': FormControl<String>(value: element.id),
            'referralCommissionName':
                FormControl<String>(value: element.referralCommissionName),
            'referralCommission':
                FormControl<int>(value: element.referralCommission),
          }),
        );
      }
    } else {
      referralCommissions.add(
        FormGroup({
          'id': FormControl<String>(),
          'referralCommissionName': FormControl<String>(),
          'referralCommission': FormControl<int>(),
        }),
      );
    }

    formGroup.patchValue({
      'id': response.id,
      'memo': response.memo,
      'companyName': response.companyName,
      'nameKana': response.nameKana,
      'postalCode': response.postalCode,
      'address': response.address,
      'area': response.area,
      'phoneNumber': response.phoneNumber,
      'transactionStartDate': response.transactionStartDate,
      'howToMainPayment': response.howToMainPayment,
      'pastCasesNumber': response.pastCasesNumber,
    });
  }

  void createOrUpdateAgent(FormGroup formGroup) async {
    try {
      agent.value = const AsyncData(loading: true);

      List<AgentReferralCommissionRequest> referralCommissions = [];

      formGroup.control('referralCommissions').value.forEach((element) {
        referralCommissions.add(AgentReferralCommissionRequest(
          id: element['id'],
          referralCommissionName: element['referralCommissionName'],
          referralCommission: element['referralCommission'] != null
              ? int.tryParse(element['referralCommission'].toString()) ?? 0
              : 0,
        ));
      });

      logger.d('referralCommissions $referralCommissions');
      logger.d('referralCommissions ${referralCommissions.length}');

      var agentRequest = AgentRequest(
        memo: formGroup.control('memo').value,
        companyName: formGroup.control('companyName').value,
        nameKana: formGroup.control('nameKana').value,
        postalCode: formGroup.control('postalCode').value,
        address: formGroup.control('address').value,
        area: formGroup.control('area').value,
        phoneNumber: formGroup.control('phoneNumber').value,
        transactionStartDate: formGroup.control('transactionStartDate').value,
        howToMainPayment: formGroup.control('howToMainPayment').value,
        pastCasesNumber: formGroup.control('pastCasesNumber').value,
        referralCommissions: referralCommissions,
      );

      if (formGroup.control('id').value != null) {
        var response = await authRepository.putAgent(
            formGroup.control('id').value, agentRequest);
        agent.value = AsyncData(data: response);
      } else {
        var response = await authRepository.postAgent(agentRequest);
        agent.value = AsyncData(data: response);
      }
    } catch (error) {
      logger.e(error);
      agent.value = AsyncData(error: error);
    }
  }
}

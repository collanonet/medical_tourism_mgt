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
        getAgentManagers(response.id, formGroup);
        agent.value = AsyncData(data: response);
        insertAgentDataToForm(response, formGroup);
      } catch (error) {
        logger.e(error);
        agent.value = agent.value.copyWith(error: error);
      }
    }
  }

  void insertAgentDataToForm(AgentResponse response, FormGroup formGroup) {
    FormGroup basicInformationAgentForm =
        formGroup.control('basicInformationAgent') as FormGroup;

    FormArray referralCommissions =
        basicInformationAgentForm.control('referralCommissions') as FormArray;
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

    basicInformationAgentForm.control('id').value = response.id;
    basicInformationAgentForm.control('memo').value = response.memo;
    basicInformationAgentForm.control('companyName').value =
        response.companyName;
    basicInformationAgentForm.control('nameKana').value = response.nameKana;
    basicInformationAgentForm.control('postalCode').value = response.postalCode;
    basicInformationAgentForm.control('address').value = response.address;
    basicInformationAgentForm.control('area').value = response.area;
    basicInformationAgentForm.control('phoneNumber').value =
        response.phoneNumber;
    basicInformationAgentForm.control('transactionStartDate').value =
        response.transactionStartDate;
    basicInformationAgentForm.control('howToMainPayment').value =
        response.howToMainPayment;
    basicInformationAgentForm.control('pastCasesNumber').value =
        response.pastCasesNumber;
  }

  void createOrUpdateAgent(FormGroup formGroup) async {
    try {
      agent.value = const AsyncData(loading: true);

      List<AgentReferralCommissionRequest> referralCommissions = [];

      formGroup
          .control('basicInformationAgent.referralCommissions')
          .value
          .forEach((element) {
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
        memo: formGroup.control('basicInformationAgent.memo').value,
        companyName:
            formGroup.control('basicInformationAgent.companyName').value,
        nameKana: formGroup.control('basicInformationAgent.nameKana').value,
        postalCode: formGroup.control('basicInformationAgent.postalCode').value,
        address: formGroup.control('basicInformationAgent.address').value,
        area: formGroup.control('basicInformationAgent.area').value,
        phoneNumber:
            formGroup.control('basicInformationAgent.phoneNumber').value,
        transactionStartDate: formGroup
            .control('basicInformationAgent.transactionStartDate')
            .value,
        howToMainPayment:
            formGroup.control('basicInformationAgent.howToMainPayment').value,
        pastCasesNumber:
            formGroup.control('basicInformationAgent.pastCasesNumber').value,
        referralCommissions: referralCommissions,
      );

      if (formGroup.control('basicInformationAgent.id').value != null) {
        var response = await authRepository.putAgent(
            formGroup.control('basicInformationAgent.id').value, agentRequest);
        agent.value = AsyncData(data: response);
      } else {
        var response = await authRepository.postAgent(agentRequest);
        agent.value = AsyncData(data: response);
      }
    } catch (error) {
      logger.e(error);
      agent.value = AsyncData(error: error);
    }

    if (agent.value.hasData) {
      createOrUpdateAgentManager(formGroup);
    }
  }

  ValueNotifier<AsyncData<List<AgentManagerResponse>>> agentManager =
      ValueNotifier(const AsyncData());

  void getAgentManagers(String agentRecord, FormGroup formGroup) async {
    try {
      agentManager.value = const AsyncData(loading: true);
      var response =
          await authRepository.getAgentManagers(agentRecord: agentRecord);
      agentManager.value = AsyncData(data: response);
      insertAgentManagerDataToForm(response, formGroup);
    } catch (error) {
      agentManager.value = AsyncData(error: error);
    }
  }

  void insertAgentManagerDataToForm(
      List<AgentManagerResponse> response, FormGroup formGroup) {
    FormArray manager = formGroup.control('manager') as FormArray;
    manager.clear();
    if (response.isNotEmpty) {
      for (var element in response) {
        FormArray contactMethods =
            element.contactMethods != null && element.contactMethods!.isNotEmpty
                ? FormArray(
                    element.contactMethods!.map((e) {
                      return FormGroup({
                        'id': FormControl<String>(value: e.id),
                        'howToContact':
                            FormControl<String>(value: e.howToContact),
                        'howToContactQrCode':
                            FormControl<String>(value: e.howToContactQrCode),
                      });
                    }).toList(),
                  )
                : FormArray([
                    FormGroup({
                      'id': FormControl<String>(),
                      'howToContact': FormControl<String>(),
                      'howToContactQrCode': FormControl<String>(),
                    }),
                  ]);
        manager.add(
          FormGroup({
            'id': FormControl<String>(value: element.id),
            'nameCardDragDrop':
                FormControl<String>(value: element.nameCardDragDrop),
            'departmentName':
                FormControl<String>(value: element.departmentName),
            'fullNameRomanji':
                FormControl<String>(value: element.fullNameRomanji),
            'fullNameChineseKanjiVietnameseNotation': FormControl<String>(
                value: element.fullNameChineseKanjiVietnameseNotation),
            'fullNameJapaneseKanjiChineseOnly': FormControl<String>(
                value: element.fullNameJapaneseKanjiChineseOnly),
            'fullNameKana': FormControl<String>(value: element.fullNameKana),
            'phoneNumber': FormControl<String>(value: element.phoneNumber),
            'email': FormControl<String>(value: element.email),
            'contactMethods': contactMethods,
          }),
        );
      }
    } else {
      manager.add(FormGroup({
        'id': FormControl<String>(),
        'nameCardDragDrop': FormControl<String>(),
        'departmentName': FormControl<String>(),
        'fullNameRomanji': FormControl<String>(
          validators: [Validators.required],
        ),
        'fullNameChineseKanjiVietnameseNotation': FormControl<String>(),
        'fullNameJapaneseKanjiChineseOnly': FormControl<String>(),
        'fullNameKana': FormControl<String>(),
        'phoneNumber': FormControl<String>(
          validators: [Validators.required],
        ),
        'email': FormControl<String>(
          validators: [Validators.required],
        ),
        'contactMethods': FormArray([
          FormGroup({
            'id': FormControl<String>(),
            'howToContact': FormControl<String>(),
            'howToContactQrCode': FormControl<String>(),
          }),
        ]),
      }));
    }
  }

  void createOrUpdateAgentManager(FormGroup formGroup) async {
    try {
      agentManager.value = const AsyncData(loading: true);

      await formGroup.control('manager').value.forEach((element) async {
        List<AgentManagerRequest> manager = [];

        List<AgentManagerContactRequest> contactMethods = [];
        element['contactMethods'].forEach((e) {
          contactMethods.add(AgentManagerContactRequest(
            id: e['id'],
            howToContact: e['howToContact'],
            howToContactQrCode: e['howToContactQrCode'],
          ));
        });

        manager.add(AgentManagerRequest(
          nameCardDragDrop: element['nameCardDragDrop'],
          departmentName: element['departmentName'],
          fullNameRomanji: element['fullNameRomanji'],
          fullNameChineseKanjiVietnameseNotation:
              element['fullNameChineseKanjiVietnameseNotation'],
          fullNameJapaneseKanjiChineseOnly:
              element['fullNameJapaneseKanjiChineseOnly'],
          fullNameKana: element['fullNameKana'],
          phoneNumber: element['phoneNumber'],
          email: element['email'],
          contactMethods: contactMethods,
          agentRecord: agent.value.requireData.id,
        ));

        if (element['id'] != null) {
          await authRepository.putAgentManager(element['id'], manager.first);
        } else {
          await authRepository.postAgentManager(manager.first);
        }
      });

      agentManager.value = agentManager.value.copyWith(loading: false);
    } catch (error) {
      logger.e(error);
      agentManager.value = AsyncData(error: error);
    }
  }
}

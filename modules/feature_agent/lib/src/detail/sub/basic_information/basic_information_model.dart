// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_agent/data_agent.dart';
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

  ValueNotifier<AsyncData<AgentResponse>> submitAgent =
      ValueNotifier(const AsyncData());

  void init({String? id, required FormGroup formGroup}) async {
    if (id != null) {
      try {
        agent.value = const AsyncData(loading: true);
        var response = await authRepository.getAgent(id);
        await getAgentManagers(response.id, formGroup);
        await insertAgentDataToForm(response, formGroup);
        agent.value = AsyncData(data: response);
      } catch (error) {
        logger.e(error);
        agent.value = AsyncData(error: error);
      }
    }
  }

  Future<void> insertAgentDataToForm(
    AgentResponse response,
    FormGroup formGroup,
  ) async {
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
            '_id': FormControl<String>(value: element.id),
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
          '_id': FormControl<String>(),
          'referralCommissionName': FormControl<String>(),
          'referralCommission': FormControl<int>(),
        }),
      );
    }

    basicInformationAgentForm.control('_id').value = response.id;
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

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());

  void createOrUpdateAgent(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);

      List<AgentReferralCommissionRequest> referralCommissions = [];

      formGroup
          .control('basicInformationAgent.referralCommissions')
          .value
          .forEach((element) {
        referralCommissions.add(AgentReferralCommissionRequest(
          id: element['_id'],
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
      AgentResponse response;
      if (formGroup.control('basicInformationAgent._id').value != null) {
        response = await authRepository.putAgent(
            formGroup.control('basicInformationAgent._id').value, agentRequest);
        submitAgent.value = AsyncData(data: response);
        agent.value = AsyncData(data: response);
      } else {
        response = await authRepository.postAgent(agentRequest);
        submitAgent.value = AsyncData(data: response);
        agent.value = AsyncData(data: response);
      }

      await createOrUpdateAgentManager(response.id, formGroup);
      submit.value = const AsyncData(data: true);
    } catch (error) {
      logger.e(error);
      submit.value = AsyncData(error: error);
    }
  }

  ValueNotifier<AsyncData<List<AgentManagerResponse>>> agentManager =
      ValueNotifier(const AsyncData());

  Future<void> getAgentManagers(String agentRecord, FormGroup formGroup) async {
    try {
      agentManager.value = const AsyncData(loading: true);
      var response =
          await authRepository.getAgentManagers(agentRecord: agentRecord);
      insertAgentManagerDataToForm(response, formGroup);
      agentManager.value = AsyncData(data: response);
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
        FormArray contactMethods = FormArray([
          FormGroup({
            '_id': FormControl<String>(),
            'howToContact': FormControl<String>(),
            'howToContactQrCode': FormControl<String>(),
          }),
        ]);

        if (element.contactMethods != null &&
            element.contactMethods!.isNotEmpty) {
          contactMethods.clear();
          for (var e in element.contactMethods!) {
            contactMethods.add(
              FormGroup({
                '_id': FormControl<String>(value: e.id),
                'howToContact': FormControl<String>(value: e.howToContact),
                'howToContactQrCode':
                    FormControl<String>(value: e.howToContactQrCode),
              }),
            );
          }
        }

        manager.add(
          FormGroup({
            '_id': FormControl<String>(value: element.id),
            'nameCardDragDrop': FormControl<FileSelect>(
                value: FileSelect(url: element.nameCardDragDrop)),
            'departmentName':
                FormControl<String>(value: element.departmentName),
            'fullNameRomanji': FormControl<String>(
              value: element.fullNameRomanji ?? '',
              validators: [Validators.required],
            ),
            'fullNameChineseKanjiVietnameseNotation': FormControl<String>(
                value: element.fullNameChineseKanjiVietnameseNotation),
            'fullNameJapaneseKanjiChineseOnly': FormControl<String>(
                value: element.fullNameJapaneseKanjiChineseOnly),
            'fullNameKana': FormControl<String>(value: element.fullNameKana),
            'phoneNumber': FormControl<String>(
              value: element.phoneNumber ?? '',
              validators: [
                Validators.required,
              ],
            ),
            'email': FormControl<String>(
              value: element.email,
              validators: [
                Validators.required,
                Validators.email,
              ],
            ),
            'contactMethods': contactMethods,
          }),
        );
      }
    } else {
      manager.add(
        FormGroup({
          '_id': FormControl<String>(),
          'nameCardDragDrop': FormControl<FileSelect>(),
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
            validators: [
              Validators.required,
              Validators.email,
            ],
          ),
          'contactMethods': FormArray([
            FormGroup({
              '_id': FormControl<String>(),
              'howToContact': FormControl<String>(),
              'howToContactQrCode': FormControl<String>(),
            }),
          ]),
        }),
      );
    }
  }

  Future<void> createOrUpdateAgentManager(
      String id, FormGroup formGroup) async {
    try {
      List<AgentManagerResponse> managers = agentManager.value.data ?? [];
      agentManager.value = const AsyncData(loading: true);

      await formGroup.control('manager').value.forEach((element) async {
        List<AgentManagerContactRequest> contactMethods = [];
        element['contactMethods'].forEach((e) {
          contactMethods.add(AgentManagerContactRequest(
            id: e['_id'],
            howToContact: e['howToContact'],
            howToContactQrCode: e['howToContactQrCode'],
          ));
        });

        String? file;
        if (element['nameCardDragDrop'] != null) {
          FileSelect docFile = element['nameCardDragDrop'];
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await authRepository.uploadFileBase64(
                base64Image,
                docFile.filename!,
              );
              file = fileData.filename;
            } catch (e) {
              logger.e(e);
            }
          } else {
            file = docFile.url;
          }
        }

        AgentManagerRequest manager = AgentManagerRequest(
          nameCardDragDrop: file,
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
          agentRecord: id,
        );

        if (element['_id'] != null) {
          var result =
              await authRepository.putAgentManager(element['_id'], manager);
          managers.map((e) => e.id == result.id ? result : e).toList();
        } else {
          var result = await authRepository.postAgentManager(manager);
          managers.add(result);
        }
      });

      agentManager.value = AsyncData(data: managers);
    } catch (error) {
      logger.e(error);
      agentManager.value =
          agentManager.value.copyWith(error: error, loading: false);
    }
  }

  ValueNotifier<List<Contact>> contactList = ValueNotifier([
    Contact(value: 'WeChat'),
    Contact(value: 'Line'),
    Contact(value: 'Telegram'),
    Contact(value: 'Messenger'),
    Contact(value: 'WhatsApp'),
  ]);

  ValueNotifier<AsyncData<bool>> deleteAgent = ValueNotifier(const AsyncData());

  Future<void> deleteAgentData() async {
    try {
      deleteAgent.value = const AsyncData(loading: true);
      await authRepository.deleteAgent(agent.value.requireData.id);
      deleteAgent.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      deleteAgent.value = AsyncData(error: e);
    }
  }
}

class Contact {
  String value;
  Contact({required this.value});
}

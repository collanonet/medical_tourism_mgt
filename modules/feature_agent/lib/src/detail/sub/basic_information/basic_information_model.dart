// Dart imports:
import 'dart:convert';



// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:dio/dio.dart';
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
        response.phoneNumber?.replaceAll(RegExp(r'[^0-9\uFF10-\uFF19]'), '');

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
         // id: element['_id'],
          referralCommissionName: element['referralCommissionName'],
          referralCommission: element['referralCommission'] != null
              ? int.tryParse(element['referralCommission'].toString()) ?? 0
              : 0,
        ));
      });



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
        formGroup.control('basicInformationAgent._id').patchValue(response.id);
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
              value: element.phoneNumber?.replaceAll(RegExp(r'[^0-9\uFF10-\uFF19]'), '') ??
                  '',
              validators: [
                Validators.pattern(RegExp(r'^[0-9]+$')),
              ],
            ),
            'email': FormControl<String>(
              value: element.email?.contains('@placeholder.com') == true
                  ? ''
                  : element.email,
              validators: [
                Validators.email,
              ],
            ),
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
            validators: [
              Validators.pattern(RegExp(r'^[0-9]+$')),
            ],
          ),
          'email': FormControl<String>(
            validators: [
              Validators.email,
            ],
          ),
        }),
      );
    }
  }

  Future<void> createOrUpdateAgentManager(
      String id, FormGroup formGroup) async {
    try {
      List<AgentManagerResponse> managers = agentManager.value.data ?? [];
      agentManager.value = const AsyncData(loading: true);

      FormArray managerArray = formGroup.control('manager') as FormArray;

      // Use a standard for loop to handle async operations sequentially and cleanly
      for (var i = 0; i < managerArray.controls.length; i++) {
        var control = managerArray.controls[i];
        var element = control.value;

        // 1. Image Upload Logic
        String? file;
        if (element['nameCardDragDrop'] != null) {
          FileSelect docFile = element['nameCardDragDrop'];
          // Only upload if it's a new file (file object is present)
          if (docFile.file != null) {
            try {
              String base64Image = base64Encode(docFile.file!);
              FileResponse fileData = await authRepository.uploadFileBase64(
                base64Image,
                docFile.filename!,
              );
              file = fileData.filename;
            } catch (e) {
              logger.e('Image Upload failed: $e');
              // Continue saving manager even if image upload fails, or handle strict if needed
            }
          } else {
            // Keep existing URL if no new file
            file = docFile.url;
          }
        }

        // 2. Prepare Payload
        // Handle empty strings for optional fields if backend requires null,
        // or ensure strings are strictly passed.
        // Spec: email/phone can be empty string or null, but unique constraint applies if value exists.
        String? email = element['email'];
        if (email != null && email.trim().isEmpty) {
          email = null; // Send null to avoid unique constraint on empty string if sparse index is used
        }

        String? phoneNumber = element['phoneNumber'];
        if (phoneNumber != null && phoneNumber.trim().isEmpty) {
          phoneNumber = null;
        }

        AgentManagerRequest managerRequest = AgentManagerRequest(
          nameCardDragDrop: file ?? '',
          departmentName: element['departmentName'],
          fullNameRomanji: element['fullNameRomanji'],
          fullNameChineseKanjiVietnameseNotation:
              element['fullNameChineseKanjiVietnameseNotation'],
          fullNameJapaneseKanjiChineseOnly:
              element['fullNameJapaneseKanjiChineseOnly'],
          fullNameKana: element['fullNameKana'],
          phoneNumber: phoneNumber,
          email: email, // use processed email (null or valid string)
          contactMethods: [],
          agentRecord: id,
        );

        // 3. Create or Update Logic
        try {
          if (element['_id'] != null && element['_id'].toString().isNotEmpty) {
            // UPDATE
            var result = await authRepository.putAgentManager(
                element['_id'], managerRequest);
            // Update local list
            managers =
                managers.map((e) => e.id == result.id ? result : e).toList();
          } else {
            // CREATE
            var result = await authRepository.postAgentManager(managerRequest);
            managers.add(result);
            // CRITICAL: Patch the ID back to the form control immediately
            control.patchValue({'_id': result.id});
          }
        } catch (e) {
          // 4. Detailed Error Handling within the loop
          if (e is DioException) {
            if (e.response?.statusCode == 400) {
              // Handle known validation errors (e.g. Email duplicate)
              // Propagate message to user
              throw e; 
            } else if (e.response?.statusCode == 500) {
              // Handle "Duplicate Key" hidden in 500 (e.g. Phone duplicate)
              if (e.response?.data.toString().contains('E11000') == true ||
                  e.response?.data.toString().contains('duplicate key') ==
                      true) {
                // Manually map to a friendly error
                // We rethrow a formatted error or handle UI feedback here
                 throw DioException(
                  requestOptions: e.requestOptions,
                  response: Response(
                    requestOptions: e.requestOptions,
                    statusCode: 400, // Pretend it's a 400 for the UI
                    statusMessage: 'Duplicate Entry',
                     data: {
                      'message': e.response?.data.toString().contains('phoneNumber') == true
                          ? 'Phone number already exists.'
                          : 'Duplicate entry detected.'
                    } 
                  ),
                  type: DioExceptionType.badResponse,
                );
              }
            }
          }
          rethrow; // Re-throw other errors to stop process
        }
      }

      agentManager.value = AsyncData(data: managers);
    } catch (error) {
      logger.e(error);
      agentManager.value =
          agentManager.value.copyWith(error: error, loading: false);
      rethrow; // Ensure UI knows about the failure
    }
  }

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



import 'dart:convert';

import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_agent/data_agent.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ContractModel {
  ContractModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;
  ValueNotifier<AsyncData<List<ContrantAgentResponse>>> contrantData =
      ValueNotifier(const AsyncData());
  void fetchContrant({required String id}) async {
    try {
      contrantData.value = const AsyncData(loading: true);
      final response = await authRepository.getContrantAgent(id: id);
      logger.d(response);
      contrantData.value = AsyncData(data: response);
    } catch (e) {
      logger.e(e);
      contrantData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<ContrantAgentResponse>> submitData =
      ValueNotifier(const AsyncData());

  Future<void> submit(FormGroup formGroup) async {
    try {
      submitData.value = const AsyncData(loading: true);
      String? file;
      if (formGroup.control('uploadFile').value != null) {
        FileSelect docFile = formGroup.control('uploadFile').value;

        if (docFile.file != null) {
          try {
            // convert Uint8List to base64
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await authRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            file = fileData.filename;
          } catch (e) {
            logger.e('update file test');
            logger.e(e);
          }
        } else {
          file = docFile.filename;
        }
      }
      final response =
          await authRepository.postContrantAgent(ContrantAgentRequest(
        uploadFile: file,
        fileName: formGroup.control('fileName').value,
        uploadOn: formGroup.control('updatedOn').value,
        agentRecord: formGroup.control('agentRecord').value,
      ));

      contrantData.value =
          AsyncData(data: contrantData.value.data!..add(response));
      submitData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<bool>> delete = ValueNotifier(const AsyncData());

  Future<void> deleteContractAgent(List<String> ids) async {
    try {
      delete.value = const AsyncData(loading: true);
      for (var id in ids) {
        await authRepository.deleteContractAgent(id);
        contrantData.value = AsyncData(
            data: contrantData.value.data!
              ..removeWhere((element) => element.id == id));
      }

      delete.value = const AsyncData(data: true);
    } catch (e) {
      logger.e(e);
      delete.value = AsyncData(error: e.toString());
    }
  }
}

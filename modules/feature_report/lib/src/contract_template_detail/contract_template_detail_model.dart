// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ContractTemplateModel {
  ContractTemplateModel({required this.reportRepository});
  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<ContractReportDetailResponse>>
      contractReportDetailData = ValueNotifier(const AsyncData());
  Future<void> fetchContractReportDetail(FormGroup formGroup) async {
    try {
      contractReportDetailData.value = const AsyncData(loading: true);
      final response = await reportRepository.getContractReportDetail();
      insertContractReportDetail(formGroup, response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertContractReportDetail(
      FormGroup formGroup, ContractReportDetailResponse? data) {
    formGroup.control('uploadFile').value = data?.uploadFile;
    formGroup.control('version').value = data?.version;
    formGroup.control('updatedOn').value = data?.updatedOn;
    formGroup.control('subject').value = data?.subject;
    formGroup.control('operation').value = data?.operation;
  }

  ValueNotifier<AsyncData<ContractReportDetailResponse>>
      submitFormContractData = ValueNotifier(const AsyncData());
  Future<void> postContractTemplate(FormGroup formGroup) async {
    try {
      submitFormContractData.value = const AsyncData(loading: true);
      final response = await reportRepository
          .postContractReportDetail(ContractReportDetailRequest(
        uploadFile: formGroup.control('uploadFile').value,
        version: formGroup.control('version').value,
        updatedOn: formGroup.control('updatedOn').value,
        subject: formGroup.control('subject').value,
        operation: formGroup.control('operation').value,
      ));

      contractReportDetailData.value = AsyncData(data: response);
      submitFormContractData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitFormContractData.value = AsyncData(error: e);
    }
  }

  late String id;
  ValueNotifier<AsyncData<List<ContractTemplateBasicInformationResponse>>>
      contractTemplatebasicInfoData = ValueNotifier(const AsyncData());
  Future<void> fetchContractTemplateBasicInfo(FormGroup formGroup) async {
    try {
      contractTemplatebasicInfoData.value = const AsyncData(loading: true);
      final response =
          await reportRepository.getContractTemplateBasicInformation();
      if (response.isNotEmpty) {
        contractTemplatebasicInfoData.value = AsyncData(data: response);
      } else {
        contractTemplatebasicInfoData.value = const AsyncData(data: []);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  insertContractTemplateBasicInfo(
      FormGroup formGroup, ContractTemplateBasicInformationResponse data) {
    id = data.id;
    formGroup.control('file').value = data.file;
    formGroup.control('version').value = data.version;
    formGroup.control('documentName').value = data.documentName;
    formGroup.control('first').value = data.first;
    formGroup.control('second').value = data.second;
    formGroup.control('c').value = data.c;
    formGroup.control('methodOfConclusion').value = data.methodOfConclusion;
    formGroup.control('contractPartnerInCaseOfHospital').value =
        data.contractPartnerInCaseOfHospital;
    formGroup.control('user').value = data.user;
  }

  ValueNotifier<AsyncData<ContractTemplateBasicInformationResponse>>
      submitContracTemplateBasicInfoData = ValueNotifier(const AsyncData());
  Future<void> submitContracTemplateBasicInfo(FormGroup formGroup) async {
    try {
      submitContracTemplateBasicInfoData.value = const AsyncData(loading: true);
      String? logoFile;
      if (formGroup.control('file').value != null) {
        FileSelect docFile = formGroup.control('file').value;
        if (docFile.file != null) {
          try {
            String base64Image = base64Encode(docFile.file!);
            FileResponse fileData = await reportRepository.uploadFileBase64(
              base64Image,
              docFile.filename!,
            );
            logoFile = fileData.filename;
          } catch (e) {
            logger.e(e);
          }
        } else {
          logoFile = docFile.url;
        }
      }

      ContractTemplateBasicInformationRequest request =
          ContractTemplateBasicInformationRequest(
        file: logoFile,
        version: formGroup.control('version').value,
        updateDate: DateTime.now(),
        documentName: formGroup.control('documentName').value,
        first: formGroup.control('first').value,
        second: formGroup.control('second').value,
        c: formGroup.control('c').value,
        methodOfConclusion: formGroup.control('methodOfConclusion').value,
        contractPartnerInCaseOfHospital:
            formGroup.control('contractPartnerInCaseOfHospital').value,
        user: formGroup.control('user').value,
      );
      final response =
          await reportRepository.postContractTemplateBasicInformation(request);
      contractTemplatebasicInfoData.value = AsyncData(
          data: contractTemplatebasicInfoData.value.data?..add(response));
      submitContracTemplateBasicInfoData.value = AsyncData(data: response);
      logger.d(response.toJson());
      logger.d(formGroup.control('version').value);
    } catch (e) {
      logger.d(e);
      submitContracTemplateBasicInfoData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<List<A>> listA = ValueNotifier([
    A(item: '自社'),
  ]);

  ValueNotifier<List<B>> listB = ValueNotifier([
    B(item: '患者'),
    B(item: 'AG'),
    B(item: '病院'),
  ]);

  ValueNotifier<List<C>> listC = ValueNotifier([
    C(item: '病院'),
  ]);

  ValueNotifier<List<FasteningMethod>> listFasteningMethod = ValueNotifier([
    FasteningMethod(item: '電子契約'),
    FasteningMethod(item: '書面契約'),
  ]);
}

class A {
  String item;
  A({required this.item});
}

class B {
  String item;
  B({required this.item});
}

class C {
  String item;
  C({required this.item});
}

class FasteningMethod {
  String item;
  FasteningMethod({required this.item});
}

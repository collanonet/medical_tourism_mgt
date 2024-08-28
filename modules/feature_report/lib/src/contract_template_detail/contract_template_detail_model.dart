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

  ValueNotifier<AsyncData<ContractReportDetailResponse>> contractReportDetailData = ValueNotifier(const AsyncData());
  Future<void> fetchContractReportDetail(FormGroup formGroup) async{
    try{
      contractReportDetailData.value = const AsyncData(loading: true);
      final response = await reportRepository.getContractReportDetail();
      insertContractReportDetail(formGroup, response);

    }catch(e){
      logger.d(e);
    }
  }
  void insertContractReportDetail(FormGroup formGroup,ContractReportDetailResponse? data){
    formGroup.control('uploadFile').value = data?.uploadFile;
    formGroup.control('version').value = data?.version;
    formGroup.control('updatedOn').value = data?.updatedOn;
    formGroup.control('subject').value = data?.subject;
    formGroup.control('operation').value = data?.operation;
  }

  ValueNotifier<AsyncData<ContractReportDetailResponse>> submitFormContractData = ValueNotifier(const AsyncData());
  Future<void> postContractTemplate(FormGroup formGroup) async {
    try{
      submitFormContractData.value = const AsyncData(loading: true);
      final response = await reportRepository.postContractReportDetail(
        ContractReportDetailRequest(
          uploadFile: formGroup.control('uploadFile').value,
         version:  formGroup.control('version').value,
          updatedOn: formGroup.control('updatedOn').value,
          subject: formGroup.control('subject').value,
          operation: formGroup.control('operation').value,
        )
      );

      contractReportDetailData.value = AsyncData(data: response);
      submitFormContractData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submitFormContractData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<ContractTemplateBasicInformationResponse>> contractTemplatebasicInfoData = ValueNotifier(const AsyncData());
  Future<void> fetchContractTemplateBasicInfo(FormGroup formGroup) async{
    try{
      contractReportDetailData.value = const AsyncData(loading: true);
      final response = await reportRepository.getContractTemplateBasicInformation();
      insertContractTemplateBasicInfo(formGroup, response);
    }catch(e){
      logger.d(e);
    }
  }

  insertContractTemplateBasicInfo(FormGroup formGroup,ContractTemplateBasicInformationResponse? data){
    formGroup.control('version').value = data?.version;
    formGroup.control('documentName').value = data?.documentName;
    formGroup.control('contractA').value = data?.contractA;
    formGroup.control('contractB').value = data?.contractB;
    formGroup.control('contractC').value = data?.contractC;
    formGroup.control('fastening_method').value = data?.fasteningMethod;
    formGroup.control('contracting_party_for_hospitals').value = data?.contractingPartyForHospitals;
    formGroup.control('operation').value = data?.operation;
  }

  ValueNotifier<AsyncData<ContractTemplateBasicInformationResponse>> submitContracTemplateBasicInfoData = ValueNotifier(const AsyncData());
  Future<void> submitContracTemplateBasicInfo(FormGroup formGroup) async{
    try{
      submitContracTemplateBasicInfoData.value = const AsyncData(loading: true);
      final response = await reportRepository.postContractTemplateBasicInformation(
        ContractTemplateBasicInformationRequest(
          version: formGroup.control('version').value,
          documentName: formGroup.control('documentName').value,
          contractA: formGroup.control('contractA').value,
          contractB: formGroup.control('contractB').value,
          contractC: formGroup.control('contractC').value,
          fasteningMethod: formGroup.control('fastening_method').value,
          contractingPartyForHospitals: formGroup.control('contracting_party_for_hospitals').value,
          operation: formGroup.control('operation').value,
        )
      );
      contractTemplatebasicInfoData.value = AsyncData(data: response);
      submitContracTemplateBasicInfoData.value = AsyncData(data: response);
    }catch(e){
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

class FasteningMethod{
  String item;
  FasteningMethod({required this.item});
}

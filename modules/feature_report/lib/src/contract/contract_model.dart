// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ContractModel{
  ContractModel({required this.reportRepository});
 final ReportRepository reportRepository;


 ValueNotifier<AsyncData<List<ReportContractResponse>>> contractData = ValueNotifier(const AsyncData<List<ReportContractResponse>>(data: []));
  Future<void> fetchContract() async {
    try{
      contractData.value = const AsyncData(loading: true);
      final response = await reportRepository.getReportContract();
      contractData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      contractData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<ContractFilterResponse>> filterData = ValueNotifier(const AsyncData());
  Future<void> fetchContractFilter(FormGroup formGroup) async{
    try{
      filterData.value = const AsyncData(loading: true);
      final response = await reportRepository.getContractFilter();
      insertFilterContract(formGroup, response);

    }catch(e){
      logger.d(e);
      filterData.value = AsyncData(error: e);
    }
  }

  void insertFilterContract(FormGroup formGroup,ContractFilterResponse? data){
    formGroup.control('agreementName').value = data?.agreementName;
    formGroup.control('contractA').value = data?.contractA;
    formGroup.control('contractB').value = data?.contractB;
    formGroup.control('fastening_method').value = data?.fasteningMethod;
  }

  ValueNotifier<AsyncData<ContractFilterResponse>> submitContractFilter = ValueNotifier(const AsyncData());
  Future<void> postContractFilter(FormGroup formGroup) async {
    try{
      submitContractFilter.value = const AsyncData(loading: true);
      final response = await reportRepository.postContractFilter(
        ContractFilterRequest(
           agreementName: formGroup.control('agreementName').value,
          contractA: formGroup.control('contractA').value,
          contractB: formGroup.control('contractB').value,
          fasteningMethod: formGroup.control('fastening_method').value,
        )
      );
      submitContractFilter.value = AsyncData(data: response);
  	  filterData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      submitContractFilter.value = AsyncData(error: e);
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

  ValueNotifier<List<FasteningMethod>> listFasteningMethod = ValueNotifier([
    FasteningMethod(item: '電子契約'),
    FasteningMethod(item: '書面契約'),
  ]);
}

class A{
  String item;
  A({required this.item});
}

class B{
  String item;
  B({required this.item});
}

class FasteningMethod{
  String item;
  FasteningMethod({required this.item});
}

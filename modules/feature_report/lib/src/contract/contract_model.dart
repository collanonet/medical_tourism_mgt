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

   ValueNotifier<AsyncData<List<ContractTemplateBasicInformationResponse>>>
      fetchContractFilterData = ValueNotifier(const AsyncData());
  Future<void> fetchContractFilter() async {
    try {
      fetchContractFilterData.value = const AsyncData(loading: true);
      final response =
          await reportRepository.getContractTemplateBasicInformation();
      fetchContractFilterData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }

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

  



  ValueNotifier<AsyncData<List<ReportContractResponse>>> filterData = ValueNotifier(const AsyncData());
  Future<void> postContractFilter({FormGroup? formGroup}) async {
    try{
      filterData.value = const AsyncData(loading: true);
       await reportRepository.getReportContract(
        documentName: formGroup?.control('documentName').value == null ? null : formGroup!.control('documentName').value,
        first: formGroup?.control('first').value == null ? null : formGroup!.control('first').value,
        second: formGroup?.control('second').value == null ? null : formGroup!.control('second').value,
        methodOfConclusion: formGroup?.control('methodOfConclusion').value == null ? null : formGroup!.control('methodOfConclusion').value
      );
  	  
    }catch(e){
      logger.d(e);
      filterData.value = AsyncData(error: e);
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

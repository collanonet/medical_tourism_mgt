
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_report/data_report.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProspectiveRankModel{

  ProspectiveRankModel({required this.reportRepository});
  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<List<ProspectiveRankResponse>>> prospectiveRankData = ValueNotifier(const AsyncData<List<ProspectiveRankResponse>>(data: [])); 
  Future<void> fetchProsiveRank(FormGroup formGroup) async{
    try{
      prospectiveRankData.value = const AsyncData(loading: true);
      final response = await reportRepository.getProspectiveRank();
      insertProspectiveRank(formGroup, response);

    }catch(e){
      logger.d(e);
      prospectiveRankData.value = AsyncData(error: e);
    }
  }

  void insertProspectiveRank(FormGroup formGroup,List<ProspectiveRankResponse> data){
     if (data.isNotEmpty) {
      var prospectiveArray = formGroup.control('type') as FormArray;
      prospectiveArray.clear();
      for (var item in data) {
        prospectiveArray.add(
          FormGroup({
             'id': FormControl<String>(value: item.id),
            'prospective_rank': FormControl<String>(value: item.prospectiveRank),
          }),
        );
      }
    }
  }

  ValueNotifier<AsyncData<ProspectiveRankResponse>> submit = ValueNotifier(const AsyncData());
  Future<void> submitProspectiveRank(FormGroup formGroup) async{
    try{
      submit.value = const AsyncData(loading: true);
     await formGroup.control('data').value.forEach((element){
        final response = ProspectiveRankResponse(
            id: element['id'].value,
            prospectiveRank: element['prospective_rank'].value
        );
         submit.value = AsyncData(data: response);
         prospectiveRankData.value = AsyncData(data: prospectiveRankData.value.data!..add(response));
      });
       


    }catch(e){
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }
  
}
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ItinerarySimpleVersionModel {

  ItinerarySimpleVersionModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;


  ValueNotifier<List<ExplanationVarious>> dataVarious = ValueNotifier([
    ExplanationVarious(various: 'PETCT'),
  ]);

  
  Future<void> fetchData(FormGroup formGroup) async {
    try{


    }catch(e){

    }
  }

  Future<void> submitData(FormGroup formGroup) async {
    try{


    }catch(e){

    }
  }

  ValueNotifier<AsyncData<DetailItinerarySimpleTitle>> titleData =ValueNotifier(const AsyncData());

  // Future<void> fetchTitleData(FormGroup formGroup) async {
  //   try{
  //     titleData.value = const AsyncData(loading: true);
  //   final response = await processChartRepository;
  //   insertItineraryTitle(formGroup, response);
  //   titleData.value = AsyncData(data: response);

  //   }catch(e){
  //     logger.d(e);
  //   }
    

  // }

  void insertItineraryTitle(FormGroup formGroup,DetailItinerarySimpleTitle? data){

  }
}

class ExplanationVarious{
  String various;

  ExplanationVarious({required this.various});
}
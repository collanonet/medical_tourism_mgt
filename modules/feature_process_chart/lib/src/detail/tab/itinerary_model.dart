import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ItineraryModel{
  ItineraryModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  ValueNotifier<AsyncData<DetailItineraryResponse>> itinerraryData = ValueNotifier(const AsyncData());
  Future<void> fetchItinerary() async{
    itinerraryData.value = const AsyncData(loading: true);
    final response = await processChartRepository.getDetailItinerary();

  }

  void insertItinerary(FormGroup formGroup,DetailItineraryResponse? data){
    formGroup.control('tour_name').value = data?.tourName;
    formGroup.control('Number_of_people').value = data?.numberOfPeople;
    formGroup.control('group').value = data?.group;
    formGroup.control('type').value = data?.type;

  }
}

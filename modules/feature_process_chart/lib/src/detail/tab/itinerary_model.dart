import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ItineraryModel {
  ItineraryModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  ValueNotifier<AsyncData<DetailItineraryResponse>> itinerraryData =
      ValueNotifier(const AsyncData());
  Future<void> fetchItinerary(FormGroup formGroup) async {
    try{
      itinerraryData.value = const AsyncData(loading: true);
    final response = await processChartRepository.getDetailItinerary();
      insertItinerary(formGroup, response);
    }catch(e){
      logger.d(e);
    }
    
    
  }

  void insertItinerary(FormGroup formGroup, DetailItineraryResponse? data) {
    var patientName = formGroup.control('patientNames') as FormArray;
    for (var element in data!.patientNames!) {
      patientName.add(
        FormGroup(
          {
            'patientName':
                FormControl<String>(value: element.patientName), // 患者名
          },
        ),
      );
    }
    formGroup.control('tour_name').value = data.tourName;
    formGroup.control('Number_of_people').value = data.numberOfPeople;
    formGroup.control('group').value = data.group;
    formGroup.control('type').value = data.type;

    var day = formGroup.control('day') as FormArray;
    for (var element in data.days!) {
      for (var elementg in element.group!) {
        var task = formGroup.control('task') as FormArray;
        for(var elementk in elementg.tasks!){
          task.add(
            FormGroup(
              {
                'place_name': FormControl<String>(value: elementk.placeName), 
                'Time_from': FormControl<String>(value: elementk.timeFrom),
                'Time_to': FormControl<String>(value: elementk.timeTo),
                'traffic': FormControl<String>(value: elementk.traffic), 
                'Itinerary': FormControl<String>(value: elementk.itinerary), 
              },
            ),
          );
        }
        day.add(
          FormGroup(
            {
              'task': task,
            },
          ),
        );
      }
      day.add(
        FormGroup(
          {
            'date': FormControl<String>(value: element.date), // 日付
            'meal': FormControl<String>(value: element.meal), // 食事
            'place_name': FormControl<String>(value: element.placeName), // 地名
            'Accommodation': FormControl<String>(value: element.accommodation),
            'group': day,
          },
        ),
      );
    }
  }

  ValueNotifier<AsyncData<DetailItineraryResponse>> submitData = ValueNotifier(const AsyncData());
  Future<void> submitItinerary(FormGroup formGroup) async {
    try{
      submitData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailItinerary(
        DetailIneraryRequest(
          tourName: formGroup.control('tour_name').value,
          numberOfPeople: formGroup.control('Number_of_people').value,
          group: formGroup.control('group').value,
          type: formGroup.control('type').value,
          patientName: formGroup.control('patientNames').value,
          listday: formGroup.control('day').value
        )
      );
      submitData.value = AsyncData(data: response);
      itinerraryData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submitData.value = AsyncData(error: e);
    }

  }
}

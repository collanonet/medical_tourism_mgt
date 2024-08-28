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
  ValueNotifier<String?> id = ValueNotifier(null);

  ValueNotifier<AsyncData<DetailItineraryResponse>> itinerraryData =
      ValueNotifier(const AsyncData());
  Future<void> fetchItinerary(FormGroup formGroup, {String? id}) async {
    try {
      itinerraryData.value = const AsyncData(loading: true);
      this.id.value = id;
      if (id != null) {
        final response = await processChartRepository.getDetailItinerary(id);
        insertItinerary(formGroup, response);
        itinerraryData.value = AsyncData(data: response);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  void insertItinerary(FormGroup formGroup, DetailItineraryResponse? data) {
    try {
      FormArray patientName = FormArray([]);
      for (var element in data!.patient!) {
        patientName.add(
          FormGroup(
            {
              'patientName': FormControl<String>(value: element), // 患者名
            },
          ),
        );
      }
      formGroup.control('tourName').value = data.tourName;
      formGroup.control('peopleNumber').value = data.peopleNumber;
      formGroup.control('group').value = data.group;
      formGroup.control('classification').value = data.classification;
      formGroup.control('_id').value = data.id;

      FormArray days = FormArray([]);
      // formGroup.control('day').value = days;
      if (data.day != null && data.day!.isNotEmpty) {
        for (var e in data.day!) {
          days.add(
            FormGroup(
              {
                'date': FormControl<DateTime>(value: e.date), // 日付
                'morning': FormControl<bool>(value: false),
                'noon': FormControl<bool>(value: false),
                'evening': FormControl<bool>(value: false),
                'placeName': FormControl<String>(value: e.placeName), // 地名
                'placeStay':
                    FormControl<String>(value: e.accommodation), // 宿泊場所
                'groups': FormArray([]), // グループ
              },
            ),
          );
        }
      } else {
        FormGroup(
          {
            'date': FormControl<DateTime>(), // 日付
            'morning': FormControl<bool>(value: false),
            'noon': FormControl<bool>(value: false),
            'evening': FormControl<bool>(value: false),
            'placeName': FormControl<String>(value: ''), // 地名
            'placeStay': FormControl<String>(value: ''), // 宿泊場所
            'groups': FormArray([]), // グループ
          },
        );
      }
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<DetailItineraryResponse>> submitData =
      ValueNotifier(const AsyncData());
  Future<void> submitItinerary(FormGroup formGroup) async {
    try {
      List<String>? patients = [];
      await formGroup.control('patient').value.forEach((element) {
        patients.add(element['patientName']);
      });

      List<Day>? days = [];
      await formGroup.control('day').value.forEach(
        (element) async {
          List<bool> meals = [];
          meals.add(element['morning']);
          meals.add(element['noon']);
          meals.add(element['evening']);

          List<Group>? groups = [];
          await element['groups'].forEach(
            (groupElement) {
              List<Task>? tasks = [];
              groupElement['task'].forEach(
                (taskElement) async {
                  tasks.add(
                    Task(
                      placeName: taskElement['placeName'],
                      timeFrom: taskElement['timeFrom'],
                      timeTo: taskElement['timeTo'],
                      transportation: taskElement['transportation'],
                      itinerary: taskElement['itinerary'],
                    ),
                  );
                  logger.d('placeName ${taskElement['placeName']}');
                },
              );

              groups.add(
                Group(task: tasks),
              );
            },
          );
          days.add(
            Day(
              date: element['date'],
              meals: meals,
              placeName: element['placeName'],
              placeStay: element['placeStay'],
              groups: groups,
            ),
          );
          logger.d('date ${element['date']}');
          logger.d('placeName ${element['placeName']}');
          logger.d('placeStay ${element['placeStay']}');
          logger.d('days ${days}');
        },
      );
      submitData.value = const AsyncData(loading: true);
      DetailIneraryRequest request = DetailIneraryRequest(
        patient: patients,
        tourName: formGroup.control('tourName').value,
        peopleNumber: formGroup.control('peopleNumber').value,
        group: formGroup.control('group').value,
        classification: formGroup.control('classification').value,
        day: days,
      );

      final response =
          await processChartRepository.postDetailItinerary(request);
      submitData.value = AsyncData(data: response);
      itinerraryData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitData.value = AsyncData(error: e);
    }
  }
}

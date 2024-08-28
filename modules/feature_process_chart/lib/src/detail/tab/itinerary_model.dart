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

  ValueNotifier<AsyncData<List<DetailItineraryResponse>>> itinerraryData =
      ValueNotifier(const AsyncData<List<DetailItineraryResponse>>(data: []));
  Future<void> fetchItinerary(FormGroup formGroup,{required String id}) async {
    try {
      itinerraryData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailItinerary(id: id);
      // insertItinerary(formGroup, response);
      itinerraryData.value = AsyncData(data: response);
      logger.d(response.toList());
    } catch (e) {
      logger.d(e);
    }
  }

  void insertItinerary(FormGroup formGroup, DetailItineraryResponse? data) {
    var patientName = formGroup.control('patient') as FormArray;
    for (var element in data!.patient!) {
      patientName.add(
        FormGroup(
          {
            'patientName': FormControl<String>(value: ''), // 患者名
          },
        ),
      );
    }
    formGroup.control('tourName').value = data.tourName;
    formGroup.control('peopleNumber').value = data.peopleNumber;
    formGroup.control('group').value = data.group;
    formGroup.control('classification').value = data.classification;

    var day = formGroup.control('day') as FormArray;
    for (var element in data.day!) {
      for (var elementg in element.groups!) {
        var task = formGroup.control('task') as FormArray;
        for (var elementk in elementg.task!) {
          task.add(
            FormGroup(
              {
                'placeName': FormControl<String>(value: elementk.placeName),
                'timeFrom': FormControl<String>(value: elementk.timeFrom),
                'timeTo': FormControl<String>(value: elementk.timeTo),
                'transportation':
                    FormControl<String>(value: elementk.transportation),
                'itinerary': FormControl<String>(value: elementk.itinerary),
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
            'placeName': FormControl<String>(value: element.placeName), // 地名
            'placeStay': FormControl<String>(value: element.accommodation),
            'group': day,
          },
        ),
      );
    }
  }

  ValueNotifier<AsyncData<DetailItineraryResponse>> submitData =
      ValueNotifier(const AsyncData());
  Future<void> submitItinerary(FormGroup formGroup) async {
    try {
      List<String> patients = [];
      await formGroup.control('patient').value.forEach((element) {
        patients.add(element['patientName']);
      });

      List<Day> days = [];
      await formGroup.control('day').value.forEach(
        (element) async {
          List<bool> meals = [];
          meals.add(element['morning']);
          meals.add(element['noon']);
          meals.add(element['evening']);

          List<Group> groups = [];
          await element['groups'].forEach(
            (groupElement) {
              List<Task> tasks = [];
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
        day: [
          Day(
            date: DateTime.now(),
            meals: [true, false, true],
            placeName: '新��',
            placeStay: '新�����',
            groups: [
              Group(task: [
                Task(
                  placeName: '新�����',
                  timeFrom: '08:00',
                  timeTo: '10:00',
                  transportation: '新����',
                  itinerary: '新�����',
                ),
              ]),
            ],
          ),
        ],
      );

      final response =
          await processChartRepository.postDetailItinerary(request);
      submitData.value = AsyncData(data: response);
      itinerraryData.value =
          AsyncData(data: itinerraryData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submitData.value = AsyncData(error: e);
    }
  }
}

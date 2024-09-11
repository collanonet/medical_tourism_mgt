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

  Future<void> fetchItinerary(FormGroup formGroup, {String? id}) async {
    try {
      if (id != null) {
        itinerraryData.value = const AsyncData(loading: true);
        final response =
            await processChartRepository.getDetailItinerary(id: id);
        await insertItinerary(formGroup, response);
        itinerraryData.value = AsyncData(data: response);
        logger.d('fetchItinerary success ${response.toJson()}');
      }
    } catch (e) {
      logger.d('error');
      logger.d(e);
      itinerraryData.value = AsyncData(error: e);
    }
  }

  Future<void> insertItinerary(
      FormGroup formGroup, DetailItineraryResponse data) async {
    try {
      // Debug: Check if data is received
      logger.d('Received data: ${data.toJson()}');

      formGroup.control('tourName').value = data.tourName;
      formGroup.control('peopleNumber').value = data.peopleNumber;
      formGroup.control('group').value = data.group;
      formGroup.control('classification').value = data.classification;
      formGroup.control('_id').value = data.id;

      List<FormGroup> days = [];

      data.day?.forEach((e) {
        logger.d('Processing day: ${e.toJson()}');
        List<FormGroup> groups = [];

        e.groups?.forEach((element) {
          List<FormGroup> tasks = [];
          element.tasks?.forEach((task) {
            tasks.add(
              FormGroup({
                '_id': FormControl<String>(value: task.id),
                'placeName': FormControl<String>(value: task.placeName),
                'timeFrom': FormControl<String>(value: task.timeFrom),
                'timeTo': FormControl<String>(value: task.timeTo),
                'transportation':
                    FormControl<String>(value: task.transportation),
                'itinerary': FormControl<String>(value: task.itinerary),
              }),
            );
          });

          if (element.tasks == null) {
            tasks = [
              FormGroup({
                '_id': FormControl<String>(),
                'placeName': FormControl<String>(value: ''),
                'timeFrom': FormControl<String>(value: ''),
                'timeTo': FormControl<String>(value: ''),
                'transportation': FormControl<String>(value: ''),
                'itinerary': FormControl<String>(value: ''),
              }),
            ];
          }

          groups.add(FormGroup({'tasks': FormArray(tasks)}));
        });

        if (e.groups == null) {
          groups = [
            FormGroup({
              'tasks': FormArray([
                FormGroup({
                  '_id': FormControl<String>(),
                  'placeName': FormControl<String>(value: ''),
                  'timeFrom': FormControl<String>(value: ''),
                  'timeTo': FormControl<String>(value: ''),
                  'transportation': FormControl<String>(value: ''),
                  'itinerary': FormControl<String>(value: ''),
                }),
              ]),
            }),
          ];
        }

        days.add(
          FormGroup({
            '_id': FormControl<String>(value: e.id),
            'date': FormControl<DateTime>(value: e.date),
            'meals': FormControl<List<bool>>(value: e.meals ?? []),
            'morning': FormControl<bool>(value: e.meals?[0] ?? false),
            'noon': FormControl<bool>(value: e.meals?[1] ?? false),
            'evening': FormControl<bool>(value: e.meals?[2] ?? false),
            'placeName': FormControl<String>(value: e.placeName),
            'placeStay': FormControl<String>(value: e.placeStay),
            'groups': FormArray(groups),
          }),
        );
      });

      if (data.day == null || data.day!.isEmpty) {
        days = [
          FormGroup({
            '_id': FormControl<String>(value: ''),
            'date': FormControl<DateTime>(),
            'meals': FormControl<List<bool>>(value: []),
            'morning': FormControl<bool>(value: false),
            'noon': FormControl<bool>(value: false),
            'evening': FormControl<bool>(value: false),
            'placeName': FormControl<String>(value: ''),
            'placeStay': FormControl<String>(value: ''),
            'groups': FormArray([
              FormGroup({
                'tasks': FormArray([
                  FormGroup({
                    '_id': FormControl<String>(),
                    'placeName': FormControl<String>(value: ''),
                    'timeFrom': FormControl<String>(value: ''),
                    'timeTo': FormControl<String>(value: ''),
                    'transportation': FormControl<String>(value: ''),
                    'itinerary': FormControl<String>(value: ''),
                  }),
                ]),
              }),
            ]),
          }),
        ];
      }

      FormArray daysForm = formGroup.control('day') as FormArray;

      if (days.isNotEmpty) {
        daysForm.clear();
        daysForm.addAll(days);
      }

      // Debug: Check if form is updated
      logger.d('Form updated: ${formGroup.value}');
    } catch (e) {
      logger.d('Error: $e');
    }
  }

  ValueNotifier<AsyncData<DetailItineraryResponse>> submitData =
      ValueNotifier(const AsyncData());

  Future<void> submitItinerary(FormGroup formGroup) async {
    try {
      List<String>? patients = [];
      formGroup.control('patient').value.forEach((element) {
        patients.add(element['patientName']);
      });

      List<dynamic>? days = [];
      formGroup.control('day').value.forEach(
        (element) {
          List<bool> meals = [];
          meals.add(element['morning']);
          meals.add(element['noon']);
          meals.add(element['evening']);

          List<Group>? groups = [];
          element['groups'].forEach(
            (groupElement) {
              List<Task>? tasks = [];
              groupElement['tasks'].forEach(
                (taskElement) {
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
                Group(tasks: tasks),
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
        },
      );
      submitData.value = const AsyncData(loading: true);
      DetailIneraryRequest request = DetailIneraryRequest(
        patient: [],
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

  ValueNotifier<List<Type>> classification = ValueNotifier([
    Type(type: '新規見積依頼'),
    Type(type: '新規手配依頼'),
    Type(type: '変更'),
    Type(type: 'キャンセル'),
    Type(type: 'Final'),
  ]);
}

class Type {
  final String type;

  Type({required this.type});
}

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
  // ValueNotifier<String?> id = ValueNotifier(null);

  ValueNotifier<AsyncData<DetailItineraryResponse>> itinerraryData =
      ValueNotifier(const AsyncData());

  Future<void> fetchItinerary(FormGroup formGroup, {String? id}) async {
    try {
      // this.id.value = id;
      if (id != null) {
        itinerraryData.value = const AsyncData(loading: true);
        final response =
            await processChartRepository.getDetailItinerary(id: id);
        insertItinerary(formGroup, response);
        itinerraryData.value = AsyncData(data: response);
        logger.d('fetchItinerary success ${response.toJson()}');
      }
    } catch (e) {
      logger.d('error');
      logger.d(e);
      itinerraryData.value = AsyncData(error: e);
    }
  }

  void insertItinerary(FormGroup formGroup, DetailItineraryResponse data) {
    try {
      // FormArray patientName = FormArray([]);
      // for (var element in data!.patient!) {
      //   patientName.add(
      //     FormGroup(
      //       {
      //         'patientName': FormControl<String>(value: element), // 患者名
      //       },
      //     ),
      //   );
      // }
      formGroup.control('tourName').value = data.tourName;
      formGroup.control('peopleNumber').value = data.peopleNumber;
      formGroup.control('group').value = data.group;
      formGroup.control('classification').value = data.classification;
      formGroup.control('_id').value = data.id;

      FormArray days = FormArray([]);

      data.day?.forEach((e) {
        logger.d('date ${e.toJson()}');
        // // work with groups
        FormArray groups = FormArray([]);

        e.groups?.forEach((element) {
          // working with tasks
          FormArray tasks = FormArray([]);
          element.tasks?.forEach(
            (element) {
              tasks.add(
                FormGroup(
                  {
                    '_id': FormControl<String>(value: element.id),
                    'placeName': FormControl<String>(value: element.placeName),
                    'timeFrom': FormControl<String>(value: element.timeFrom),
                    'timeTo': FormControl<String>(value: element.timeTo),
                    'transportation':
                        FormControl<String>(value: element.transportation),
                    'itinerary': FormControl<String>(value: element.itinerary),
                  },
                ),
              );
            },
          );

          // insert default form if task null
          if (element.tasks == null) {
            tasks = FormArray(
              [
                FormGroup(
                  {
                    '_id': FormControl<String>(),
                    'placeName': FormControl<String>(value: ''), // 地名
                    'timeFrom': FormControl<String>(value: ''), // 時刻（自）
                    'timeTo': FormControl<String>(value: ''), // 時刻（至）
                    'transportation': FormControl<String>(value: ''), // 交通
                    'itinerary': FormControl<String>(value: ''), // 行程
                  },
                ),
              ],
            );
          }

          groups.add(FormGroup({
            'tasks': tasks,
          }));
        });

        // insert default form if groups null
        if (e.groups == null) {
          groups = FormArray(
            // グループ
            [
              FormGroup(
                {
                  'tasks': FormArray(
                    [
                      FormGroup(
                        {
                          '_id': FormControl<String>(),
                          'placeName': FormControl<String>(value: ''), // 地名
                          'timeFrom': FormControl<String>(value: ''), // 時刻（自）
                          'timeTo': FormControl<String>(value: ''), // 時刻（至）
                          'transportation':
                              FormControl<String>(value: ''), // 交通
                          'itinerary': FormControl<String>(value: ''), // 行程
                        },
                      ),
                    ],
                  ),
                },
              ),
            ],
          );
        }

        days.add(
          FormGroup(
            {
              '_id': FormControl<String>(value: e.id),
              'date': FormControl<DateTime>(value: e.date), // 日付
              'meals': FormControl<List<bool>>(value: e.meals ?? []),
              'morning': FormControl<bool>(value: e.meals?[0] ?? false),
              'noon': FormControl<bool>(value: e.meals?[1] ?? false),
              'evening': FormControl<bool>(value: e.meals?[2] ?? false),
              'placeName': FormControl<String>(value: e.placeName), // 地名
              'placeStay': FormControl<String>(value: e.placeStay), // 宿泊場所
              'groups': groups,
            },
          ),
        );
      });

      if (data.day == null || data.day!.isEmpty) {
        days = FormArray(
          [
            FormGroup(
              {
                '_id': FormControl<String>(value: ''),
                'date': FormControl<DateTime>(), // 日付
                'meals': FormControl<List<bool>>(value: []),
                //meals
                'morning': FormControl<bool>(value: false),
                'noon': FormControl<bool>(value: false),
                'evening': FormControl<bool>(value: false),

                'placeName': FormControl<String>(value: ''), // 地名
                'placeStay': FormControl<String>(value: ''), // 宿泊場所
                'groups': FormArray(
                  // グループ
                  [
                    FormGroup(
                      {
                        'task': FormArray(
                          [
                            FormGroup(
                              {
                                '_id': FormControl<String>(),
                                'placeName':
                                    FormControl<String>(value: ''), // 地名
                                'timeFrom':
                                    FormControl<String>(value: ''), // 時刻（自）
                                'timeTo':
                                    FormControl<String>(value: ''), // 時刻（至）
                                'transportation':
                                    FormControl<String>(value: ''), // 交通
                                'itinerary':
                                    FormControl<String>(value: ''), // 行程
                              },
                            ),
                          ],
                        ),
                      },
                    ),
                  ],
                ),
              },
            ),
          ],
        );
      }

      logger.d('days ${days.value}');
      formGroup = FormGroup({
        'patient': FormArray(
          [
            FormGroup(
              {
                'patientName': FormControl<String>(value: ''), // 患者名
              },
            ),
            FormGroup(
              {
                'patientName': FormControl<String>(value: ''), // 患者名
              },
            ),
            FormGroup(
              {
                'patientName': FormControl<String>(value: ''), // 患者名
              },
            ),
          ],
        ),
        'tourName': FormControl<String>(value: data.tourName),
        'peopleNumber': FormControl<int>(value: data.peopleNumber),
        'group': FormControl<int>(value: data.group),
        'classification': FormControl<String>(value: data.classification),
        'day': days,
      });
    } catch (e) {
      logger.d(e);
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
      if (formGroup.control('_id').value == null) {
        final response =
            await processChartRepository.postDetailItinerary(request);
        submitData.value = AsyncData(data: response);
        itinerraryData.value = AsyncData(data: response);
      } else {
        final result = await processChartRepository.putDetailItinerary(
            request, formGroup.control('_id').value);
        submitData.value = AsyncData(data: result);
        itinerraryData.value = AsyncData(data: result);
      }
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

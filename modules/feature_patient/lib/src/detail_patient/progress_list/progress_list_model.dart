// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:collection/collection.dart';
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ProgressListModel {
  ProgressListModel({
    required this.patientRepository,
  });

  final PatientRepository patientRepository;

  ValueNotifier<AsyncData<MedicalRecord>> medicalRecord =
      ValueNotifier<AsyncData<MedicalRecord>>(const AsyncData());

  List<ItemProgress> titleList = [
    ItemProgress(tag: '患者', task: 'お問い合せ'),
    ItemProgress(tag: '患者', task: 'お申込み'),
    ItemProgress(tag: '患者', task: '資料提出'),
    ItemProgress(tag: '当社', task: '医療機関の選定・ご提案'),
    ItemProgress(tag: '患者', task: '契約締結・入金'),
    ItemProgress(tag: '当社', task: '資料翻訳・病院問い合わせ'),
    ItemProgress(tag: '病院', task: '訪日治療適応判断（オンライン・書面）'),
    ItemProgress(tag: '当社', task: '来日決定・お見積提示・入金'),
    ItemProgress(tag: '当社', task: '医療ビザ申請・来日日程確定'),
    ItemProgress(tag: '当社', task: '医療機関の正式予約'),
    ItemProgress(tag: '患者', task: '来日治療・受診サポート'),
    ItemProgress(tag: '当社', task: '治療終了・帰国・フォローアップ'),
  ];

  Future<void> getMedicalRecords(FormGroup formGroup,
      {String? patientId}) async {
    if (patientId != null) {
      try {
        medicalRecord.value = const AsyncData(loading: true);

        var result = await patientRepository.medicalRecordsByPatient(patientId);
        if (result.isNotEmpty) {
          medicalRecord.value = AsyncData(data: result.first);
          logger.d(medicalRecord.value.requireData.id);
          await getMedicalRecordsProgress(formGroup);
        } else {
          medicalRecord.value = const AsyncData();
        }
      } catch (e) {
        logger.e(e);
        medicalRecord.value = AsyncData(error: e);
      }
    }
  }

  ValueNotifier<AsyncData<List<MedicalRecordProgress>>> medicalRecordsProgress =
      ValueNotifier(const AsyncData());

  Future<void> getMedicalRecordsProgress(FormGroup formGroup) async {
    try {
      medicalRecordsProgress.value = const AsyncData(loading: true);

      var result =
          await patientRepository.medicalRecordsProgressByMedicalRecord(
              medicalRecord.value.requireData.id);
      insertDataAllForm(formGroup, result);
      medicalRecordsProgress.value = AsyncData(data: result);
    } catch (e) {
      logger.d(e);
      medicalRecordsProgress.value = AsyncData(error: e);
    }
  }

  Future<void> insertDataAllForm(
    FormGroup formGroup,
    List<MedicalRecordProgress> data,
  ) async {
    if (data.isNotEmpty) {
      // Group by type
      var groupByType = groupBy(data, (MedicalRecordProgress e) => e.type);

      FormArray formArray = formGroup.control('progressList') as FormArray;
      formArray.clear();

      groupByType.forEach((type, records) {
        // Create form group for each group
        int index = groupByType.keys.toList().indexOf(type);
        FormArray formArrayProgress = FormArray([]);

        // Insert data for each group
        for (var record in records) {
          formArrayProgress.add(FormGroup({
            'id': FormControl<String>(
              value: record.id,
            ),
            'completed': FormControl<bool>(value: record.completed),
            'key': FormControl<String>(
              value: record.key,
            ),
            'tag': FormControl<String>(
              value: record.tag,
            ),
            'task': FormControl<String>(
              value: record.task,
              disabled: true,
            ),
            'completionDate': FormControl<DateTime>(
              value: record.completionDate,
              validators: [
                Validators.pattern(
                  ValidatorRegExp.date,
                ),
              ],
            ),
            'remarks': FormControl<String>(
              value: record.remarks,
            ),
            'medicalRecord': FormControl<String>(
              value: record.medicalRecord,
            ),
            'type': FormControl<String>(
              value: index.toString(),
            ),
          }));
        }

        formArray.add(FormGroup({'progress': formArrayProgress}));
      });
    } else {
      FormArray formArray = formGroup.control('progressList') as FormArray;
      formArray.clear();
      FormArray formArrayProgress = FormArray([]);
      for (var item in titleList) {
        formArrayProgress.add(FormGroup({
          'id': FormControl<String>(),
          'completed': FormControl<bool>(value: false),
          'key': FormControl<String>(),
          'tag': FormControl<String>(value: item.tag),
          'task': FormControl<String>(value: item.task),
          'completionDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'remarks': FormControl<String>(),
          'medicalRecord': FormControl<String>(),
          'type': FormControl<String>(value: "0"),
        }));
      }
      formArray.add(FormGroup({'progress': formArrayProgress}));

      FormArray formArrayProgress2 = FormArray([]);

      for (var item in titleList) {
        formArrayProgress2.add(FormGroup({
          'id': FormControl<String>(),
          'completed': FormControl<bool>(value: false),
          'key': FormControl<String>(),
          'tag': FormControl<String>(value: item.tag),
          'task': FormControl<String>(value: item.task),
          'completionDate': FormControl<DateTime>(
            validators: [
              Validators.pattern(
                ValidatorRegExp.date,
              ),
            ],
          ),
          'remarks': FormControl<String>(),
          'medicalRecord': FormControl<String>(),
          'type': FormControl<String>(value: '1'),
        }));
      }
      formArray.add(FormGroup({'progress': formArrayProgress2}));
    }
  }

  ValueNotifier<AsyncData<dynamic>> submit = ValueNotifier(const AsyncData());

  Future<void> submitData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);

      await formGroup.control('progressList').value.forEach((element) {
        element['progress'].forEach((element) async {
          logger.d(element);
          if (element['id'] == null) {
            // await patientRepository.postMedicalRecordProgress(mapData(element));
          } else {
            // await patientRepository.putMedicalRecordProgress(
            //     element['id'], mapData(element));
          }
        });
      });

      submit.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  MedicalRecordProgressRequest mapData(dynamic element) {
    return MedicalRecordProgressRequest(
      key: element['key'] ?? '',
      tag: element['tag'] ?? '',
      task: element['task'] ?? '',
      completed: element['completed'] ?? false,
      completionDate: element['completionDate'],
      remarks: element['remarks'] ?? '',
      medicalRecord: medicalRecord.value.requireData.id,
      type: element['type'],
    );
  }
}

class ItemProgress {
  String tag;
  String task;

  ItemProgress({
    required this.tag,
    required this.task,
  });
}

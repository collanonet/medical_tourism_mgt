import 'package:collection/collection.dart';
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_patient/data_patient.dart';
import 'package:flutter/cupertino.dart';
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
          ),
          'completionDate': FormControl<DateTime>(
            value: record.completionDate,
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
  }

  ValueNotifier<AsyncData<dynamic>> submit = ValueNotifier(const AsyncData());

  Future<void> submitData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);

      await formGroup.control('progressList').value.forEach((element) {
        element['progress'].forEach((element) async {
          if (element['id'] == null) {
            await patientRepository.postMedicalRecordProgress(mapData(element));
          } else {
            await patientRepository.putMedicalRecordProgress(
                element['id'], mapData(element));
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

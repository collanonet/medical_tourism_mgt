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

  final List<ProgressSectionTemplate> sectionTemplates = [
    ProgressSectionTemplate(
      id: 'treatment',
      title: '治療',
      displayTitle: '訪日治療の流れ',
      serverType: 'treatment',
      apiType: 'treatment',
      legacyTypes: ['treatment'],
      isDefault: true,
    ),
    ProgressSectionTemplate(
      id: 'medical_checkup',
      title: '健診',
      displayTitle: '訪日健診の流れ',
      serverType: 'medical_checkup',
      apiType: '0',
      legacyTypes: ['0', 'medical_checkup'],
      isDefault: true,
    ),
    ProgressSectionTemplate(
      id: 'regenerative',
      title: '再生医療',
      displayTitle: '訪日再生医療の流れ',
      serverType: 'regenerative',
      apiType: '1',
      legacyTypes: ['1', 'regenerative'],
    ),
    ProgressSectionTemplate(
      id: 'beauty',
      title: '美容',
      displayTitle: '訪日美容医療の流れ',
      serverType: 'beauty',
      apiType: 'beauty',
      legacyTypes: ['beauty'],
    ),
    ProgressSectionTemplate(
      id: 'blood_purification',
      title: '血液浄化療法（アフェレーシス）・透析',
      displayTitle: '訪日血液浄化療法の流れ',
      serverType: 'blood_purification',
      apiType: 'blood_purification',
      legacyTypes: ['blood_purification'],
    ),
    ProgressSectionTemplate(
      id: 'risk_check',
      title: 'リスク検査',
      displayTitle: '訪日リスク検査の流れ',
      serverType: 'risk_check',
      apiType: 'risk_check',
      legacyTypes: ['risk_check'],
    ),
    ProgressSectionTemplate(
      id: 'others',
      title: 'その他',
      displayTitle: 'その他の流れ',
      serverType: 'others',
      apiType: 'others',
      legacyTypes: ['others'],
    ),
  ];

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
      await _updateProgressFromRecords(result);
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
    FormArray formArray = formGroup.control('progressList') as FormArray;
    formArray.clear();

    if (data.isNotEmpty) {
      final Map<String, List<MedicalRecordProgress>> sectionRecords =
          <String, List<MedicalRecordProgress>>{};

      for (final record in data) {
        final template = _resolveTemplateForRecord(record);
        sectionRecords.putIfAbsent(template.id, () => <MedicalRecordProgress>[])
          ..add(record);
      }

      for (final template in sectionTemplates) {
        final records = sectionRecords[template.id];
        if (records != null && records.isNotEmpty) {
          formArray.add(_createSectionGroupFromRecords(template, records));
        } else if (template.isDefault) {
          formArray.add(createSectionFormGroup(template));
        }
      }

      if (formArray.controls.isEmpty) {
        final defaults = sectionTemplates.where((e) => e.isDefault).toList();
        final templatesToAdd =
            defaults.isEmpty ? [sectionTemplates.first] : defaults;
        for (final template in templatesToAdd) {
          formArray.add(createSectionFormGroup(template));
        }
      }
    } else {
      final defaults = sectionTemplates.where((e) => e.isDefault).toList();
      final templatesToAdd =
          defaults.isEmpty ? [sectionTemplates.first] : defaults;
      for (final template in templatesToAdd) {
        formArray.add(createSectionFormGroup(template));
      }
    }
  }

  ValueNotifier<AsyncData<dynamic>> submit = ValueNotifier(const AsyncData());

  Future<void> submitData(FormGroup formGroup) async {
    try {
      logger.d('submitData開始');
      submit.value = const AsyncData(loading: true);

      final progressListControl = formGroup.control('progressList');
      logger.d('progressListコントロール: $progressListControl');
      logger.d('progressListの値: ${progressListControl.value}');

      for (var element in progressListControl.value) {
        logger.d('処理中の要素: $element');
        for (var progress in element['progress']) {
          logger.d('処理中の進捗: $progress');
          if (progress['_id'] == null || progress['_id'] == '') {
            logger.d('新規作成: $progress');
            await patientRepository
                .postMedicalRecordProgress(mapData(progress));
          } else {
            logger.d('更新: ${progress['_id']} - $progress');
            await patientRepository.putMedicalRecordProgress(
                progress['_id'], mapData(progress));
          }
        }
      }
      logger.d('submitData完了');
      await _updateProgressFromFormGroup(formGroup);
    if (medicalRecord.value.hasData) {
      await getMedicalRecords(
        formGroup,
        patientId: medicalRecord.value.requireData.patient,
      );
    }
      submit.value = const AsyncData(data: true);
    } catch (e) {
      logger.e('submitDataでエラーが発生: $e');
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

  Future<void> _updateProgressFromRecords(
    List<MedicalRecordProgress> records,
  ) async {
    final latestTask = _findLatestTaskFromRecords(records);
    await _persistProgress(latestTask);
  }

  Future<void> _updateProgressFromFormGroup(FormGroup formGroup) async {
    final control = formGroup.control('progressList');
    final value = control.value;
    final latestTask = _findLatestTaskFromDynamicList(value);
    await _persistProgress(latestTask);
  }

  String? _findLatestTaskFromRecords(List<MedicalRecordProgress> records) {
    final completed = records
        .where((record) => record.completionDate != null)
        .toList(growable: false);

    if (completed.isEmpty) {
      return null;
    }

    completed.sort((a, b) {
      final cmp = b.completionDate!.compareTo(a.completionDate!);
      if (cmp != 0) {
        return cmp;
      }

      final orderA = _resolveOrder(a.task);
      final orderB = _resolveOrder(b.task);
      return orderB.compareTo(orderA);
    });

    return completed.first.task;
  }

  String? _findLatestTaskFromDynamicList(dynamic value) {
    if (value is! List) {
      return null;
    }

    final entries = <_ProgressCandidate>[];

    for (final element in value) {
      if (element is! Map<String, dynamic>) continue;
      final progressList = element['progress'];
      if (progressList is! List) continue;

      for (final rawItem in progressList) {
        if (rawItem is! Map<String, dynamic>) continue;
        final task = rawItem['task'] as String?;
        final completionDate =
            _tryParseCompletionDate(rawItem['completionDate']);

        if (task == null || task.trim().isEmpty || completionDate == null) {
          continue;
        }

        final order = _resolveOrder(task);
        entries.add(
          _ProgressCandidate(
            task: task,
            completionDate: completionDate,
            order: order,
          ),
        );
      }
    }

    if (entries.isEmpty) {
      return null;
    }

    entries.sort((a, b) {
      final cmp = b.completionDate.compareTo(a.completionDate);
      if (cmp != 0) {
        return cmp;
      }
      return b.order.compareTo(a.order);
    });

    return entries.first.task;
  }

  DateTime? _tryParseCompletionDate(dynamic value) {
    if (value is DateTime) {
      return value;
    }

    if (value is String && value.isNotEmpty) {
      return DateTime.tryParse(value);
    }
    return null;
  }

  int _resolveOrder(String? task) {
    if (task == null) {
      return -1;
    }
    final index = titleList.indexWhere((item) => item.task == task);
    return index >= 0 ? index : -1;
  }

  Future<void> _persistProgress(String? latestTask) async {
    if (!medicalRecord.value.hasData) {
      return;
    }

    final record = medicalRecord.value.requireData;
    final normalized = latestTask?.trim();
    final newProgress =
        (normalized == null || normalized.isEmpty) ? null : normalized;

    if (record.progress == newProgress) {
      return;
    }

    record.progress = newProgress;
    medicalRecord.value = medicalRecord.value.copyWith(data: record);

    try {
      await patientRepository.putMedicalRecord(
        record.id,
        MedicalRecordRequest(
          dateOfBirth: record.dateOfBirth,
          age: record.age,
          height: record.height,
          weight: record.weight,
          gender: record.gender,
          arrivalDate: record.arrivalDate,
          consultationDate: record.consultationDate,
          returnDate: record.returnDate,
          proposalNumber: record.proposalNumber,
          receptionDate: record.receptionDate,
          type: record.type,
          progress: record.progress,
          advancePaymentDate: record.advancePaymentDate,
          receivingMethod: record.receivingMethod,
          receivingMethodOther: record.receivingMethodOther,
          memo: record.memo,
          patient: record.patient,
        ),
      );
    } catch (e) {
      logger.e('進捗の更新に失敗しました: $e');
    }
  }

  ProgressSectionTemplate resolveTemplateByType(
    String? type, {
    int fallbackIndex = 0,
  }) {
    if (type != null) {
      final match = sectionTemplates.firstWhereOrNull(
        (template) => template.matches(type),
      );
      if (match != null) {
        return match;
      }
    }
    if (fallbackIndex >= 0 && fallbackIndex < sectionTemplates.length) {
      return sectionTemplates[fallbackIndex];
    }
    return sectionTemplates.first;
  }

  ProgressSectionTemplate resolveTemplateById(
    String? id, {
    int fallbackIndex = 0,
  }) {
    if (id != null) {
      final match = sectionTemplates.firstWhereOrNull(
        (template) => template.id == id,
      );
      if (match != null) {
        return match;
      }
    }
    if (fallbackIndex >= 0 && fallbackIndex < sectionTemplates.length) {
      return sectionTemplates[fallbackIndex];
    }
    return sectionTemplates.first;
  }

  ProgressSectionTemplate _resolveTemplateForRecord(
      MedicalRecordProgress record) {
    if (record.key.isNotEmpty) {
      final match = sectionTemplates.firstWhereOrNull(
        (template) => template.id == record.key,
      );
      if (match != null) {
        return match;
      }
    }

    if (record.type.isNotEmpty) {
      final match = sectionTemplates.firstWhereOrNull(
        (template) => template.matches(record.type),
      );
      if (match != null) {
        return match;
      }
    }

    return sectionTemplates.first;
  }

  FormGroup _createSectionGroupFromRecords(
    ProgressSectionTemplate template,
    List<MedicalRecordProgress> records,
  ) {
    final sortedRecords = [...records];
    sortedRecords.sort((a, b) {
      final orderA = _resolveOrder(a.task);
      final orderB = _resolveOrder(b.task);
      return orderA.compareTo(orderB);
    });

    final progressArray = FormArray([]);

    for (final (index, record) in sortedRecords.indexed) {
      progressArray.add(
        FormGroup({
          '_id': FormControl<String>(value: record.id),
          'completed': FormControl<bool>(value: record.completed),
          'key': FormControl<String>(
            value: (record.key.isNotEmpty) ? record.key : template.id,
          ),
          'tag': FormControl<String>(value: record.tag),
          'task': FormControl<String>(value: record.task),
          'completionDate': FormControl<DateTime>(value: record.completionDate),
          'remarks': FormControl<String>(value: record.remarks),
          'medicalRecord': FormControl<String>(value: record.medicalRecord),
          'type': FormControl<String>(value: template.apiType ?? template.serverType),
          'order': FormControl<int>(value: index),
        }),
      );
    }

    return FormGroup({
      'sectionType': FormControl<String>(value: template.id),
      'progress': progressArray,
    });
  }

  FormGroup createSectionFormGroup(ProgressSectionTemplate template) {
    final progressArray = FormArray([]);
    for (final (index, item) in titleList.indexed) {
      progressArray.add(
        FormGroup({
           '_id': FormControl<String>(),
           'completed': FormControl<bool>(value: false),
          'key': FormControl<String>(value: template.id),
          'tag': FormControl<String>(value: item.tag),
          'task': FormControl<String>(value: item.task),
          'completionDate': FormControl<DateTime>(),
          'remarks': FormControl<String>(),
          'medicalRecord': FormControl<String>(),
          'type': FormControl<String>(value: template.apiType ?? template.serverType),
          'order': FormControl<int>(value: index),
        }),
      );
    }

    return FormGroup({
      'sectionType': FormControl<String>(value: template.id),
      'progress': progressArray,
    });
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

class _ProgressCandidate {
  _ProgressCandidate({
    required this.task,
    required this.completionDate,
    required this.order,
  });

  final String task;
  final DateTime completionDate;
  final int order;
}

class ProgressSectionTemplate {
  const ProgressSectionTemplate({
    required this.id,
    required this.title,
    String? displayTitle,
    required this.serverType,
    this.apiType,
    this.legacyTypes = const [],
    this.isDefault = false,
  }) : displayTitle = displayTitle ?? title;

  final String id;
  final String title;
  final String displayTitle;
  final String serverType;
  final String? apiType;
  final List<String> legacyTypes;
  final bool isDefault;

  bool matches(String value) =>
      value == serverType ||
      value == apiType ||
      legacyTypes.contains(value);
}

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class TypeModel {
  TypeModel({
    required this.reportRepository,
  });

  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<List<TypeResponse>>> data =
      ValueNotifier(const AsyncData<List<TypeResponse>>(data: []));

  Future<void> getTypes(FormGroup formGroup) async {
    try {
      data.value = const AsyncData(loading: true);
      var result = await reportRepository.getTypes();
      data.value = AsyncData(data: result);
      insertData(formGroup, result);
    } catch (e) {
      data.value = AsyncData(error: e);
    }
  }

  void insertData(FormGroup formGroup, List<TypeResponse> result) {
    if (result.isNotEmpty) {
      var typeArray = formGroup.control('type') as FormArray;
      typeArray.clear();
      for (var type in result) {
        typeArray.add(
          FormGroup({
            '_id': FormControl<String>(value: type.id),
            'typeName': FormControl<String>(
              value: type.typeName,
              validators: [Validators.required],
            ),
            'color': FormControl<String>(
              value: type.color,
              validators: [Validators.required],
            ),
          }),
        );
      }
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());

  Future<void> createOrUpdate(FormGroup fromGroup) async {
    try {
      data.value = data.value.copyWith(loading: true);
      submitData.value = const AsyncData(loading: true);

      await fromGroup.control('type').value.forEach((element) async {
        if (element['_id'] == null) {
          var result = await reportRepository.postType(TypeRequest(
            typeName: element['typeName'],
            color: element['color'],
          ));
          data.value = data.value.copyWith(data: data.value.data!..add(result));
        } else {
          var result = await reportRepository.putType(
            element['_id'],
            TypeRequest(
              typeName: element['typeName'],
              color: element['color'],
            ),
          );
          data.value = data.value.copyWith(
            data: data.value.data!
              ..[data.value.data!.indexWhere((e) => e.id == element['_id'])] =
                  result
              ..sort((a, b) => a.typeName.compareTo(b.typeName)),
          );
        }
      });

      data.value = data.value.copyWith(loading: false);
      submitData.value = const AsyncData(data: true);
    } catch (e) {
      submitData.value = AsyncData(error: e);
      data.value = data.value.copyWith(error: e);
    }
  }
}

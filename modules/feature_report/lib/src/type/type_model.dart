import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_report/data_report.dart';
import 'package:flutter/material.dart';
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
            'id': FormControl<String>(value: type.id),
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

  Future<void> createOrUpdate(FormArray formArray) async {
    try {
      data.value = data.value.copyWith(loading: true);

      for (var i = 0; i < formArray.controls.length; i++) {
        var formGroup = formArray.controls[i] as FormGroup;
        if (formGroup.control('id').value == null) {
          var result = await reportRepository.postType(TypeRequest(
            typeName: formGroup.control('typeName').value,
            color: formGroup.control('color').value,
          ));

          data.value = data.value.copyWith(data: data.value.data!..add(result));
        } else {
          var result = await reportRepository.putType(
              formGroup.control('id').value,
              TypeRequest(
                typeName: formGroup.control('typeName').value,
                color: formGroup.control('color').value,
              ));
          data.value = data.value.copyWith(
              data: data.value.data!
                ..[i] = result
                ..sort((a, b) => a.typeName.compareTo(b.typeName)));
        }
      }
    } catch (e) {
      data.value = data.value.copyWith(error: e);
    }
  }
}

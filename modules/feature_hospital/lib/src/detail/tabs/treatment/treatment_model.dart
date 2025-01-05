// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class TreatmentModel {
  TreatmentModel({
    required this.hospitalRepository,
  });

  final HospitalRepository hospitalRepository;

  ValueNotifier<String> hospitalId = ValueNotifier('');

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        this.hospitalId.value = hospitalId;
        await fetchTreatmentMenu(formGroup, hospitalId);
        await fetchTreatmentMenuTele(formGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());

  Future<void> submitForm(FormGroup formGroup) async {
    try {
      submitData.value = const AsyncData(loading: true);
      await submitTreatmentMenu(formGroup);
      await submitTreatmentMenuTele(formGroup);
      submitData.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      submitData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<TreatmentMenuResponse>>> treatmentMenuData =
      ValueNotifier(const AsyncData());

  Future<void> fetchTreatmentMenu(
      FormGroup formGroup, String hospitalId) async {
    try {
      // show loading to user
      treatmentMenuData.value = const AsyncData(loading: true);

      // get data from api server
      final response =
          await hospitalRepository.getTreatmentMenu(id: hospitalId);

      // insert data after get data from api server
      insertTreatmentMenu(formGroup, response);

      // hide loading to user and keep data
      treatmentMenuData.value = AsyncData(data: response);
    } catch (e) {
      // for developer in console
      logger.d(e);
      // we can show error to user.
      treatmentMenuData.value = AsyncData(error: e);
    }
  }

  void insertTreatmentMenu(
      FormGroup formGroup, List<TreatmentMenuResponse> data) {
    try {
      // get formArray treatmentMenu for insert data
      FormArray treatmentMenuFormArray =
          formGroup.control('treatmentMenu') as FormArray;

      FormArray taxRateFormArray = formGroup.control('tax') as FormArray;

      // check if data is not empty then clear form
      if (data.isNotEmpty) {
        treatmentMenuFormArray.clear();

        if (data.first.treatmentCostTax != null &&
            data.first.treatmentCostTax!.isNotEmpty) {
          taxRateFormArray.clear();
          // get tax rate from header
          try {
            for (TaxModel e in data.first.treatmentCostTax!) {
              taxRateFormArray.add(FormGroup({
                'tax': FormControl<int>(value: e.tax),
              }));
            }
          } catch (e) {
            logger.d(e);
          }
        }
      }

      for (var element in data) {
        FormArray include = FormArray([]);

        if (element.treatmentCostTax?.isNotEmpty == true) {
          for (var elementx in element.treatmentCostTax!) {
            include.add(FormGroup({
              '_id': FormControl<String>(value: elementx.id),
              'cost': FormControl<double>(value: elementx.cost),
              'tax': FormControl<int>(value: elementx.tax),
            }));
          }
        } else {
          include.add(FormGroup({
            '_id': FormControl<String>(),
            'cost': FormControl<double>(),
            'tax': FormControl<int>(value: 15),
          }));
        }

        treatmentMenuFormArray.add(
          FormGroup({
            '_id': FormControl<String>(value: element.id),
            'hospitalId': FormControl<String>(value: element.hospital),
            'project': FormControl<String>(value: element.project),
            'treatmentCostExcludingTax':
                FormControl<double>(value: element.treatmentCostExcludingTax),
            'treatmentCostTaxIncluded':
                FormControl<double>(value: element.treatmentCostTaxIncluded),
            'remark': FormControl<String>(value: element.remark),
            'treatmentCostTax': include,
          }),
        );
      }
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<List<TreatmentTeleMenuResponse>>>
      treatmentMenuTeleData =
      ValueNotifier(const AsyncData<List<TreatmentTeleMenuResponse>>(data: []));

  Future<void> fetchTreatmentMenuTele(
      FormGroup formGroup, String hospitalId) async {
    try {
      treatmentMenuTeleData.value = const AsyncData(loading: true);
      final response =
          await hospitalRepository.getTreatmentTeleMenu(id: hospitalId);
      insertTreatmentMenuTele(formGroup, response);

      treatmentMenuTeleData.value = AsyncData(data: response);
      logger.d(response);
    } catch (e) {
      logger.d(e);
      treatmentMenuTeleData.value = AsyncData(error: e);
    }
  }

  void insertTreatmentMenuTele(
      FormGroup formGroup, List<TreatmentTeleMenuResponse> data) {
    var treatmentTeleMenu = formGroup.control('telemedicineMenu') as FormArray;
    for (var element in data) {
      if (data.isNotEmpty) {
        treatmentTeleMenu.clear();
      }
      treatmentTeleMenu.add(
        FormGroup({
          '_id': FormControl<String>(value: element.id),
          'hospital': FormControl<String>(value: element.hospital),
          'project': FormControl<String>(value: element.project),
          'treatmentCostExcludingTax':
              FormControl<double>(value: element.treatmentCostExcludingTax),
          'treatmentCostTaxIncluded':
              FormControl<double>(value: element.treatmentCostTaxIncluded),
          'remark': FormControl<String>(value: element.remark),
        }),
      );
    }
  }

  ValueNotifier<AsyncData<List<TreatmentMenuResponse>>>
      submitTreatmentMenudata = ValueNotifier(const AsyncData());

  ValueNotifier<List<String>> treatmentMenuId = ValueNotifier([]);

  Future<void> submitTreatmentMenu(FormGroup formGroup) async {
    try {
      List<TreatmentMenuResponse> dataList = treatmentMenuData.value.data ?? [];
      submitTreatmentMenudata.value = const AsyncData(loading: true);

      await formGroup.control('treatmentMenu').value.forEach((element) async {
        List<TaxModel> treatmentCostTax = [];
        for (var elementx in element['treatmentCostTax']) {
          int index = element['treatmentCostTax'].indexOf(elementx);
          // get tax rate from header
          int? taxRate = formGroup.control('tax').value[index]['tax'];
          treatmentCostTax.add(TaxModel(
            cost: elementx['cost'] ?? 0,
            tax: taxRate ?? 0,
          ));
        }

        logger.d('testtype $element');
        logger.d("testtype ${element['treatmentCostTaxIncluded']}");
        TreatmentMenuRequest request = TreatmentMenuRequest(
          hospital: hospitalId.value,
          project: element['project'],
          treatmentCostExcludingTax: element['treatmentCostExcludingTax'],
          treatmentCostTaxIncluded: element['treatmentCostTaxIncluded'],
          remark: element['remark'],
          treatmentCostTax: treatmentCostTax,
        );

        TreatmentMenuResponse response;
        if (element['_id'] != null) {
          response = await hospitalRepository.putTreatmentMenu(
              element['_id'], request);
          dataList = dataList.map((e) {
            if (e.id == element['_id']) {
              return response;
            }
            return e;
          }).toList();
        } else {
          response = await hospitalRepository.postTreatmentMenu(request);
          dataList.add(response);
        }
      });

      submitTreatmentMenudata.value = AsyncData(data: dataList);
      treatmentMenuData.value = AsyncData(data: dataList);
    } catch (e) {
      logger.d(e);
      submitTreatmentMenudata.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<TreatmentTeleMenuResponse>>>
      submitTreatmentMenuTeledata = ValueNotifier(const AsyncData());

  ValueNotifier<List<String>> treatmentMenuTeleId = ValueNotifier([]);

  Future<void> submitTreatmentMenuTele(FormGroup formGroup) async {
    try {
      List<TreatmentTeleMenuResponse> dataList =
          treatmentMenuTeleData.value.data ?? [];
      submitTreatmentMenuTeledata.value = const AsyncData(loading: true);
      await formGroup
          .control('telemedicineMenu')
          .value
          .forEach((element) async {
        TreatmentTeleMenuRequest request = TreatmentTeleMenuRequest(
          hospital: hospitalId.value,
          project: element['project'],
          treatmentCostExcludingTax: element['treatmentCostExcludingTax'],
          treatmentCostTaxIncluded: element['treatmentCostTaxIncluded'],
          remark: element['remark'],
        );
        TreatmentTeleMenuResponse response;
        if (element['_id'] != null) {
          response = await hospitalRepository.putTreatmentTeleMenu(
              element['_id'], request);
          dataList = dataList.map((e) {
            if (e.id == element['_id']) {
              return response;
            }
            return e;
          }).toList();
        } else {
          response = await hospitalRepository.postTreatmentTeleMenu(request);
          dataList.add(response);
        }
      });

      if (treatmentMenuTeleId.value.isNotEmpty) {
        for (var id in treatmentMenuTeleId.value) {
          try {
            await hospitalRepository.deleteTreatmentTeleMenu(id);
            dataList = dataList
                .where(
                    (element) => treatmentMenuTeleId.value.contains(element.id))
                .toList();
          } catch (e) {
            logger.d(e);
          }
        }
      }

      submitTreatmentMenuTeledata.value = AsyncData(data: dataList);
      treatmentMenuTeleData.value = AsyncData(data: dataList);
    } catch (e) {
      logger.d(e);
      submitTreatmentMenuTeledata.value = AsyncData(error: e);
    }
  }
}

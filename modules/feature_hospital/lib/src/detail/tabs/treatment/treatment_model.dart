import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_hospital/data_hospital.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class TreatmentModle {
  TreatmentModle({required this.hospitalRepository});
  final HospitalRepository hospitalRepository;

  Future<void> fetchData(FormGroup formGroup, {String? hospitalId}) async {
    try {
      if (hospitalId != null) {
        await fetchTreatmentMenu(
            formGroup.control('treatmentMenu') as FormArray, hospitalId);
        // fetchTreatmentMenuTele(
        //     formGroup.control('telemedicineMenu') as FormGroup, hospitalId);
      }
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());
  Future<void> submitForm(FormGroup formGroup) async {
    submitTreatmentMenu(formGroup);
    submitTreatmentMenuTele(formGroup);
  }

  ValueNotifier<AsyncData<List<TreatmentMenuResponse>>> treatmentMenuData =
      ValueNotifier(const AsyncData());

  Future<void> fetchTreatmentMenu(
      FormArray formArray, String hospitalId) async {
    try {
      // show loading to user
      treatmentMenuData.value = const AsyncData(loading: true);

      // get data from api server
      final response =
          await hospitalRepository.getTreatmentMenu(id: hospitalId);

      // insert data after get data from api server
      insertTreatmentMenu(formArray, response);

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
      FormArray formArray, List<TreatmentMenuResponse> data) {
    try {
      for (var element in data) {
        FormArray include = FormArray([]);

        if (element.treatmentCostTax?.isNotEmpty == true) {
          for (var elementx in element.treatmentCostTax!) {
            include.add(FormGroup({
              'tax': FormControl<double>(value: elementx.tax),
              'taxRate': FormControl<int>(value: elementx.taxRate),
            }));
          }
        } else {
          include.add(FormGroup({
            'tax': FormControl<double>(),
            'taxRate': FormControl<int>(value: 15),
          }));
        }

        formArray.add(
          FormGroup({
            'hospitalId': FormControl<String>(value: element.hospital),
            'project': FormControl<String>(value: element.project),
            'treatmentCostExcludingTax':
                FormControl<num>(value: element.treatmentCostExcludingTax),
            'treatmentCostTaxIncluded':
                FormControl<num>(value: element.treatmentCostTaxIncluded),
            'remark': FormControl<String>(value: element.remark),
            'treatmentCostTax': include,
          }),
        );
      }
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<List<TreatmentMenuResponse>>>
      submitTreatmentMenudata = ValueNotifier(const AsyncData());

  Future<void> submitTreatmentMenu(FormGroup formGroup) async {
    try {
      submitTreatmentMenudata.value = const AsyncData(loading: true);
      await formGroup.control('treatmentMenu').value.forEach((element) async {
        List<TaxModel>? treatmentCostTax = [];

        for (var elementx in element['treatmentCostTax']) {
          // todo:
          treatmentCostTax.add(TaxModel(
            tax: elementx['tax'],
            taxRate: 15,
          ));
        }

        TreatmentMenuRequest request = TreatmentMenuRequest(
          hospital: element['hospitalId'],
          project: element['project'],
          treatmentCostExcludingTax: element['treatmentCostExcludingTax'],
          treatmentCostTaxIncluded: element['treatmentCostTaxIncluded'],
          remark: element['remark'],
          treatmentCostTax: treatmentCostTax,
        );
        logger.d(request.toJson());
        logger.d(request.treatmentCostTax?.first.toJson());
        logger.d(request.treatmentCostTax?.last.toJson());
        await hospitalRepository.postTreatmentMenu(request);
      });

      submitTreatmentMenudata.value = AsyncData(data: []);
    } catch (e) {
      logger.d(e);
      submitTreatmentMenudata.value = AsyncData(error: e);
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
      // todo: fix function insert data to form
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
      treatmentTeleMenu.add(
        FormGroup({
          'hospital': FormControl<String>(value: element.hospital),
          'project': FormControl<String>(value: element.project),
          'treatmentCostExcludingTax':
              FormControl<num>(value: element.treatmentCostExcludingTax),
          'treatmentCostTaxIncluded':
              FormControl<num>(value: element.treatmentCostTaxIncluded),
          'remark': FormControl<String>(value: element.remark),
        }),
      );
    }
  }

  ValueNotifier<AsyncData<List<TreatmentTeleMenuResponse>>>
      submitTreatmentMenuTeledata = ValueNotifier(const AsyncData());

  Future<void> submitTreatmentMenuTele(FormGroup formGroup) async {
    try {
      submitTreatmentMenuTeledata.value = const AsyncData(loading: true);
      await formGroup
          .control('telemedicineMenu')
          .value
          .forEach((element) async {
        // mapping data from form into object model
        TreatmentTeleMenuRequest response = TreatmentTeleMenuRequest(
          hospital: element['hospital'],
          project: element['project'],
          treatmentCostExcludingTax: element['treatmentCostExcludingTax'],
          treatmentCostTaxIncluded: element['treatmentCostTaxIncluded'],
          remark: element['remark'],
        );
        // todo: check element['id'] if exist then update data
        // create function
        await hospitalRepository.postTreatmentTeleMenu(response);
      });

      submitTreatmentMenuTeledata.value = const AsyncData(data: []);
    } catch (e) {
      logger.d(e);
      submitTreatmentMenuTeledata.value = AsyncData(error: e);
    }
  }
}

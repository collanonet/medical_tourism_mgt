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
        await fetchTreatmentMenu(formGroup, hospitalId);
        await fetchTreatmentMenuTele(formGroup, hospitalId);
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

      FormArray taxRateFormArray =
          formGroup.control('treatmentMenu') as FormArray;

      // check if data is not empty then clear form
      if (data.isNotEmpty) {
        logger.d('data is not empty');
        treatmentMenuFormArray.clear();
        taxRateFormArray.clear();

        // get tax rate from header
        data.first.treatmentCostTax!.map((e) {
          taxRateFormArray.add(FormGroup({
            'tax': FormControl<int>(value: e.tax),
          }));
        });
      }

      for (var element in data) {
        FormArray include = FormArray([]);

        if (element.treatmentCostTax?.isNotEmpty == true) {
          for (var elementx in element.treatmentCostTax!) {
            include.add(FormGroup({
              'cost': FormControl<double>(value: elementx.cost),
              'tax': FormControl<int>(value: elementx.tax),
            }));
          }
        } else {
          include.add(FormGroup({
            'cost': FormControl<double>(),
            'tax': FormControl<int>(value: 15),
          }));
        }

        treatmentMenuFormArray.add(
          FormGroup({
            'id': FormControl<String>(value: element.id),
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
      if (data.isEmpty) {
        treatmentTeleMenu.clear();
      }
      treatmentTeleMenu.add(
        FormGroup({
          '_id': FormControl<String>(value: element.id),
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

  ValueNotifier<AsyncData<List<TreatmentMenuResponse>>>
      submitTreatmentMenudata = ValueNotifier(const AsyncData());

  Future<void> submitTreatmentMenu(FormGroup formGroup) async {
    try {
      submitTreatmentMenudata.value = const AsyncData(loading: true);
      await formGroup.control('treatmentMenu').value.forEach((element) async {
        List<TaxModel>? treatmentCostTax = [];
        for (var elementx in element['treatmentCostTax']) {
          int index = element['treatmentCostTax'].indexOf(elementx);
          // get tax rate from header
          int? taxRate = formGroup.control('cost').value[index]['cost'];
          treatmentCostTax.add(TaxModel(
            cost: elementx['cost'] ?? 0,
            tax: taxRate ?? 0,
          ));
        }

        TreatmentMenuRequest request = TreatmentMenuRequest(
          hospital: element['hospitalId'],
          project: element['project'],
          treatmentCostExcludingTax: element['treatmentCostExcludingTax'],
          treatmentCostTaxIncluded: element['treatmentCostTaxIncluded'],
          remark: element['remark'],
         // treatmentCostTax: treatmentCostTax,
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
      submitTreatmentMenuTeledata = ValueNotifier(const AsyncData());

  Future<void> submitTreatmentMenuTele(FormGroup formGroup) async {
    try {
      submitTreatmentMenuTeledata.value = const AsyncData(loading: true);
      await formGroup
          .control('telemedicineMenu')
          .value
          .forEach((element) async {
        // mapping data from form into object model
        TreatmentTeleMenuRequest request = TreatmentTeleMenuRequest(
          hospital: element['hospital'],
          project: element['project'],
          treatmentCostExcludingTax: element['treatmentCostExcludingTax'],
          treatmentCostTaxIncluded: element['treatmentCostTaxIncluded'],
          remark: element['remark'],
        );
        // todo: check element['id'] if exist then update data
        // create function
        if (formGroup.control('telemedicineMenu._id').valid != null) {
          final response = await hospitalRepository.putTreatmentTeleMenu(
              formGroup.control('telemedicineMenu._id').value, request);
          submitTreatmentMenuTeledata.value = AsyncData(
              data: submitTreatmentMenuTeledata.value.data!..add(response));
          treatmentMenuTeleData.value =
              AsyncData(data: treatmentMenuTeleData.value.data!..add(response));
        } else {
          final response =
              await hospitalRepository.postTreatmentTeleMenu(request);
          submitTreatmentMenuTeledata.value = AsyncData(
              data: submitTreatmentMenuTeledata.value.data!..add(response));
          treatmentMenuTeleData.value =
              AsyncData(data: treatmentMenuTeleData.value.data!..add(response));
        }
      });

      submitTreatmentMenuTeledata.value = const AsyncData(data: []);
    } catch (e) {
      logger.d(e);
      submitTreatmentMenuTeledata.value = AsyncData(error: e);
    }
  }
}

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

  Future<void> fetchData(FormGroup formGroup,{String? hospitalId}) async{
    try{
      if(hospitalId != null){
        fetchTreatmentMenu(formGroup.control('treatmentMenu') as FormGroup, hospitalId);
        fetchTreatmentMenuTele(formGroup.control('telemedicineMenu') as FormGroup, hospitalId);
      }
      
    }catch(e){
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
      treatmentMenuData.value = const AsyncData(loading: true);
      final response =
          await hospitalRepository.getTreatmentMenu(id: hospitalId);
      insertTreatmentMenu(formGroup, response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertTreatmentMenu(
      FormGroup formGroup, List<TreatmentMenuResponse> data) {
    var treatmentMenu = formGroup.control('treatmentMenu') as FormArray;
    var include = formGroup.control('includeTax').value as FormArray;

    for (var element in data) {
      for (var elementx in element.includeTax!) {
        include.add(FormGroup({
          'tax': FormControl<num>(value: elementx.tax),
          'taxRate': FormControl<num>(value: elementx.taxRate),
        }));
      }
      treatmentMenu.add(
        FormGroup({
          'hospitalId': FormControl<String>(value: element.hospitalId),
          'project': FormControl<String>(value: element.project),
          'treatingCostExcludingTax':
              FormControl<num>(value: element.treatingCostExcludingTax),
          'treatingCostIncludingTax':
              FormControl<num>(value: element.treatingCostIncludingTax),
          'preparationForExams':
              FormControl<String>(value: element.preparationForExams),
          'includeTax': include,
        }),
      );
    }
  }

  ValueNotifier<AsyncData<TreatmentMenuResponse>> submitTreatmentMenudata =
      ValueNotifier(const AsyncData());
  Future<void> submitTreatmentMenu(FormGroup formGroup) async {
    try {
      submitTreatmentMenudata.value = const AsyncData(loading: true);
      formGroup.control('treatmentMenu').value.forEach((element) {
        TreatmentMenuRequest response = TreatmentMenuRequest(
          hospitalId: element['hospitalId'],
          project: element['project'],
          treatingCostExcludingTax: element['treatingCostExcludingTax'],
          treatingCostIncludingTax: element['treatingCostIncludingTax'],
          preparationForExams: element['preparationForExams'],
          includeTax: element['includeTax'],
        );
        hospitalRepository.postTreatmentMenu(response);
      });
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<List<TreatmentTeleMenuResponse>>>
      treatmentMenuTeleData = ValueNotifier(const AsyncData());
  Future<void> fetchTreatmentMenuTele(
      FormGroup formGroup, String hospitalId) async {
    try {
      treatmentMenuTeleData.value = const AsyncData(loading: true);
      final response =
          await hospitalRepository.getTreatmentTeleMenu(id: hospitalId);
      insertTreatmentMenuTele(formGroup, response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertTreatmentMenuTele(FormGroup formGroup,List<TreatmentTeleMenuResponse> data) {
    var treatmentTeleMenu = formGroup.control('telemedicineMenu') as FormArray;
    for (var element in data) {
      treatmentTeleMenu.add(
        FormGroup({
          'hospitalId': FormControl<String>(value: element.hospitalId),
          'project': FormControl<String>(value: element.project),
          'treatingCostExcludingTax':
              FormControl<num>(value: element.treatingCostExcludingTax),
          'treatingCostIncludingTax':
              FormControl<num>(value: element.treatingCostIncludingTax),
          'remarks': FormControl<String>(value: element.remarks),
        }),
      );
    }
  }

  ValueNotifier<AsyncData<TreatmentTeleMenuResponse>> submitTreatmentMenuTeledata = ValueNotifier(const AsyncData());
  Future<void> submitTreatmentMenuTele(FormGroup formGroup) async {
    try{
      submitTreatmentMenuTeledata.value = const AsyncData(loading: true);
      formGroup.control('telemedicineMenu').value.forEach((element) {
          TreatmentTeleMenuRequest response = TreatmentTeleMenuRequest(
            hospitalId: element['hospitalId'],
            project: element['project'],
            treatingCostExcludingTax: element['treatingCostExcludingTax'],
            treatingCostIncludingTax: element['treatingCostIncludingTax'],
            remarks: element['remarks'],
          );
          hospitalRepository.postTreatmentTeleMenu(response);
      });


    }catch(e){
      logger.d(e);
      submitTreatmentMenuTeledata.value = AsyncData(error: e);
    }
  }
}

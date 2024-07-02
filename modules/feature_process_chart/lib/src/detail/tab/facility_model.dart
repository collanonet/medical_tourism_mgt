import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class FacilityModel {
  FacilityModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  Future<void> fetchData(FormGroup formGroup) async {
    try{
      await fetchDetailFacilityHotel(formGroup.control('Hotel') as FormArray);
    await fetchDetailDropInFacility(
        formGroup.control('drop_in_facility') as FormGroup);

    }catch(e){
      logger.d(e);
    }
    
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());
  void submit(FormGroup formGroup) async {
    try{
      submitData.value = const AsyncData(loading: true);
       await submitDetailFacilityHotel(formGroup);
      await submitDropInDacility(
        formGroup.control('drop_in_facility') as FormGroup);
       

    }catch(e){
      logger.d(e);
    }
    
  }

  ValueNotifier<AsyncData<List<DetailFacilityHotelResponse>>>
      detailFacilityHotelData = ValueNotifier(const AsyncData());
  Future<void> fetchDetailFacilityHotel(FormArray formArray) async {
    try {
      detailFacilityHotelData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetialFacilityHospital();
      insertFacilityHotel(formArray, response);
    } catch (e) {
      detailFacilityHotelData.value = AsyncData(error: e);
    }
  }

  void insertFacilityHotel(
      FormArray formArray, List<DetailFacilityHotelResponse>? data) {
   // var hotel = formGroup.control('Hotel') as FormArray;
  
    if (data!.isNotEmpty) {
      for (var element in data) {
      formArray.add(
          FormGroup({
            'Person_in_charge_of_arrangements': FormControl<String>(
                value: element.personInChargeOfArrangements),
            'Name_of_facility':
                FormControl<String>(value: element.nameOfFacility),
            'location': FormControl<String>(value: element.location),
            'Person_in_charge_name':
                FormControl<String>(value: element.personInChargeName),
            'telephone_number':
                FormControl<String>(value: element.telephoneNumber),
            'remarks': FormControl<String>(value: element.remarks),
            'Foreign_language_staff':
                FormControl<String>(value: element.foreignLanguageStaff),
          }),
        );
      }
    }
  }

  ValueNotifier<AsyncData<List<DetailFacilityHotelResponse>>>
      submitDetailFacilityData = ValueNotifier(const AsyncData());
  Future<void> submitDetailFacilityHotel(FormGroup formGroup) async {
    try {
      submitDetailFacilityData.value = const AsyncData(loading: true, data: []);
      await formGroup.control('Hotel').value.forEach((element) async {
        DetailFacilityHotelRequest request = DetailFacilityHotelRequest(
          personInChargeOfArrangements:
              element['Person_in_charge_of_arrangements'],
          nameOfFacility: element['Name_of_facility'],
          location: element['location'],
          personInChargeName: element['Person_in_charge_name'],
          telephoneNumber: element['telephone_number'],
          remarks: element['remarks'],
          foreignLanguageStaff: element['Foreign_language_staff'],
          japanese: element['japanese'],
          english: element['english'],
          chinese: element['chinese'],
          vietnamese: element['vietnamese'],
          others: element['others'],
        );
         await processChartRepository.postDetailFacilityHospital(request);
      });

     submitDetailFacilityData.value = AsyncData(data: []);
    } catch (e) {
      submitDetailFacilityData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DetailDropInFacilityResponse>> dropInFacilityData =
      ValueNotifier(const AsyncData());
  Future<void> fetchDetailDropInFacility(FormGroup formGroup) async {
    try {
      dropInFacilityData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailFacilityDropIn();
      insertDropInFacility(formGroup, response);
    } catch (e) {
      dropInFacilityData.value = AsyncData(error: e);
    }
  }

  void insertDropInFacility(
      FormGroup formGroup, DetailDropInFacilityResponse? data) {
    var facility = formGroup.control('facility') as FormArray;
    formGroup.control('Person_in_charge_of_arrangements').value =
        data?.personInChargeOfArrangements;
    if (data?.facilities != null && data!.facilities!.isNotEmpty) {
      for (var element in data.facilities!) {
        facility.add(FormGroup({
          'Name_of_facility': FormControl<String>(value: element.name), // 施設名
          'location': FormControl<String>(value: element.location), // 所在地
          'Person_in_charge_name':
              FormControl<String>(value: element.personInChargeName), // 担当者名
          'telephone_number':
              FormControl<String>(value: element.telephoneNumber), // 電話番号
        }));
      }
    }
  }

  ValueNotifier<AsyncData<DetailDropInFacilityResponse>>
      submitDropInFacilityData = ValueNotifier(const AsyncData());
  Future<void> submitDropInDacility(FormGroup formGroup) async {
    try {
      submitDropInFacilityData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .postDetailFacilityDropIn(DetailDropInFacilityRequest.fromJson(
        formGroup.control('drop_in_facility').value,
      ));
      dropInFacilityData.value = AsyncData(data: response);
      submitDropInFacilityData.value = AsyncData(data: response);
    } catch (e) {
      submitDropInFacilityData.value = AsyncData(error: e);
    }
  }
}

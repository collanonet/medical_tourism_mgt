
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class HotelRegistrationModel {
  HotelRegistrationModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  ValueNotifier<AsyncData<DetainHotelRegistationResponse>> hotelregisterData =
      ValueNotifier(const AsyncData());

  Future<void> fetchHotelregister(FormGroup formGroup) async {
    try {
      hotelregisterData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.getDetainlHotelRegistation();
      insertHotelRegister(formGroup, response);

      hotelregisterData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertHotelRegister(
      FormGroup formGroup, DetainHotelRegistationResponse? data) {
    formGroup.control('Name_of_facility').value = data?.name;
    formGroup.control('location').value = data?.location;
    formGroup.control('Person_in_charge_name').value = data?.personInChargeName;
    formGroup.control('telephone_number').value = data?.telephoneNumber;
    formGroup.control('1_night_price').value = data?.oneNightPrice;
    formGroup.control('Accommodation_memo').value = data?.accommodationMemo;
    formGroup.control('Foreign_language_staff').value =
        data?.foreignLanguageStaff;
    formGroup.control('evaluation').value = data?.evaluation;
  }

  ValueNotifier<AsyncData<DetainHotelRegistationResponse>>
      submitHotelRegisterData = ValueNotifier(const AsyncData());
  Future<void> submitHotelRegister(FormGroup formGroup) async {
    try {
      submitHotelRegisterData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .postDetailHotelRegistation(DetainHotelRegistationRequest(
        name: formGroup.control('Name_of_facility').value,
        location: formGroup.control('location').value,
        personInChargeName: formGroup.control('Person_in_charge_name').value,
        telephoneNumber: formGroup.control('telephone_number').value,
        oneNightPrice: formGroup.control('1_night_price').value,
        accommodationMemo: formGroup.control('Accommodation_memo').value,
        foreignLanguageStaff: formGroup.control('Foreign_language_staff').value,
        evaluation: formGroup.control('evaluation').value,
      ));
      submitHotelRegisterData.value = AsyncData(data: response);
      hotelregisterData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitHotelRegisterData.value = AsyncData(error: e.toString());
    }
  }
}

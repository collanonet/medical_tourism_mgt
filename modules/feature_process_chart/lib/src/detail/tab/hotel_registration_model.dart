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

  ValueNotifier<AsyncData<List<DetainHotelRegistationResponse>>>
      hotelregisterData = ValueNotifier(
          const AsyncData<List<DetainHotelRegistationResponse>>(data: []));

  Future<void> fetchHotelregister({
    String? accommodationName,
    //List<String>? accommodationType,
    String? area,
    bool? usageRecord,
    bool? isJapanese,
    bool? isEnglish,
    bool? isVietnamese,
    bool? isThai,
    bool? isKorean,
    bool? isChinese,
  }) async {
    try {
      hotelregisterData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetainlHotelRegistation(
        accommodationName: accommodationName,
      // accommodationType: accommodationType,
        area: area,
        usageRecord: usageRecord,
        isJapanese: isJapanese,
        isEnglish: isEnglish,
        isThai: isThai,
        isKorean: isKorean,
        isVietnamese: isVietnamese,
        isChinese: isChinese,
      );
      hotelregisterData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      hotelregisterData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DetainHotelRegistationResponse>>
      submitHotelRegisterData = ValueNotifier(const AsyncData());
  Future<void> submitHotelRegister(FormGroup formGroup) async {
    try {
      submitHotelRegisterData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .postDetailHotelRegistation(DetainHotelRegistationRequest(
        accommodationName: formGroup.control('accommodationName').value,
        address: formGroup.control('address').value,
        contactPersonName: formGroup.control('contactPersonName').value,
        phoneNumber: formGroup.control('phoneNumber').value,
        ratePerNight: formGroup.control('ratePerNight').value,
        accommodationMemo: formGroup.control('accommodationMemo').value,
        isJapanese: formGroup.control('isJapanese').value,
        isChinese: formGroup.control('isChinese').value,
        isVietnamese: formGroup.control('isVietnamese').value,
        isEnglish: formGroup.control('isEnglish').value,
        isOthers: formGroup.control('isOthers').value,
        other: formGroup.control('other').value,
        evaluation: formGroup.control('evaluation').value,
      ));
      submitHotelRegisterData.value = AsyncData(data: response);
      hotelregisterData.value =
          AsyncData(data: hotelregisterData.value.data!..add(response));
    } catch (e) {
      logger.d(e);
      submitHotelRegisterData.value = AsyncData(error: e.toString());
    }
  }
}

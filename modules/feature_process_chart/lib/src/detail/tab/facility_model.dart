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
    try {
      // await fetchDetailFacilityHotel(formGroup.control('Hotel') as FormArray);
      await fetchDetailDropInFacility(
          formGroup.control('drop_in_facility') as FormGroup);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submitData = ValueNotifier(const AsyncData());
  void submit(FormGroup formGroup) async {
    try {
      submitData.value = const AsyncData(loading: true);
      await submitDetailFacilityHotel(formGroup);
      await submitDropInDacility(
          formGroup.control('drop_in_facility') as FormGroup);
      submitData.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      submitData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DetailFacilityHotelResponse>>>
      detailFacilityHotelData = ValueNotifier(
          const AsyncData<List<DetailFacilityHotelResponse>>(data: []));
  Future<void> fetchDetailFacilityHotel() async {
    try {
      detailFacilityHotelData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetialFacilityHospital();
      // insertFacilityHotel(formArray, response);
    } catch (e) {
      detailFacilityHotelData.value = AsyncData(error: e);
    }
  }

  void insertFacilityHotel(
      FormArray formArray, DetailFacilityHotelResponse? data) {}

  ValueNotifier<AsyncData<DetailFacilityHotelResponse>>
      submitDetailFacilityData = ValueNotifier(const AsyncData());
  Future<void> submitDetailFacilityHotel(FormGroup formGroup) async {
    try {
      detailFacilityHotelData.value = const AsyncData(loading: true, data: []);
      List<String>? languages = [];
      // if (formGroup.control('japanese').value == true) {
      //   languages.add('日本語');
      // }
      // if (formGroup.control('chinese').value == true) {
      //   languages.add('中国語');
      // }
      // if (formGroup.control('vietnamese').value == true) {
      //   languages.add('ベトナム語');
      // }
      // if (formGroup.control('english').value == true) {
      //   languages.add('英語');
      // }
      formGroup.control('Hotel').value.forEach(
        (element) async {
          DetailFacilityHotelRequest request = DetailFacilityHotelRequest(
            accommodationName: element['accommodationName'],
            contactPersonName: element['contactPersonName'],
            address: element['address'],
            arrangePerson: element['arrangePerson'],
            phoneNumber: element['phoneNumber'],
            remarks: element['remarks'],
            foreignLanguageStaff: ['kk'],
            other: element['others'],
            hotel: '',
          );
          var result =
              await processChartRepository.postDetailFacilityHospital(request);
          detailFacilityHotelData.value.copyWith(
              data: [...detailFacilityHotelData.value.requireData, result]);
        },
      );
      detailFacilityHotelData.value =
          AsyncData(data: detailFacilityHotelData.value.data);
    } catch (e) {
      logger.d(e);
      submitDetailFacilityData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DetailDropInFacilityResponse>>>
      dropInFacilityData = ValueNotifier(const AsyncData());
  Future<void> fetchDetailDropInFacility(FormGroup formGroup) async {
    try {
      dropInFacilityData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailFacilityDropIn();
      // insertDropInFacility(formGroup, response);
      dropInFacilityData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      dropInFacilityData.value = AsyncData(error: e);
    }
  }

  // void insertDropInFacility(
  //     FormGroup formGroup, List<DetailDropInFacilityResponse>? data) {
  //   var facility = formGroup.control('facility') as FormArray;
  //   formGroup.control('arrangePerson').value = data?.arrangePerson;
  //   if (data?.places != null && data!.places!.isNotEmpty) {
  //     for (var element in data.places!) {
  //       facility.add(FormGroup({
  //         'accommodationName':
  //             FormControl<String>(value: element.accommodationName), // 施設名
  //         'address': FormControl<String>(value: element.address), // 所在地
  //         'contactPersonName':
  //             FormControl<String>(value: element.contactPersonName), // 担当者名
  //         'phoneNumber':
  //             FormControl<String>(value: element.phoneNumber), // 電話番号
  //       }));
  //     }
  //   }
  // }

  ValueNotifier<AsyncData<DetailDropInFacilityResponse>>
      submitDropInFacilityData = ValueNotifier(const AsyncData());
  Future<void> submitDropInDacility(FormGroup formGroup) async {
    try {
      submitDropInFacilityData.value = const AsyncData(loading: true);
      List<Facility> places = [];
      formGroup.control('places').value.forEach((element) {
        places.add(Facility(
          accommodationName: element['accommodationName'],
          address: element['address'],
          contctPersonName: element['contactPersonName'],
          phoneNumber: element['phoneNumber'],
        ));
      });
      final response = await processChartRepository.postDetailFacilityDropIn(
        DetailDropInFacilityRequest(
          arrangePerson: formGroup.control('arrangePerson').value,
          places: places,
        ),
      );
      logger.d('Data${formGroup.control('arrangePerson').value}');
      dropInFacilityData.value =
          AsyncData(data: dropInFacilityData.value.data!..add(response));
      submitDropInFacilityData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitDropInFacilityData.value = AsyncData(error: e);
    }
  }
}

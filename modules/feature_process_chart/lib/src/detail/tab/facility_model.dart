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
      await fetchDetailFacilityHotel(formGroup.control('Hotel') as FormArray);
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
    if (data!.isEmpty) {
      formArray.clear();
      for (var item in data) {
        for (int i = 0; i < item.foreignLanguageStaff!.length; i++) {
          if (item.foreignLanguageStaff![i] == '日本語') {
            formArray.control('japanese').value = true;
          }
          // if (element['chinese'] == true) {
          //   languages.add('中国語');
          // }
          // if (element['vietnamese'] == true) {
          //   languages.add('ベトナム語');
          // }
          // if (element['english'] == true) {
          //   languages.add('英語');
          // }
        }
        formArray.add(
          FormGroup(
            {
              'arrangePerson':
                  FormControl<String>(value: item.arrangePerson), // 手配担当
              'accommodationName':
                  FormControl<String>(value: item.accommodationName), // 施設名
              'address': FormControl<String>(value: item.address), // 所在地
              'contactPersonName':
                  FormControl<String>(value: item.contactPersonName), // 担当者名
              'phoneNumber':
                  FormControl<String>(value: item.phoneNumber), // 電話番号
              'remarks': FormControl<String>(value: item.remarks), // 備考
              'foreignLanguageStaff': FormControl<List<String>>(value: []),
              // 外国語スタッフ
              //
              // 'chinese': FormControl<bool>(value: false), //
              // 'vietnamese': FormControl<bool>(value: false), //
              // 'english': FormControl<bool>(value: false), //
              // 'others': FormControl<String>(value: ''),
              // 'other': FormControl<bool>(value: false), //
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<DetailFacilityHotelResponse>>
      submitDetailFacilityData = ValueNotifier(const AsyncData());
  Future<void> submitDetailFacilityHotel(FormGroup formGroup) async {
    try {
      detailFacilityHotelData.value = const AsyncData(loading: true, data: []);

      formGroup.control('Hotel').value.forEach(
        (element) async {
          List<String>? languages = [];
          if (element['japanese'] == true) {
            languages.add('日本語');
          }
          if (element['chinese'] == true) {
            languages.add('中国語');
          }
          if (element['vietnamese'] == true) {
            languages.add('ベトナム語');
          }
          if (element['english'] == true) {
            languages.add('英語');
          }
          DetailFacilityHotelRequest request = DetailFacilityHotelRequest(
            arrangePerson: element['arrangePerson'],
            accommodationName: element['accommodationName'],
            address: element['address'],
            contactPersonName: element['contactPersonName'],
            phoneNumber: element['phoneNumber'],
            remarks: element['remarks'],
            foreignLanguageStaff: languages,
            other: element['others'],
            hotel: null,
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
      insertDropInFacility(formGroup, response);
      dropInFacilityData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      dropInFacilityData.value = AsyncData(error: e);
    }
  }

  void insertDropInFacility(
      FormGroup formGroup, List<DetailDropInFacilityResponse> data) {
    for (var item in data) {
      FormArray places = FormArray([]);
      if (data.isEmpty) {
        for (var e in item.places!) {
          places.add(
            FormGroup(
              {
                'accommodationName':
                    FormControl<String>(value: e.accommodationName), // 施設名
                'address': FormControl<String>(value: e.address), // 所在地
                'contactPersonName':
                    FormControl<String>(value: e.accommodationName), // 担当者名
                'phoneNumber':
                    FormControl<String>(value: e.phoneNumber), // 電話番号
              },
            ),
          );
        }
      } else {
        places.add(
          FormGroup(
            {
              'accommodationName': FormControl<String>(value: ''), // 施設名
              'address': FormControl<String>(value: ''), // 所在地
              'contactPersonName': FormControl<String>(value: ''), // 担当者名
              'phoneNumber': FormControl<String>(value: ''), // 電話番号
            },
          ),
        );
      }
      formGroup.control('arrangePerson').value = item.arrangePerson;
    }
  }

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

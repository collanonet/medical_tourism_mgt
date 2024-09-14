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

  ValueNotifier<String> tourId = ValueNotifier('');

  Future<void> fetchData(FormGroup formGroup, String id) async {
    try {
      tourId.value = id;
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
      final response =
          await processChartRepository.getDetialFacilityHospital(tourId.value);
      insertFacilityHotel(formArray, response);
      detailFacilityHotelData.value = AsyncData(data: response);
    } catch (e) {
      detailFacilityHotelData.value = AsyncData(error: e);
    }
  }

  void insertFacilityHotel(
      FormArray formArray, List<DetailFacilityHotelResponse> data) {
    if (data.isNotEmpty) {
      formArray.clear();
      for (var item in data) {
        bool japanese = false;
        bool chinese = false;
        bool vietnamese = false;
        bool english = false;
        bool others = false;
        for (int i = 0; i < item.foreignLanguageStaff!.length; i++) {
          if (item.foreignLanguageStaff![i] == '日本語') {
            japanese = true;
          }
          if (item.foreignLanguageStaff?[i] == '中国語') {
            chinese = true;
          }
          if (item.foreignLanguageStaff?[i] == 'ベトナム語') {
            vietnamese = true;
          }
          if (item.foreignLanguageStaff?[i] == '英語') {
            english = true;
          }
          if (item.foreignLanguageStaff?[i] == 'その他') {
            others = true;
          }
        }
        formArray.add(
          FormGroup(
            {
              'id': FormControl<String>(value: item.id), // ID
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
              'tour': FormControl<String>(value: item.tour),
              // 外国語スタッフ
              //
              'japanese': FormControl<bool>(value: japanese), //
              'chinese': FormControl<bool>(value: chinese), //
              'vietnamese': FormControl<bool>(value: vietnamese), //
              'english': FormControl<bool>(value: english), //
              'others': FormControl<bool>(value: others),
              'other': FormControl<String>(value: item.other ?? ''), //
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<List<DetailFacilityHotelResponse>>>
      submitDetailFacilityData = ValueNotifier(const AsyncData());

  Future<void> submitDetailFacilityHotel(FormGroup formGroup) async {
    try {
      List<DetailFacilityHotelResponse> data =
          detailFacilityHotelData.value.data ?? [];
      submitDetailFacilityData.value = const AsyncData(loading: true);

      await formGroup.control('Hotel').value.forEach(
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
          if (element['others'] == true) {
            languages.add('その他');
          }
          DetailFacilityHotelRequest request = DetailFacilityHotelRequest(
            arrangePerson: element['arrangePerson'],
            accommodationName: element['accommodationName'],
            address: element['address'],
            contactPersonName: element['contactPersonName'],
            phoneNumber: element['phoneNumber'],
            remarks: element['remarks'],
            foreignLanguageStaff: languages,
            other: element['other'],
            hotel: null,
            tour: tourId.value,
          );
          if (element['id'] == null) {
            var result = await processChartRepository
                .postDetailFacilityHospital(request);
            data.add(result);
          } else {
            var result = await processChartRepository.putDetailFacilityHospital(
                element['id'], request);
            data.map((e) => e.id == result.id ? result : e).toList();
          }
        },
      );

      detailFacilityHotelData.value = AsyncData(data: data);
      submitDetailFacilityData.value = AsyncData(data: data);
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
      final response =
          await processChartRepository.getDetailFacilityDropIn(tourId.value);
      insertDropInFacility(formGroup, response);
      dropInFacilityData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      dropInFacilityData.value = AsyncData(error: e);
    }
  }

  void insertDropInFacility(
      FormGroup formGroup, List<DetailDropInFacilityResponse> data) {
    // var firstData = data![0];
    for (var item in data) {
      var places = formGroup.control('places') as FormArray;
      if (data.isNotEmpty) {
        places.clear();
        for (var e in item.places!) {
          places.add(
            FormGroup(
              {
                'id': FormControl<String>(value: e.id),
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
              'id': FormControl<String>(value: ''), // ID
              'accommodationName': FormControl<String>(value: ''), // 施設名
              'address': FormControl<String>(value: ''), // 所在地
              'contactPersonName': FormControl<String>(value: ''), // 担当者名
              'phoneNumber': FormControl<String>(value: ''), // 電話番号
              'tour': FormControl<String>(value: ''), // ツアーID
            },
          ),
        );
      }
      formGroup.control('arrangePerson').value = item.arrangePerson;
    }
  }

  ValueNotifier<AsyncData<List<DetailDropInFacilityResponse>>>
      submitDropInFacilityData = ValueNotifier(const AsyncData());

  Future<void> submitDropInDacility(FormGroup formGroup) async {
    try {
      List<DetailDropInFacilityResponse> data =
          dropInFacilityData.value.data ?? [];
      submitDropInFacilityData.value = const AsyncData(loading: true);
      List<Facility> places = [];
      formGroup.control('places').value.forEach(
        (element) {
          places.add(
            Facility(
              accommodationName: element['accommodationName'],
              address: element['address'],
              contctPersonName: element['contactPersonName'],
              phoneNumber: element['phoneNumber'],
            ),
          );
        },
      );

      if (formGroup.control('id').value == null) {
        final response = await processChartRepository.postDetailFacilityDropIn(
          DetailDropInFacilityRequest(
            arrangePerson: formGroup.control('arrangePerson').value,
            places: places,
            hotel: tourId.value,
          ),
        );
        data.add(response);
      } else {
        final response = await processChartRepository.putDetailFacilityDropIn(
          formGroup.control('id').value,
          DetailDropInFacilityRequest(
            arrangePerson: formGroup.control('arrangePerson').value,
            places: places,
            hotel: tourId.value,
          ),
        );
        data.map((e) => e.id == response.id ? response : e).toList();
      }

      dropInFacilityData.value = AsyncData(data: data);

      submitDropInFacilityData.value = AsyncData(data: data);
    } catch (e) {
      logger.d(e);
      submitDropInFacilityData.value = AsyncData(error: e);
    }
  }
}

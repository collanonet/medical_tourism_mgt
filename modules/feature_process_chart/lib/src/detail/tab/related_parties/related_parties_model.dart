import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class RelatedPartiesModel {
  RelatedPartiesModel({required this.processChartRepository});

  final ProcessChartRepository processChartRepository;

  ValueNotifier<String> tourId = ValueNotifier('');

  Future<void> fetchData(String id, FormGroup formGroup) async {
    try {
      tourId.value = id;
      await fetchParties(formGroup.control('guideInterpreter') as FormArray);
      await fetchBusCompany(formGroup.control('busCompany') as FormGroup);
      await fetchPartiesDriver(formGroup.control('driver') as FormArray);
      await fetchEmergencyContact(
          formGroup.control('emergencyContact') as FormArray);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());

  Future<void> submitData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      await submitParties(formGroup);
      await submitBusCompany(formGroup);
      await submitPartiesDriver(formGroup);
      await submitEmergencyContact(formGroup);
      submit.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DetailRelatedPartiesResponse>>> partiesData =
      ValueNotifier(const AsyncData());

  Future<void> fetchParties(FormArray formArray) async {
    try {
      partiesData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.getDetailRelatedParties(tourId.value);
      insertRelatedParties(formArray, response);
      partiesData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      partiesData.value = AsyncData(error: e);
    }
  }

  void insertRelatedParties(
      FormArray formArray, List<DetailRelatedPartiesResponse> data) {
    if (data.isNotEmpty) {
      formArray.clear();
      formArray.reset();
      for (var element in data) {
        bool value1 = false;
        bool value2 = false;
        bool value3 = false;

        if (element.qualification?.contains('旅程管理') == true) {
          value1 = true;
        }

        if (element.qualification?.contains('通訳案内士') == true) {
          value2 = true;
        }

        if (element.qualification?.contains('医療通訳者') == true) {
          value3 = true;
        }

        formArray.add(
          FormGroup(
            {
              '_id': FormControl<String>(value: element.id), // ID
              'arrangePerson':
                  FormControl<String>(value: element.arrangePerson), // 手配担当
              'dateFrom':
                  FormControl<DateTime>(value: element.dateFrom), // 年月日（自）
              'dateTo': FormControl<DateTime>(value: element.dateTo), // 年月日（至）
              'guideNamaKanji': FormControl<String>(
                  value: element.guideNamaKanji), // ガイド名（漢字）
              'guideNameKana':
                  FormControl<String>(value: element.guideNameKana), // ガイド名（カナ）
              'phoneNumber':
                  FormControl<String>(value: element.phoneNumber), // 電話番号
              'qualification': FormControl<List<String>>(value: []), // 資格
              'report': FormControl<String>(value: element.report), // 報告書
              'accommodationAvailability': FormControl<String>(
                  value: element.accommodationAvailability), // 同宿可否
              'accommodationName':
                  FormControl<String>(value: element.accommodationName), // 施設名
              'address': FormControl<String>(value: element.address), // 所在地
              'phoneNumber2':
                  FormControl<String>(value: element.phoneNumber2), //
              //qualification
              'itinerary_management': FormControl<bool>(value: value1),
              'guide_interpreter': FormControl<bool>(value: value2),
              'medical_interpreter': FormControl<bool>(value: value3),
              'tour': FormControl<String>(value: element.tour),
            },
          ),
        );

        logger.d('data ${data.length}');
      }
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesResponse>> submitPartiesData =
      ValueNotifier(const AsyncData());

  Future<void> submitParties(FormGroup formGroup) async {
    try {
      List<DetailRelatedPartiesResponse> data = partiesData.value.data ?? [];
      partiesData.value = const AsyncData(loading: true);
      await formGroup.control('guideInterpreter').value.forEach(
        (element) async {
          List<String> qualifications = [];
          if (element['itinerary_management'] == true) {
            qualifications.add('旅程管理');
          }
          if (element['guide_interpreter'] == true) {
            qualifications.add('通訳案内士');
          }
          if (element['medical_interpreter'] == true) {
            qualifications.add('医療通訳者');
          }
          DetailRelatedPartiesRequest request = DetailRelatedPartiesRequest(
            arrangePerson: element['arrangePerson'],
            dateFrom: element['dateFrom'],
            dateTo: element['dateTo'],
            guideNamaKanji: element['guideNamaKanji'],
            guideNameKana: element['guideNameKana'],
            phoneNumber: element['phoneNumber'],
            qualification: qualifications,
            report: element['report'],
            accommodationAvailability: element['accommodationAvailability'],
            accommodationName: element['accommodationName'],
            address: element['address'],
            phoneNumber2: element['phoneNumber2'],
            tour: tourId.value,
          );
          if (element['_id'] == null) {
            var result =
                await processChartRepository.postDetailRelatedParties(request);
            data.add(result);
          } else {
            var result = await processChartRepository.putDetailRelatedParties(
                request, element['_id']);
            data.map((e) => e.id == element['_id'] ? result : e).toList();
          }
        },
      );
      partiesData.value = AsyncData(data: data);
      submitPartiesData.value = AsyncData(data: submitPartiesData.value.data);
    } catch (e) {
      logger.d(e);
      partiesData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesBusCompanyResponse>>
      busCompanyData = ValueNotifier(const AsyncData());

  Future<void> fetchBusCompany(FormGroup formGroup) async {
    try {
      busCompanyData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .getDetailRelatedPartiesBusCompany(tourId.value);
      insertBusCompany(formGroup, response);
      busCompanyData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      busCompanyData.value = AsyncData(error: e);
    }
  }

  void insertBusCompany(
      FormGroup formGroup, DetailRelatedPartiesBusCompanyResponse data) {
    formGroup.control('_id').value = data.id;
    formGroup.control('arrangePerson').value = data.arrangePerson;
    formGroup.control('busCompanyName').value = data.busCompanyName;
    formGroup.control('contactPerson').value = data.contactPerson;
    formGroup.control('tour').value = data.tour;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesBusCompanyResponse>>
      submitBusCompanyData = ValueNotifier(const AsyncData());

  Future<void> submitBusCompany(FormGroup formGroup) async {
    try {
      submitBusCompanyData.value = const AsyncData(loading: true);

      if (formGroup.control('_id').value == null) {
        final response =
            await processChartRepository.postDetailRelatedPartiesBusCompany(
                DetailRelatedPartiesBusCompanyRequest(
          arrangePerson: formGroup.control('arrangePerson').value,
          busCompanyName: formGroup.control('busCompanyName').value,
          contactPerson: formGroup.control('contactPerson').value,
          tour: tourId.value,
        ));
        busCompanyData.value = AsyncData(data: busCompanyData.value.data);
        submitBusCompanyData.value = AsyncData(data: response);
      } else {
        final response =
            await processChartRepository.putDetailRelatedPartiesBusCompany(
                formGroup.control('_id').value,
                DetailRelatedPartiesBusCompanyRequest(
                  arrangePerson: formGroup.control('arrangePerson').value,
                  busCompanyName: formGroup.control('busCompanyName').value,
                  contactPerson: formGroup.control('contactPerson').value,
                  tour: tourId.value,
                ));
        busCompanyData.value = AsyncData(data: busCompanyData.value.data);
        submitBusCompanyData.value = AsyncData(data: response);
      }
    } catch (e) {
      logger.d(e);
      submitBusCompanyData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DetailRelatedPartiesDriverResponse>>>
      partiesDriverData = ValueNotifier(const AsyncData());

  Future<void> fetchPartiesDriver(FormArray formArray) async {
    try {
      partiesDriverData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .getDetailRelatedPartiesDriver(tourId.value);
      insertDriver(formArray, response);
      partiesDriverData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      partiesDriverData.value = AsyncData(error: e);
    }
  }

  void insertDriver(
      FormArray formArray, List<DetailRelatedPartiesDriverResponse> data) {
    if (data.isNotEmpty) {
      formArray.clear();
      formArray.reset();
      for (var element in data) {
        bool japanese = false;
        bool chinese = false;
        bool vietnamese = false;
        bool english = false;
        bool korean = false;
        bool thai = false;

        if (element.language!.contains('日本語')) {
          japanese = true;
        }

        if (element.language!.contains('中国語')) {
          chinese = true;
        }

        if (element.language!.contains('ベトナム語')) {
          vietnamese = true;
        }

        if (element.language!.contains('英語')) {
          english = true;
        }

        if (element.language!.contains('韓国語')) {
          korean = true;
        }

        if (element.language!.contains('タイ語')) {
          thai = true;
        }

        formArray.add(
          FormGroup(
            {
              '_id': FormControl<String>(value: element.id), // ID
              'dateYearFrom':
                  FormControl<DateTime>(value: element.dateYearFrom), // 年月日（自）
              'dateYearTo':
                  FormControl<DateTime>(value: element.dateYearTo), // 年月日（至）
              'carNumber': FormControl<int>(value: element.carNumber), // 車番
              'vehicleType':
                  FormControl<String>(value: element.vehicleType), // 車種
              'driverNamaKanji': FormControl<String>(
                  value: element.driverNamaKanji), // ドライバー名（漢字）
              'driverNameKana': FormControl<String>(
                  value: element.driverNameKana), // ドライバー名（カナ）
              'phoneNumber':
                  FormControl<String>(value: element.phoneNumber), // 電話番号
              'language':
                  FormControl<List<String>>(value: element.language), // 対応言語
              'accommodationAvailability': FormControl<String>(
                  value: element.accommodationAvailability), // 同宿可否
              'hotelArrangement':
                  FormControl<String>(value: element.hotelArrangement), // ホテル手配
              'accommodationName':
                  FormControl<String>(value: element.accommodationName), // 施設名
              'address': FormControl<String>(value: element.address), // 所在地
              'phoneNumber2':
                  FormControl<String>(value: element.phoneNumber2), //),
              //language
              'japanese': FormControl<bool>(value: japanese),
              'chinese': FormControl<bool>(value: chinese),
              'vietnamese': FormControl<bool>(value: vietnamese),
              'english': FormControl<bool>(value: english),
              'korean': FormControl<bool>(value: korean),
              'thai': FormControl<bool>(value: thai),
              'tour': FormControl<String>(value: element.tour),
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesDriverResponse>>
      submitPartiesDriverData = ValueNotifier(const AsyncData());

  Future<void> submitPartiesDriver(FormGroup formGroup) async {
    try {
      List<DetailRelatedPartiesDriverResponse> data =
          partiesDriverData.value.data ?? [];
      partiesDriverData.value = const AsyncData(loading: true);

      await formGroup.control('driver').value.forEach(
        (element) async {
          List<String> languages = [];
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
          if (element['korean'] == true) {
            languages.add('韓国語');
          }
          if (element['thai'] == true) {
            languages.add('タイ語');
          }
          DetailRelatedPartiesDriverRequest request =
              DetailRelatedPartiesDriverRequest(
            dateYearFrom: element['dateYearFrom'],
            dateYearTo: element['dateYearTo'],
            carNumber: element['carNumber'],
            vehicleType: element['vehicleType'],
            driverNamaKanji: element['driverNamaKanji'],
            driverNameKana: element['driverNameKana'],
            phoneNumber: element['phoneNumber'],
            language: languages,
            accommodationAvailability: element['accommodationAvailability'],
            hotelArrangement: element['hotelArrangement'],
            accommodationName: element['accommodationName'],
            address: element['address'],
            phoneNumber2: element['phoneNumber2'],
            tour: tourId.value,
          );
          if (element['_id'] == null) {
            var result = await processChartRepository
                .postDetailRelatedPartiesDriver(request);
            data.add(result);
          } else {
            var result = await processChartRepository.putRelatedPartiesDriver(
                element['_id'], request);
            data.map((e) => e.id == element['_id'] ? result : e).toList();
          }
        },
      );
      partiesDriverData.value = AsyncData(data: data);
      submitPartiesDriverData.value =
          AsyncData(data: submitPartiesDriverData.value.data);
    } catch (e) {
      logger.d(e);
      submitPartiesDriverData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DetailRelatedPartiesEmergencyContactResponse>>>
      emergencyContactData = ValueNotifier(const AsyncData());

  Future<void> fetchEmergencyContact(FormArray formArray) async {
    try {
      emergencyContactData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .getDetailRelatedPartiesEmergencyContact(tourId.value);
      insertEmergencyContact(formArray, response);
      emergencyContactData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      emergencyContactData.value = AsyncData(error: e);
    }
  }

  void insertEmergencyContact(FormArray formArray,
      List<DetailRelatedPartiesEmergencyContactResponse> data) {
    if (data.isNotEmpty) {
      formArray.clear();
      formArray.reset();
      for (var item in data) {
        formArray.add(
          FormGroup(
            {
              '_id': FormControl<String>(value: item.id), // ID
              'dateYearFrom':
                  FormControl<DateTime>(value: item.dateYearFrom), // 年月日（自）
              'dateYearTo':
                  FormControl<DateTime>(value: item.dateYearTo), // 年月日（至）
              'contactPersonNamaKanji': FormControl<String>(
                  value: item.contactPersonNamaKanji), // 担当者名（漢字）
              'contactPersonNameKana': FormControl<String>(
                  value: item.contactPersonNameKana), // 担当者名（カナ）
              'phoneNumber':
                  FormControl<String>(value: item.phoneNumber), // 電話番号
              'tour': FormControl<String>(value: item.tour),
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesEmergencyContactResponse>>
      submitEmergencyContactData = ValueNotifier(const AsyncData());

  Future<void> submitEmergencyContact(FormGroup formGroup) async {
    try {
      List<DetailRelatedPartiesEmergencyContactResponse> data =
          emergencyContactData.value.data ?? [];
      emergencyContactData.value = const AsyncData(loading: true);
      await formGroup
          .control('emergencyContact')
          .value
          .forEach((element) async {
        DetailRelatedPartiesEmergencyContactRequest request =
            DetailRelatedPartiesEmergencyContactRequest(
          dateYearFrom: element['dateYearFrom'],
          dateYearTo: element['dateYearTo'],
          contactPersonNamaKanji: element['contactPersonNamaKanji'],
          contactPersonNameKana: element['contactPersonNameKana'],
          phoneNumber: element['phoneNumber'],
          tour: tourId.value,
        );

        if (element['_id'] == null) {
          var result = await processChartRepository
              .postDetailRelatedPartiesEmergencyContact(request);
          data.add(result);
        } else {
          var result = await processChartRepository.putRelatedPartiesEmergency(
              element['_id'], request);
          data.map((e) => e.id == element['_id'] ? result : e).toList();
        }
      });
      emergencyContactData.value = AsyncData(data: data);
      submitEmergencyContactData.value =
          AsyncData(data: submitEmergencyContactData.value.data);
    } catch (e) {
      logger.d(e);
      submitEmergencyContactData.value = AsyncData(error: e);
    }
  }
}

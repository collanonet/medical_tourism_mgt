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

  Future<void> fetchData(FormGroup formGroup) async {
    try {
      await fetchParties(formGroup.control('guideInterpreter') as FormArray);
      await fetchBusCompany(formGroup.control('busCompany') as FormGroup);
      await fetchPartiesDriver(formGroup);
      await fetchEmergencyContact(formGroup);
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
    }
  }

  ValueNotifier<AsyncData<List<DetailRelatedPartiesResponse>>> partiesData =
      ValueNotifier(const AsyncData());

  Future<void> fetchParties(FormArray formArray) async {
    try {
      partiesData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailRelatedParties();
      insertRelatedParties(formArray, response);
      partiesData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      partiesData.value = AsyncData(error: e);
    }
  }

  void insertRelatedParties(
      FormArray formArray, List<DetailRelatedPartiesResponse>? data) {
    if (data!.isEmpty) {
      formArray.clear();
      for (var item in data) {
        formArray.add(FormGroup(
          {
            'arrangePerson':
                FormControl<String>(value: item.arrangePerson), // 手配担当
            'dateFrom': FormControl<DateTime>(value: item.dateFrom), // 年月日（自）
            'dateTo': FormControl<DateTime>(value: item.dateTo), // 年月日（至）
            'guideNamaKanji':
                FormControl<String>(value: item.guideNamaKanji), // ガイド名（漢字）
            'guideNameKana':
                FormControl<String>(value: item.guideNameKana), // ガイド名（カナ）
            'phoneNumber': FormControl<String>(value: item.phoneNumber), // 電話番号
            'qualification': FormControl<List<String>>(value: []), // 資格
            'report': FormControl<String>(value: item.report), // 報告書
            'accommodationAvailability': FormControl<String>(
                value: item.accommodationAvailability), // 同宿可否
            'accommodationName':
                FormControl<String>(value: item.accommodationName), // 施設名
            'address': FormControl<String>(value: item.address), // 所在地
            'phoneNumber2': FormControl<String>(value: item.phoneNumber2), //
            //qualification
            'itinerary_management': FormControl<bool>(value: false),
            'guide_interpreter': FormControl<bool>(value: false),
            'medical_interpreter': FormControl<bool>(value: false),
          },
        ));
      }
    } else {
      FormGroup(
        {
          'arrangePerson': FormControl<String>(value: ''), // 手配担当
          'dateFrom': FormControl<DateTime>(), // 年月日（自）
          'dateTo': FormControl<DateTime>(), // 年月日（至）
          'guideNamaKanji': FormControl<String>(value: ''), // ガイド名（漢字）
          'guideNameKana': FormControl<String>(value: ''), // ガイド名（カナ）
          'phoneNumber': FormControl<String>(value: ''), // 電話番号
          'qualification': FormControl<List<String>>(value: []), // 資格
          'report': FormControl<String>(value: ''), // 報告書
          'accommodationAvailability': FormControl<String>(value: ''), // 同宿可否
          'accommodationName': FormControl<String>(value: ''), // 施設名
          'address': FormControl<String>(value: ''), // 所在地
          'phoneNumber2': FormControl<String>(value: ''),
          //qualification
          'itinerary_management': FormControl<bool>(value: false),
          'guide_interpreter': FormControl<bool>(value: false),
          'medical_interpreter': FormControl<bool>(value: false),
        },
      );
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesResponse>> submitPartiesData =
      ValueNotifier(const AsyncData());

  Future<void> submitParties(FormGroup formGroup) async {
    try {
      partiesData.value = const AsyncData(loading: true, data: []);
      await formGroup.control('guideInterpreter').value.forEach(
        (element) async {
          List<String> qualifications = [];
          if (element['itinerary_management'] == true) {
            qualifications.add('アルファード');
          }
          if (element['guide_interpreter'] == true) {
            qualifications.add('ハイエース');
          }
          if (element['medical_interpreter'] == true) {
            qualifications.add('その他');
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
            tour: null,
          );
          var result =
              await processChartRepository.postDetailRelatedParties(request);
          partiesData.value.copyWith(data: [
            ...partiesData.value.requireData,
            result,
          ]);
        },
      );
      partiesData.value = AsyncData(data: partiesData.value.data);
      // submitPartiesData.value = AsyncData(data: submitPartiesData.value.data);
    } catch (e) {
      logger.d(e);
      partiesData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<List<DetailRelatedPartiesBusCompanyResponse>>>
      busCompanyData = ValueNotifier(const AsyncData());

  Future<void> fetchBusCompany(FormGroup formGroup) async {
    try {
      busCompanyData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.getDetailRelatedPartiesBusCompany();
      insertBusCompany(formGroup, response);
      busCompanyData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      busCompanyData.value = AsyncData(error: e);
    }
  }

  void insertBusCompany(
      FormGroup formGroup, List<DetailRelatedPartiesBusCompanyResponse> data) {
    // formGroup.control('arrangePerson').value = data.arrangePerson;
    // formGroup.control('busCompanyName').value = data.busCompanyName;
    // formGroup.control('contactPerson').value = data.contactPerson;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesBusCompanyResponse>>
      submitBusCompanyData = ValueNotifier(const AsyncData());

  Future<void> submitBusCompany(FormGroup formGroup) async {
    try {
      submitBusCompanyData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.postDetailRelatedPartiesBusCompany(
              DetailRelatedPartiesBusCompanyRequest.fromJson(
        (formGroup.control('busCompany') as FormGroup).value,
      ));
      busCompanyData.value = AsyncData(data: busCompanyData.value.data);
      submitBusCompanyData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitBusCompanyData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesDriverResponse>>
      partiesDriverData = ValueNotifier(const AsyncData());

  Future<void> fetchPartiesDriver(FormGroup formGroup) async {
    try {
      partiesDriverData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.getDetailRelatedPartiesDriver();
      insertDriver(formGroup, response);
      partiesDriverData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      partiesDriverData.value = AsyncData(error: e);
    }
  }

  void insertDriver(
      FormGroup formGroup, DetailRelatedPartiesDriverResponse? data) {
    formGroup.control('dateYearFrom').value = data?.dateYearFrom;
    formGroup.control('dateYearTo').value = data?.dateYearTo;

    formGroup.control('carNumber').value = data?.carNumber;
    formGroup.control('vehicleType').value = data?.vehicleType;
    formGroup.control('driverNamaKanji').value = data?.driverNamaKanji;
    formGroup.control('driverNameKana').value = data?.driverNameKana;
    formGroup.control('phoneNumber').value = data?.phoneNumber;
    // formGroup.control('supported_language').value = data?.language;
    formGroup.control('accommodationAvailability').value =
        data?.accommodationAvailability;
    formGroup.control('hotelArrangement').value = data?.hotelArrangement;
    formGroup.control('accommodationName').value = data?.accommodationName;
    formGroup.control('address').value = data?.address;
    formGroup.control('phoneNumber2').value = data?.phoneNumber2;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesDriverResponse>>
      submitPartiesDriverData = ValueNotifier(const AsyncData());

  Future<void> submitPartiesDriver(FormGroup formGroup) async {
    try {
      partiesDriverData.value = const AsyncData(loading: true);

      await formGroup.control('driver').value.forEach((element) async {
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
        );
        var result = await processChartRepository
            .postDetailRelatedPartiesDriver(request);
        //partiesDriverData.value.copyWith(data: [...partiesDriverData.value.requireData,result]);
        partiesData.value = AsyncData(data: partiesData.value.data);
      });
    } catch (e) {
      logger.d(e);
      submitPartiesDriverData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesEmergencyContactResponse>>
      emergencyContactData = ValueNotifier(const AsyncData());

  Future<void> fetchEmergencyContact(FormGroup formGroup) async {
    try {
      emergencyContactData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .getDetailRelatedPartiesEmergencyContact();
      insertEmergencyContact(formGroup, response);
      emergencyContactData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      emergencyContactData.value = AsyncData(error: e);
    }
  }

  void insertEmergencyContact(
      FormGroup formGroup, DetailRelatedPartiesEmergencyContactResponse? data) {
    formGroup.control('dateYearFrom').value = data?.dateYearFrom;
    formGroup.control('dateYearTo').value = data?.dateYearTo;
    formGroup.control('contactPersonNamaKanji').value =
        data?.contactPersonNamaKanji;
    formGroup.control('contactPersonNameKana').value =
        data?.contactPersonNameKana;
    formGroup.control('phoneNumber').value = data?.phoneNumber;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesEmergencyContactResponse>>
      submitEmergencyContactData = ValueNotifier(const AsyncData());

  Future<void> submitEmergencyContact(FormGroup formGroup) async {
    try {
      emergencyContactData.value = const AsyncData(loading: true);
      await formGroup.control('emergencyContact').value.forEach((element) {
        DetailRelatedPartiesEmergencyContactRequest request =
            DetailRelatedPartiesEmergencyContactRequest(
          dateYearFrom: element['dateYearFrom'],
          dateYearTo: element['dateYearTo'],
          contactPersonNamaKanji: element['contactPersonNamaKanji'],
          contactPersonNameKana: element['contactPersonNameKana'],
          phoneNumber: element['phoneNumber'],
          tour: null,
        );
        processChartRepository
            .postDetailRelatedPartiesEmergencyContact(request);
      });
      emergencyContactData.value =
          AsyncData(data: emergencyContactData.value.data);
    } catch (e) {
      logger.d(e);
      submitEmergencyContactData.value = AsyncData(error: e);
    }
  }
}

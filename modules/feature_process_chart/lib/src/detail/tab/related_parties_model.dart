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
      await fetchParties(formGroup);
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
      // await submitBusCompany(formGroup);
      // await submitPartiesDriver(formGroup);
      // await submitEmergencyContact(formGroup);
      submit.value = const AsyncData(data: true);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<List<DetailRelatedPartiesResponse>>> partiesData =
      ValueNotifier(const AsyncData());
  Future<void> fetchParties(FormGroup formGroup) async {
    try {
      partiesData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailRelatedParties();
      insertRelatedParties(formGroup, response);
      partiesData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      partiesData.value = AsyncData(error: e);
    }
  }

  void insertRelatedParties(
      FormGroup formGroup, List<DetailRelatedPartiesResponse>? data) {
    // formGroup.control('Person_in_charge_of_arrangements').value =
    //     data?.arrangePerson;
    // formGroup.control('Date_from').value = data?.dateFrom;
    // formGroup.control('Date_to').value = data?.dateTo;
    // formGroup.control('Guide_name_Kanji').value = data?.guideNamaKanji;
    // formGroup.control('Guide_name_kana').value = data?.guideNameKana;
    // formGroup.control('telephone_number_1').value = data?.phoneNumber;
    // // formGroup.control('qualification').value = data?.qualification;
    // formGroup.control('report').value = data?.report;
    // formGroup.control('Accommodation_possible').value =
    //     data?.accommodationAvailability;
    // formGroup.control('Name_of_facility').value = data?.accommodationName;
    // formGroup.control('location').value = data?.address;
    // formGroup.control('telephone_number_2').value = data?.phoneNumber2;
    // formGroup.control('itinerary_management').value = data?.itineraryManagement;
    // formGroup.control('guide_or_interpreter').value = data?.guideInterpreter;
    // formGroup.control('medical_interpreter').value = data?.medicalInterpreter;
    // formGroup.control('Possibility_of_staying_together').value = data?.personInChargeOfArrangements;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesResponse>> submitPartiesData =
      ValueNotifier(const AsyncData());
  Future<void> submitParties(FormGroup formGroup) async {
    try {
      // submitPartiesData.value = const AsyncData(loading: true);
      partiesData.value = const AsyncData(loading: true,data: []);
      await formGroup.control('guideInterpreter').value.forEach(
        (element) async {
          DetailRelatedPartiesRequest request = DetailRelatedPartiesRequest(
            arrangePerson: element['arrangePerson'],
            dateFrom: element['dateFrom'],
            dateTo: element['dateTo'],
            guideNamaKanji: element['guideNamaKanji'],
            guideNameKana: element['guideNameKana'],
            phoneNumber: element['phoneNumber'],
            qualification: ['test'],
            report: element['report'],
            accommodationAvailability: 'test',
            accommodationName: element['accommodationName'],
            address: element['address'],
            phoneNumber2: element['phoneNumber2'],
            tour: '',
          );
          var result =
              await processChartRepository.postDetailRelatedParties(request);
          partiesData.value.copyWith(data: [
            ...partiesData.value.requireData,
            result,
          ]);
          logger.d('Data : ${element['arrangePerson']}');
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
      FormGroup formGroup, List<DetailRelatedPartiesBusCompanyResponse> data) {}

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
      busCompanyData.value =
          AsyncData(data: busCompanyData.value.data!..add(response));
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
    formGroup.control('Date_from').value = data?.dateYearFrom;
    formGroup.control('Date_to').value = data?.dateYearTo;
    formGroup.control('car_number').value = data?.carNumber;
    formGroup.control('Car_model').value = data?.vehicleType;
    formGroup.control('Driver_name_Kanji').value = data?.driverNamaKanji;
    formGroup.control('Driver_name_kana').value = data?.driverNameKana;
    formGroup.control('telephone_number_1').value = data?.phoneNumber;
    // formGroup.control('supported_language').value = data?.language;
    formGroup.control('Accommodation_possible').value =
        data?.accommodationAvailability;
    formGroup.control('Hotel_arrangement').value = data?.hotelArrangement;
    formGroup.control('Name_of_facility').value = data?.accommodationName;
    formGroup.control('location').value = data?.address;
    formGroup.control('telephone_number_2').value = data?.phoneNumber2;
    // formGroup.control('car_model').value = data?.carModel2;
    // formGroup.control('japanese').value = data?.japanese;
    // formGroup.control('chinese').value = data?.chinese;
    // formGroup.control('vietnamese').value = data?.vietnamese;
    // formGroup.control('english').value = data?.english;
    // formGroup.control('korean').value = data?.korean;
    // formGroup.control('other').value = data?.other;
    // formGroup.control('Possibility_of_staying_together').value = data?.possibilityOfStayingTogether;
    // formGroup.control('hotel_arrangements').value = data?.hotelArrangements;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesDriverResponse>>
      submitPartiesDriverData = ValueNotifier(const AsyncData());
  Future<void> submitPartiesDriver(FormGroup formGroup) async {
    try {
      submitPartiesDriverData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.postDetailRelatedPartiesDriver(
        DetailRelatedPartiesDriverRequest.fromJson(
          formGroup.control('driver').value,
        ),
      );
      submitPartiesDriverData.value = AsyncData(data: response);
      partiesDriverData.value = AsyncData(data: response);
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
    formGroup.control('Date_from').value = data?.dateYearFrom;
    formGroup.control('Date_to').value = data?.dateYearTo;
    formGroup.control('Person_in_charge_Kanji').value =
        data?.contactPersonNamaKanji;
    formGroup.control('Person_in_charge_kana').value =
        data?.contactPersonNameKana;
    formGroup.control('telephone_number').value = data?.phoneNumber;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesEmergencyContactResponse>>
      submitEmergencyContactData = ValueNotifier(const AsyncData());
  Future<void> submitEmergencyContact(FormGroup formGroup) async {
    try {
      submitEmergencyContactData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.postDetailRelatedPartiesEmergencyContact(
        DetailRelatedPartiesEmergencyContactRequest.fromJson(
          formGroup.control('emergency_contact').value,
        ),
      );
      submitEmergencyContactData.value = AsyncData(data: response);
      emergencyContactData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
      submitEmergencyContactData.value = AsyncData(error: e);
    }
  }
}

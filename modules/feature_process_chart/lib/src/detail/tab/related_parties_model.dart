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
      await fetchBusCompany(formGroup.control('bus_company') as FormGroup);
      await fetchPartiesDriver(formGroup);
      await fetchEmergencyContact(formGroup);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit =
      ValueNotifier(const AsyncData(loading: true));
  Future<void> submitData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      await submitParties(formGroup);
      await submitBusCompany(formGroup.control('bus_company') as FormGroup);
      await submitPartiesDriver(formGroup);
      await submitEmergencyContact(formGroup);
      submit.value = const AsyncData(loading: false);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesResponse>> partiesData =
      ValueNotifier(const AsyncData());
  Future<void> fetchParties(FormGroup formGroup) async {
    try {
      partiesData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailRelatedParties();
      insertRelatedParties(formGroup, response);
      partiesData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertRelatedParties(
      FormGroup formGroup, DetailRelatedPartiesResponse? data) {
    formGroup.control('Person_in_charge_of_arrangements').value =
        data?.personInChargeOfArrangements;
    formGroup.control('Date_from').value = data?.dateFrom;
    formGroup.control('Date_to').value = data?.dateTo;
    formGroup.control('Guide_name_Kanji').value = data?.guideNameKanji;
    formGroup.control('Guide_name_kana').value = data?.guideNameKana;
    formGroup.control('telephone_number_1').value = data?.telephoneNumber1;
    formGroup.control('qualification').value = data?.qualification;
    formGroup.control('report').value = data?.report;
    formGroup.control('Accommodation_possible').value =
        data?.accommodationPossible;
    formGroup.control('Name_of_facility').value = data?.nameOfFacility;
    formGroup.control('location').value = data?.location;
    formGroup.control('telephone_number_2').value = data?.telephoneNumber2;
    formGroup.control('itinerary_management').value = data?.itineraryManagement;
    formGroup.control('guide_or_interpreter').value = data?.guideInterpreter;
    formGroup.control('medical_interpreter').value = data?.medicalInterpreter;
    formGroup.control('Possibility_of_staying_together').value = data?.personInChargeOfArrangements;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesResponse>> submitPartiesData =
      ValueNotifier(const AsyncData());
  Future<void> submitParties(FormGroup formGroup) async {
    try {
      submitPartiesData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailRelatedParties(
        DetailRelatedPartiesRequest.fromJson(
          await formGroup.control('guide_or_interpreter').value.forEach(
            (element) async {
              DetailRelatedPartiesRequest request = DetailRelatedPartiesRequest(
                personInChargeOfArrangements:
                    element['Person_in_charge_of_arrangements'],
                dateFrom: element['date_from'],
                dateTo: element['date_to'],
                guideNameKanji: element['Guide_name_Kanji'],
                guideNameKana: element['Guide_name_kana'],
                telephoneNumber1: element['telephone_number_1'],
                qualification: element['qualification'],
                report: element.report,
                accommodationPossible: element['Accommodation_possible'],
                nameOfFacility: element['Name_of_facility'],
                location: element['location'],
                telephoneNumber2: element['telephone_number_2'],
                itineraryManagement: element['itinerary_management'],
                guideInterpreter: element['guide_interpreter'],
                medicalInterpreter: element['medical_interpreter'],
                possibilityOfStayingTogether: element['Possibility_of_staying_together'],
              );
              await processChartRepository.postDetailRelatedParties(request);
            },
          ),
        ),
      );
      partiesData.value = AsyncData(data: response);
      submitPartiesData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesBusCompanyResponse>>
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
    }
  }

  void insertBusCompany(
      FormGroup formGroup, DetailRelatedPartiesBusCompanyResponse? data) {
    formGroup.control('Person_in_charge_of_arrangements').value =
        data?.personInChargeOfArrangements;
    formGroup.control('Bus_company_name').value = data?.busCompanyName;
    formGroup.control('manager').value = data?.manager;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesBusCompanyResponse>> submitBusCompanyData = ValueNotifier(const AsyncData());
  Future<void> submitBusCompany(FormGroup formGroup) async{
    try{  
      submitBusCompanyData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailRelatedPartiesBusCompany(
        DetailRelatedPartiesBusCompanyRequest.fromJson(
          formGroup.control('bus_company').value,
        ),
      );
      busCompanyData.value = AsyncData(data: response);
      submitBusCompanyData.value = AsyncData(data: response);


    }catch(e){
      logger.d(e);
      submitBusCompanyData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesDriverResponse>> partiesDriverData = ValueNotifier(const AsyncData());
  Future<void> fetchPartiesDriver(FormGroup formGroup) async {
    try{
      partiesDriverData.value = const AsyncData(loading: true);
    final response = await processChartRepository.getDetailRelatedPartiesDriver();
      insertDriver(formGroup, response);
      partiesDriverData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
    
  }

  void insertDriver(FormGroup formGroup,DetailRelatedPartiesDriverResponse? data){
    formGroup.control('Date_from').value = data?.dateFrom;
    formGroup.control('Date_to').value = data?.dateTo;
    formGroup.control('car_number').value = data?.carNumber;
    formGroup.control('Car_model').value = data?.carModel;
    formGroup.control('Driver_name_Kanji').value = data?.driverNameKanji;
    formGroup.control('Driver_name_kana').value = data?.driverNameKana;
    formGroup.control('telephone_number_1').value = data?.telephoneNumber1;
    formGroup.control('supported_language').value = data?.supportedLanguage;
    formGroup.control('Accommodation_possible').value = data?.accommodationPossible;
    formGroup.control('Hotel_arrangement').value = data?.hotelArrangement;
    formGroup.control('Name_of_facility').value = data?.nameOfFacility;
    formGroup.control('location').value = data?.location;
    formGroup.control('telephone_number_2').value = data?.telephoneNumber2;
    formGroup.control('car_model').value = data?.carModel2;
    formGroup.control('japanese').value = data?.japanese;
    formGroup.control('chinese').value = data?.chinese;
    formGroup.control('vietnamese').value = data?.vietnamese;
    formGroup.control('english').value = data?.english;
    formGroup.control('korean').value = data?.korean;
    formGroup.control('other').value = data?.other;
    formGroup.control('Possibility_of_staying_together').value = data?.possibilityOfStayingTogether;
    formGroup.control('hotel_arrangements').value = data?.hotelArrangements;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesDriverResponse>> submitPartiesDriverData = ValueNotifier(const AsyncData());
  Future<void> submitPartiesDriver(FormGroup formGroup) async{
    try{
      submitPartiesDriverData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailRelatedPartiesDriver(
        DetailRelatedPartiesDriverRequest.fromJson(
          formGroup.control('driver').value,
        ),
      );
      submitPartiesDriverData.value = AsyncData(data: response);
      partiesDriverData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submitPartiesDriverData.value = AsyncData(error: e);
    }

  }

  ValueNotifier<AsyncData<DetailRelatedPartiesEmergencyContactResponse>> emergencyContactData = ValueNotifier(const AsyncData());
  Future<void> fetchEmergencyContact(FormGroup formGroup) async{
    try{
      emergencyContactData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailRelatedPartiesEmergencyContact();
      insertEmergencyContact(formGroup, response);

    }catch(e){
      logger.d(e);
    }
  }

  void insertEmergencyContact(FormGroup formGroup,DetailRelatedPartiesEmergencyContactResponse? data){
    formGroup.control('Date_from').value = data?.dateFrom;
    formGroup.control('Date_to').value = data?.dateTo;
    formGroup.control('Person_in_charge_Kanji').value = data?.personInChargeKanji;
    formGroup.control('Person_in_charge_kana').value = data?.personInChargeKana;
    formGroup.control('telephone_number').value = data?.telephoneNumber;
  }

  ValueNotifier<AsyncData<DetailRelatedPartiesEmergencyContactResponse>> submitEmergencyContactData = ValueNotifier(const AsyncData());
  Future<void> submitEmergencyContact(FormGroup formGroup) async{
    try{
      submitEmergencyContactData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailRelatedPartiesEmergencyContact(
        DetailRelatedPartiesEmergencyContactRequest.fromJson(
          formGroup.control('emergency_contact').value,
        ),
      );
      submitEmergencyContactData.value = AsyncData(data: response);
      emergencyContactData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
      submitEmergencyContactData.value = AsyncData(error: e);
    }
  }
}

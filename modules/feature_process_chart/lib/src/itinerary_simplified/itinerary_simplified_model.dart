import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ItinerarySimpleVersionModel {
  ItinerarySimpleVersionModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  ValueNotifier<List<ExplanationVarious>> dataVarious = ValueNotifier([
    ExplanationVarious(various: 'PETCT'),
  ]);

  Future<void> fetchData(FormGroup formGroup) async {
    try {
      await fetchTitleData(formGroup);
      await fetchExplanationData(formGroup.control('prior_explanation') as FormGroup);
      await fetchInterpreterData(formGroup.control('Interpreter_or_guide') as FormGroup);
      await fetchPickUpDropOffData(formGroup.control('pick_up_and_drop_off') as FormGroup);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());
  Future<void> submitData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      await submitTitle(formGroup);
      await submitExplanation(formGroup.control('prior_explanation') as FormGroup);
      await submitInterpreter(formGroup.control('Interpreter_or_guide') as FormGroup);
      await submitPickUpDropOff(formGroup.control('pick_up_and_drop_off') as FormGroup);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<DetailItinerarySimpleTitle>> titleData =
  ValueNotifier(const AsyncData());

  Future<void> fetchTitleData(FormGroup formGroup) async {
    try {
      titleData.value = const AsyncData(loading: true);
      final response =
      await processChartRepository.getDetailItinerarySimpleTitle();
      insertItineraryTitle(formGroup, response);
      titleData.value = AsyncData(data: response);
    } catch (e) {
      logger.d(e);
    }
  }

  void insertItineraryTitle(
      FormGroup formGroup, DetailItinerarySimpleTitle? data) {
    formGroup.control('patienName').value = data?.patientName;
    formGroup.control('Name_of_medical_institution').value =
        data?.nameOfMedicalInstitution;
    formGroup.control('dateAndTimeConsultaion').value =
        data?.dateAndTimeConsultaion;
    formGroup.control('startTime').value = data?.startTime;
    formGroup.control('endTime').value = data?.endTime;
    formGroup.control('endTime').value = data?.endTime;
    formGroup.control('Health_Check_Package').value = data?.healthCheckPackage;
    formGroup.control('optionName').value = data?.optionName;
    formGroup.control('checkupDate').value = data?.checkupDate;
    formGroup.control('date').value = data?.date;
    formGroup.control('time').value = data?.time;
  }

  ValueNotifier<AsyncData<DetailItinerarySimpleTitle>> submitTilteData =
  ValueNotifier(const AsyncData());
  Future<void> submitTitle(FormGroup formGroup) async {
    try {
      submitTilteData.value = const AsyncData(loading: true);
      final response =
      await processChartRepository.postDetailItinerarySimpleTitle(
        DetailItinerarySimpleTitleRequest.fromJson(
          formGroup.control('title').value,
        ),
      );
      submitTilteData.value = AsyncData(data: response);
      titleData.value = AsyncData(data: response);
    } catch (e) {
      submitTilteData.value = AsyncData(error: e.toString());
    }
  }

  ValueNotifier<AsyncData<DetailItinerarySimplePriorExplanationResponse>> explanationData = ValueNotifier(const AsyncData());
  Future<void> fetchExplanationData(FormGroup formGroup) async {
    try{
      explanationData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailItinerarySimplePriorExplanation();
      insertExplanation(formGroup, response);
      explanationData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }

  }

  void insertExplanation(FormGroup formGroup, DetailItinerarySimplePriorExplanationResponse? data) {
    formGroup.control('Explanation_of_various_tests').value = data?.explanationOfVariousTests;
    formGroup.control('Meals_before_and_on_the_day_of_the_examination').value = data?.mealsBeforeAndOnTheDayOfTheExamination;
    formGroup.control('about_taking_medicine').value = data?.aboutTakingMedicine;
    formGroup.control('bring_on_the_day_of_your_health_check').value = data?.bringOnTheDayOfYourHealthCheck;
    formGroup.control('other_considerations').value = data?.otherConsiderations;
  }

  ValueNotifier<AsyncData<DetailItinerarySimplePriorExplanationResponse>> submitExplanationData = ValueNotifier(const AsyncData());
  Future<void> submitExplanation(FormGroup formGroup) async {
    try{
      submitExplanationData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailItinerarySimplePriorExplanation(
        DetailItinerarySimplePriorExplanationRequest.fromJson(
          formGroup.control('prior_explanation').value,
        ),
      );
      submitExplanationData.value = AsyncData(data: response);
      explanationData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<DetailItinerarySimpleInterpreterOrGuideResponse>> interpreterData = ValueNotifier(const AsyncData());
  Future<void> fetchInterpreterData(FormGroup formGroup) async {
    try{
      interpreterData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailItinerarySimpleInterpretorOrGuideInput();
      insertInterpreter(formGroup, response);

    }catch(e){
      logger.d(e);
    }
  }

  void insertInterpreter(FormGroup formGroup, DetailItinerarySimpleInterpreterOrGuideResponse? data) {
    formGroup.control('interpreter_or_guide').value = data?.interpreterOrGuide;
    formGroup.control('date').value = data?.date;
    formGroup.control('time').value = data?.time;
    formGroup.control('meeting_point').value = data?.meetingPoint;
  }

  ValueNotifier<AsyncData<DetailItinerarySimpleInterpreterOrGuideResponse>> submitInterpreterData = ValueNotifier(const AsyncData());
  Future<void> submitInterpreter(FormGroup formGroup) async {
    try{
      submitExplanationData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailItinerarySimpleInterpretorOrGuideInput(
        DetailItinerarySimpleInterpreterOrGuideRequest.fromJson(
          formGroup.control('Interpreter_or_guide').value,
        ),
      );
      submitInterpreterData.value = AsyncData(data: response);
      interpreterData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<DetailItinerarySimplePickUpAndDropOffResponse>> pickUpDropOffData = ValueNotifier(const AsyncData());
  Future<void> fetchPickUpDropOffData(FormGroup formGroup) async {
    try{
      pickUpDropOffData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getDetailItinerarySimplePickUpAndDropOff();
      inserPickUp(formGroup, response);
      pickUpDropOffData.value = AsyncData(data: response);
    }catch(e){
      logger.d(e);
    }
  }

  void inserPickUp(FormGroup formGroup, DetailItinerarySimplePickUpAndDropOffResponse? data) {
    formGroup.control('pick_up_and_drop_off_check').value = data?.pickUpAndDropOffCheck;
    formGroup.control('Pick_up_date_and_time').value = data?.pickUpDateAndTime;
    formGroup.control('time').value = data?.time;
    formGroup.control('place').value = data?.place;
    formGroup.control('type').value = data?.type;
    formGroup.control('arranger').value = data?.arranger;
    formGroup.control('carNumber').value = data?.carNumber;
    formGroup.control('driverNameKanli').value = data?.driverNameKanli;
    formGroup.control('driverNameKana').value = data?.driverNameKana;
    formGroup.control('phone').value = data?.phone;
  }

  ValueNotifier<AsyncData<DetailItinerarySimplePickUpAndDropOffResponse>> submitPickUpDropOffData = ValueNotifier(const AsyncData());
  Future<void> submitPickUpDropOff(FormGroup formGroup) async {
    try{
      submitExplanationData.value = const AsyncData(loading: true);
      final response = await processChartRepository.postDetailItinerarySimplePickUpAndDropOff(
        DetailItinerarySimplePickUpAndDropOffRequest.fromJson(
          formGroup.control('pick_up_and_drop_off').value,
        ),
      );
      submitPickUpDropOffData.value = AsyncData(data: response);
      pickUpDropOffData.value = AsyncData(data: response);

    }catch(e){
      logger.d(e);
      submitExplanationData.value = AsyncData(error: e.toString());
    }

  }
}


class ExplanationVarious {
  String various;

  ExplanationVarious({required this.various});
}

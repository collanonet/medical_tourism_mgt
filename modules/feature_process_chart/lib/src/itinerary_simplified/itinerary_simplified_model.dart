// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class ItinerarySimplifiedModel {
  ItinerarySimplifiedModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;

  Future<void> fetchData(FormGroup formGroup) async {
    try {
      await fetchItineraryTitel(formGroup.control('title') as FormGroup);
      await fetchItineraryExplanation(
          formGroup.control('prior_explanation') as FormGroup);
      await fetchItineraryInterpreterOrGuideInput(
          formGroup.control('interpreter_or_guide_input') as FormGroup);
      await fetchItineraryTransferInpu(
          formGroup.control('Transfer_input') as FormGroup);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<bool>> submit = ValueNotifier(const AsyncData());
  void submitData(FormGroup formGroup) async {
    try {
      submit.value = const AsyncData(loading: true);
      await submitItineraryTitle(formGroup.control('title') as FormGroup);
      await submitItineraryExplanation(
          formGroup.control('prior_explanation') as FormGroup);
      await submitItineraryInterpreterOrGuideInput(
          formGroup.control('interpreter_or_guide_input') as FormGroup);
      await submitItineraryTransferInput(
          formGroup.control('Transfer_input') as FormGroup);
      submit.value = const AsyncData(loading: false);
    } catch (e) {
      logger.d(e);
    }
  }

  ValueNotifier<AsyncData<ItineraryTitleResponse>> itineraryTitleData =
      ValueNotifier(const AsyncData());
  Future<void> fetchItineraryTitel(FormGroup formGroup) async {
    try {
      itineraryTitleData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getItineraryTitle();
      insertItineraryTitle(formGroup, response);
    } catch (e) {
      itineraryTitleData.value = AsyncData(error: e);
    }
  }

  void insertItineraryTitle(FormGroup formGroup, ItineraryTitleResponse? data) {
    var addOption = formGroup.control('Add_option') as FormArray;
    formGroup.control('patientName').value = data?.patientName;
    formGroup.control('Medical_institution_name').value =
        data?.medicalInstitutionName;
    formGroup.control('Consultation_date_and_time').value =
        data?.consultationDateAndTime;
    formGroup.control('Start_time').value = data?.startTime;
    formGroup.control('Ending_time_planned').value = data?.endingTimePlanned;
    formGroup.control('health_checkup_package').value =
        data?.healthCheckupPackage;
    if (data?.addOptions != null && data!.addOptions!.isNotEmpty) {
      for (var element in data.addOptions!) {
        addOption.add(
          FormGroup(
            {
              'option_name': FormControl<String>(value: element.optionName),
              'Medical_examination_day':
                  FormControl<String>(value: element.medicalExaminationDay),
              'date': FormControl<String>(value: element.date),
              'time': FormControl<String>(value: element.time),
            },
          ),
        );
      }
    }
  }

  ValueNotifier<AsyncData<ItineraryTitleResponse>> submititineraryData =
      ValueNotifier(const AsyncData());
  Future<void> submitItineraryTitle(FormGroup formGroup) async {
    try {
      submititineraryData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .postItineraryTitle(ItineraryTitleRequest.fromJson(
        formGroup.control('title').value,
      ));
      submititineraryData.value = AsyncData(data: response);
      itineraryTitleData.value = AsyncData(data: response);
    } catch (e) {
      submititineraryData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<ItineraryExplanationResponse>>
      itineraryExplanationData = ValueNotifier(const AsyncData());
  Future<void> fetchItineraryExplanation(FormGroup formGroup) async {
    try {
      itineraryExplanationData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.getInfoItineraryExamination();
      insertItineraryExplanation(formGroup, response);
    } catch (e) {
      itineraryExplanationData.value = AsyncData(error: e);
    }
  }

  void insertItineraryExplanation(
      FormGroup formGroup, ItineraryExplanationResponse? data) {
    formGroup.control('Explanation_of_various_tests').value =
        data?.explanationOfVariousTests;
    formGroup.control('Explanation_of_various_tests_note').value =
        data?.explanationOfVariousTestsNote;
    formGroup.control('Meals_before_and_on_the_day_of_the_test').value =
        data?.mealsBeforeAndOnTheDayOfTheTest;
    formGroup.control('About_taking_medicine').value =
        data?.aboutTakingMedicine;
    formGroup
        .control('What_to_bring_on_the_day_of_the_medical_examination')
        .value = data?.whatToBringOnTheDayOfTheMedicalExamination;
    formGroup.control('Other_considerations').value = data?.otherConsiderations;
  }

  ValueNotifier<AsyncData<ItineraryExplanationResponse>>
      submititineraryExplanationData = ValueNotifier(const AsyncData());
  Future<void> submitItineraryExplanation(FormGroup formGroup) async {
    try {
      submititineraryExplanationData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .postItineraryExplanation(ItineraryExplanationRequest.fromJson(
        formGroup.control('prior_explanation').value,
      ));
      submititineraryExplanationData.value = AsyncData(data: response);
      itineraryExplanationData.value = AsyncData(data: response);
    } catch (e) {
      submititineraryExplanationData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<ItineraryInterpreterOrGuideInputResponse>>
      itineraryInterpreterOrGuideInputData = ValueNotifier(const AsyncData());
  Future<void> fetchItineraryInterpreterOrGuideInput(
      FormGroup formGroup) async {
    try {
      itineraryInterpreterOrGuideInputData.value =
          const AsyncData(loading: true);
      final response =
          await processChartRepository.getItineraryInterpretorOrGuideInput();
      insertItineraryInterpreterOrGuideInput(formGroup, response);
    } catch (e) {
      itineraryInterpreterOrGuideInputData.value = AsyncData(error: e);
    }
  }

  void insertItineraryInterpreterOrGuideInput(
      FormGroup formGroup, ItineraryInterpreterOrGuideInputResponse? data) {
    formGroup.control('Explanation_of_various_tests').value =
        data?.interpreterOrGuide;
    formGroup.control('date').value = data?.date;
    formGroup.control('time').value = data?.time;
    formGroup.control('meeting_place').value = data?.meetingPlace;
  }

  ValueNotifier<AsyncData<ItineraryInterpreterOrGuideInputResponse>>
      submititineraryInterpreterOrGuideInputData =
      ValueNotifier(const AsyncData());
  Future<void> submitItineraryInterpreterOrGuideInput(
      FormGroup formGroup) async {
    try {
      submititineraryInterpreterOrGuideInputData.value =
          const AsyncData(loading: true);
      final response =
          await processChartRepository.postItineraryInterpretorOrGuideInput(
              ItineraryInterpreterOrGuideInputRequest.fromJson(
        formGroup.control('interpreter_or_guide_input').value,
      ));
      submititineraryInterpreterOrGuideInputData.value =
          AsyncData(data: response);
      itineraryInterpreterOrGuideInputData.value = AsyncData(data: response);
    } catch (e) {
      submititineraryInterpreterOrGuideInputData.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<ItineraryTransferInputResponse>>
      itineraryTransferData = ValueNotifier(const AsyncData());
  Future<void> fetchItineraryTransferInpu(FormGroup formGroup) async {
    try {
      itineraryTransferData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getItineraryTransferInput();
      insertItineraryTransferInput(formGroup, response);
    } catch (e) {
      itineraryTransferData.value = AsyncData(error: e);
    }
  }

  void insertItineraryTransferInput(
      FormGroup formGroup, ItineraryTransferInputResponse? data) {
    formGroup.control('Transfer').value = data?.transfer;
    formGroup.control('date').value = data?.date;
    formGroup.control('time').value = data?.time;
    formGroup.control('place').value = data?.place;
    formGroup.control('Driver_in_charge').value = data?.driverInCharge;
  }

  ValueNotifier<AsyncData<ItineraryTransferInputResponse>>
      submititineraryTransferData = ValueNotifier(const AsyncData());
  Future<void> submitItineraryTransferInput(FormGroup formGroup) async {
    try {
      submititineraryData.value = const AsyncData(loading: true);
      final response = await processChartRepository
          .postItineraryTransferInput(ItineraryTransferInputRequest.fromJson(
        formGroup.control('Transfer_input').value,
      ));
      submititineraryTransferData.value = AsyncData(data: response);
      itineraryTransferData.value = AsyncData(data: response);
    } catch (e) {
      submititineraryTransferData.value = AsyncData(error: e);
    }
  }
}

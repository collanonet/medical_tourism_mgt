import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

@injectable
class PatientItineraryModel {
  PatientItineraryModel({
    required this.processChartRepository,
    this.patientId,
  });
  final ProcessChartRepository processChartRepository;
  final String? patientId;

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
      submit.value = const AsyncData(data: true, loading: false);
    } catch (e) {
      logger.d(e);
      submit.value = AsyncData(error: e);
    }
  }

  ValueNotifier<AsyncData<ItineraryTitleResponse>> itineraryTitleData =
      ValueNotifier(const AsyncData());
  Future<void> fetchItineraryTitel(FormGroup formGroup) async {
    try {
      itineraryTitleData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getItineraryTitle(patientId);
      logger.d('Fetched Itinerary Title: ${response?.toJson()}');
      insertItineraryTitle(formGroup, response);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        itineraryTitleData.value = const AsyncData(data: null);
      } else {
        itineraryTitleData.value = AsyncData(error: e);
      }
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
    addOption.clear();
    if (data?.addOptions != null && data!.addOptions!.isNotEmpty) {
      for (var element in data.addOptions!) {
        logger.d('Inserting AddOption: optionName=${element.optionName}, date=${element.date}');
        addOption.add(
          FormGroup(
            {
              'option_name': FormControl<String>(value: element.optionName),
              'Medical_examination_day':
                  FormControl<String>(value: element.medicalExaminationDay),
              'date': FormControl<DateTime>(
                  value: _parseDate(element.date)),
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
      final formValue = formGroup.value;
      final addOptions = (formValue['Add_option'] as List<dynamic>?)
          ?.map((e) => AddOption(
                optionName: e['option_name'] as String?,
                medicalExaminationDay: e['Medical_examination_day'] as String?,
                date: e['date'] is DateTime
                    ? (e['date'] as DateTime).toIso8601String().split('T').first
                    : e['date'] as String?,
                time: e['time'] as String?,
              ))
          .toList();

      final request = ItineraryTitleRequest(
        patientName: formValue['patientName'] as String?,
        medicalInstitutionName:
            formValue['Medical_institution_name'] as String?,
        consultationDateAndTime:
            formValue['Consultation_date_and_time'] as String?,
        startTime: formValue['Start_time'] as String?,
        endingTimePlanned: formValue['Ending_time_planned'] as String?,
        healthCheckupPackage:
            formValue['health_checkup_package'] as String?,
        addOptions: addOptions,
        patientId: patientId,
      );

      logger.d('Submitting Itinerary Title: ${request.toJson()}');
      final response = await processChartRepository.postItineraryTitle(request);
      logger.d('Itinerary Title Response: $response');
      submititineraryData.value = AsyncData(data: response);
      itineraryTitleData.value = AsyncData(data: response);
    } catch (e) {
      logger.e('Error submitting Itinerary Title: $e');
      submititineraryData.value = AsyncData(error: e);
      rethrow;
    }
  }

  ValueNotifier<AsyncData<ItineraryExplanationResponse>>
      itineraryExplanationData = ValueNotifier(const AsyncData());
  Future<void> fetchItineraryExplanation(FormGroup formGroup) async {
    try {
      itineraryExplanationData.value = const AsyncData(loading: true);
      final response =
          await processChartRepository.getInfoItineraryExamination(patientId);
      insertItineraryExplanation(formGroup, response);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        itineraryExplanationData.value = const AsyncData(data: null);
      } else {
        itineraryExplanationData.value = AsyncData(error: e);
      }
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
      final formValue = formGroup.value;
      final request = ItineraryExplanationRequest(
        explanationOfVariousTests: formValue['Explanation_of_various_tests'] as String?,
        explanationOfVariousTestsNote: formValue['Explanation_of_various_tests_note'] as String?,
        mealsBeforeAndOnTheDayOfTheTest: formValue['Meals_before_and_on_the_day_of_the_test'] as String?,
        aboutTakingMedicine: formValue['About_taking_medicine'] as String?,
        whatToBringOnTheDayOfTheMedicalExamination: formValue['What_to_bring_on_the_day_of_the_medical_examination'] as String?,
        otherConsiderations: formValue['Other_considerations'] as String?,
        patientId: patientId,
      );
      logger.d('Submitting Itinerary Explanation: ${request.toJson()}');
      final response =
          await processChartRepository.postItineraryExplanation(request);
      logger.d('Itinerary Explanation Response: $response');
      submititineraryExplanationData.value = AsyncData(data: response);
      itineraryExplanationData.value = AsyncData(data: response);
    } catch (e) {
      logger.e('Error submitting Itinerary Explanation: $e');
      submititineraryExplanationData.value = AsyncData(error: e);
      rethrow;
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
          await processChartRepository.getItineraryInterpretorOrGuideInput(patientId);
      insertItineraryInterpreterOrGuideInput(formGroup, response);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        itineraryInterpreterOrGuideInputData.value = const AsyncData(data: null);
      } else {
        itineraryInterpreterOrGuideInputData.value = AsyncData(error: e);
      }
    }
  }

  void insertItineraryInterpreterOrGuideInput(
      FormGroup formGroup, ItineraryInterpreterOrGuideInputResponse? data) {
    formGroup.control('interpreter_or_guide').value =
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
      final formValue = formGroup.value;
      final request = ItineraryInterpreterOrGuideInputRequest(
        interpreterOrGuide: formValue['interpreter_or_guide'] as String?,
        date: formValue['date'] as String?,
        time: formValue['time'] as String?,
        meetingPlace: formValue['meeting_place'] as String?,
        patientId: patientId,
      );
      logger.d('Submitting Itinerary Interpreter: ${request.toJson()}');
      final response =
          await processChartRepository.postItineraryInterpretorOrGuideInput(
              request);
      logger.d('Itinerary Interpreter Response: $response');
      submititineraryInterpreterOrGuideInputData.value =
          AsyncData(data: response);
      itineraryInterpreterOrGuideInputData.value = AsyncData(data: response);
    } catch (e) {
      logger.e('Error submitting Itinerary Interpreter: $e');
      submititineraryInterpreterOrGuideInputData.value = AsyncData(error: e);
      rethrow;
    }
  }

  ValueNotifier<AsyncData<ItineraryTransferInputResponse>>
      itineraryTransferData = ValueNotifier(const AsyncData());
  Future<void> fetchItineraryTransferInpu(FormGroup formGroup) async {
    try {
      itineraryTransferData.value = const AsyncData(loading: true);
      final response = await processChartRepository.getItineraryTransferInput(patientId);
      insertItineraryTransferInput(formGroup, response);
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 404) {
        itineraryTransferData.value = const AsyncData(data: null);
      } else {
        itineraryTransferData.value = AsyncData(error: e);
      }
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
      final formValue = formGroup.value;
      final request = ItineraryTransferInputRequest(
        transfer: formValue['Transfer'] as String?,
        date: formValue['date'] as String?,
        time: formValue['time'] as String?,
        place: formValue['place'] as String?,
        driverInCharge: formValue['Driver_in_charge'] as String?,
        patientId: patientId,
      );
      logger.d('Submitting Itinerary Transfer: ${request.toJson()}');
      final response = await processChartRepository
          .postItineraryTransferInput(request);
      logger.d('Itinerary Transfer Response: $response');
      submititineraryTransferData.value = AsyncData(data: response);
      itineraryTransferData.value = AsyncData(data: response);
    } catch (e) {
      logger.e('Error submitting Itinerary Transfer: $e');
      submititineraryTransferData.value = AsyncData(error: e);
      rethrow;
    }
  }
  DateTime? _parseDate(String? dateString) {
    if (dateString == null) {
      return null;
    }
    final tryParse = DateTime.tryParse(dateString);
    if (tryParse != null) {
      return tryParse;
    }
    try {
      return DateFormat('yyyy/MM/dd').parse(dateString);
    } catch (e) {
      logger.e('_parseDate: failed to parse $dateString', e);
      return null;
    }
  }
}

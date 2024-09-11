// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProcessChartRemoteProvider {
  ProcessChartRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<PatientFilterResponse> postFilterpatientChart(
      PatientFilterRequst patientFilterRequst) async {
    return apiService.postFilterpatientChart(patientFilterRequst);
  }

  Future<ItineraryTitleResponse> getItineraryTitle() async {
    return apiService.getItineraryTitle();
  }

  Future<ItineraryTitleResponse> postItineraryTitle(
      ItineraryTitleRequest itineraryTitleRequest) async {
    return apiService.postItineraryTitle(itineraryTitleRequest);
  }

  Future<ItineraryExplanationResponse> getInfoMedicalExamination() async {
    return await apiService.getItineraryExplanation();
  }

  Future<ItineraryExplanationResponse> postItineraryExplanation(
      ItineraryExplanationRequest itineraryExplanationRequest) async {
    return await apiService
        .postItineraryExplanation(itineraryExplanationRequest);
  }

  Future<ItineraryInterpreterOrGuideInputResponse>
      getItineraryInterpretorOrGuideInput() async {
    return await apiService.getItineraryInterpretorOrGuideInput();
  }

  Future<ItineraryInterpreterOrGuideInputResponse>
      postItineraryInterpretorOrGuideInput(
          ItineraryInterpreterOrGuideInputRequest
              itineraryInterpreterOrGuideInputRequest) async {
    return await apiService.postItineraryInterpretorOrGuideInput(
        itineraryInterpreterOrGuideInputRequest);
  }

  Future<ItineraryTransferInputResponse> getItineraryTransferInput() async {
    return await apiService.getItineraryTransferInput();
  }

  Future<ItineraryTransferInputResponse> postItineraryTransferInput(
      ItineraryTransferInputRequest itineraryTransferInputRequest) async {
    return await apiService
        .postItineraryTransferInput(itineraryTransferInputRequest);
  }

  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital(String id) async {
    return await apiService.getDetialFacilityHospital(id);
  }

  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(
      DetailFacilityHotelRequest detailFacilityHotelRequest) async {
    return await apiService
        .postDetailFacilityHospital(detailFacilityHotelRequest);
  }

  Future<List<DetailDropInFacilityResponse>> getDetailFacilityDropIn(String id) async {
    return await apiService.getDetailFacilityDropIn(id);
  }

  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(
      DetailDropInFacilityRequest detailDropInFacilityRequest) async {
    return await apiService
        .postDetailFacilityDropIn(detailDropInFacilityRequest);
  }

  Future<List<DetainHotelRegistationResponse>> getDetainlHotelRegistation({
    String? accommodationName,
    // List<String>? accommodationType,
    String? area,
    bool? usageRecord,
    bool? isJapanese,
    bool? isEnglish,
    bool? isVietnamese,
    bool? isThai,
    bool? isKorean,
    bool? isChinese,
  }) async {
    return await apiService.getDetainlHotelRegistation(
      accommodationName: accommodationName,
      // accommodationType: accommodationType,
      area: area,
      usageRecord: usageRecord,
      isJapanese: isJapanese,
      isEnglish: isEnglish,
      isThai: isThai,
      isKorean: isKorean,
      isVietnamese: isVietnamese,
      isChinese: isChinese,
    );
  }

  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(
      DetainHotelRegistationRequest detainHotelRegistationRequest) async {
    return await apiService
        .postDetailHotelRegistation(detainHotelRegistationRequest);
  }

  Future<DetailHotelSearchResponse> postDetialHotelSearch(
      DetailHotelSearchRequest detailHotelSearchRequest) async {
    return await apiService.postDetialHotelSearch(detailHotelSearchRequest);
  }

  Future<List<DetailRelatedPartiesResponse>>
      getRelatedPartiesGuideOrInterpreter(String id) async {
    return await apiService.getRelatedPartiesGuideOrInterpreter(id);
  }

  Future<DetailRelatedPartiesResponse> postRelatedPartiesGuideOrInterpreter(
      DetailRelatedPartiesRequest detailRelatedPartiesRequest) async {
    return await apiService
        .postRelatedPartiesGuideOrInterpreter(detailRelatedPartiesRequest);
  }

  Future<DetailRelatedPartiesBusCompanyResponse>
      getRelatedPartiesBusCompany(String id) async {
    return await apiService.getRelatedPartiesBusCompany(id);
  }

  Future<DetailRelatedPartiesBusCompanyResponse> postRelatedPartiesBusCompany(
      DetailRelatedPartiesBusCompanyRequest
          detailRelatedPartiesBusCompanyRequest) async {
    return await apiService
        .postRelatedPartiesBusCompany(detailRelatedPartiesBusCompanyRequest);
  }

  Future<List<DetailRelatedPartiesDriverResponse>> getRelatedPartiesDriver(String id) async {
    return await apiService.getRelatedPartiesDriver(id);
  }

  Future<DetailRelatedPartiesDriverResponse> postRelatedPartiesDriver(
      DetailRelatedPartiesDriverRequest
          detailRelatedPartiesDriverRequest) async {
    return await apiService
        .postRelatedPartiesDriver(detailRelatedPartiesDriverRequest);
  }

  Future<DetailRelatedPartiesEmergencyContactResponse>
      getRelatedPartiesEmergencyContact(String id) async {
    return await apiService.getRelatedPartiesEmergencyContact(id);
  }

  Future<DetailRelatedPartiesEmergencyContactResponse>
      postRelatedPartiesEmergencyContact(
          DetailRelatedPartiesEmergencyContactRequest
              detailRelatedPartiesEmergencyContactRequest) async {
    return await apiService.postRelatedPartiesEmergencyContact(
        detailRelatedPartiesEmergencyContactRequest);
  }

  Future<DetailItinerarySimpleTitle> getDetailItinerarySimpleTitle() async {
    return await apiService.getDetailItinerarySimpleTitle();
  }

  Future<DetailItinerarySimpleTitle> postDetailItinerarySimpleTitle(
      DetailItinerarySimpleTitleRequest
          detailItinerarySimpleTitleRequest) async {
    return await apiService
        .postDetailItinerarySimpleTitle(detailItinerarySimpleTitleRequest);
  }

  Future<DetailItinerarySimplePriorExplanationResponse>
      getDetailItinerarySimplePriorExplanation() async {
    return await apiService.getDetailItinerarySimpleExplanation();
  }

  Future<DetailItinerarySimplePriorExplanationResponse>
      postDetailItinerarySimpleExplanation(
          DetailItinerarySimplePriorExplanationRequest
              detailItinerarySimplePriorExplanationRequest) async {
    return await apiService.postDetailItinerarySimpleExplanation(
        detailItinerarySimplePriorExplanationRequest);
  }

  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      getDetailItinerarySimpleInterpretorOrGuide() async {
    return await apiService.getDetailItinerarySimpleInterpreter();
  }

  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      postDetailItinerarySimpleInterpretorOrGuide(
          DetailItinerarySimpleInterpreterOrGuideRequest
              detailItinerarySimpleInterpreterOrGuideRequest) async {
    return await apiService.postDetailItinerarySimpleInterpreter(
        detailItinerarySimpleInterpreterOrGuideRequest);
  }

  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      getDetailItinerarySimplePickUpAndDropOff() async {
    return await apiService.getDetailItinerarySimplePickUp();
  }

  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      postDetailItinerarySimplePickUp(
          DetailItinerarySimplePickUpAndDropOffRequest
              detailItinerarySimplePickUpAnd) async {
    return await apiService
        .postDetailItinerarySimplePickUp(detailItinerarySimplePickUpAnd);
  }

  Future<DetailItineraryResponse> getDetailitinerary({String? id}) async {
    return await apiService.getDetailitinerary(
      id: id,
    );
  }

  Future<List<DetailItineraryResponse>> getPatientChart({
    String? tourName,
    String? classification,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) async {
    return await apiService.getPatientChart(
      tourName: tourName,
      classification: classification,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
  }

  Future<DetailItineraryResponse> postDetailitinerary(
      DetailIneraryRequest detailIneraryRequest) async {
    return await apiService.postDetailItinerary(detailIneraryRequest);
  }

  Future<DetailItineraryResponse> putDetailItinerary(
      DetailIneraryRequest request, element) {
    return apiService.putDetailItinerary(element, request);
  }

  Future<DetailRelatedPartiesResponse> putDetailRelatedParties(
      DetailRelatedPartiesRequest request, element) {
    return apiService.putRelatedPartiesGuideOrInterpreter(element, request);
  }

  Future<DetailDropInFacilityResponse> putDetailFacilityDropIn(id, DetailDropInFacilityRequest detailDropInFacilityRequest) {
    return apiService.putDetailFacilityDropIn(id, detailDropInFacilityRequest);
  }

  Future<DetailFacilityHotelResponse> putDetailFacilityHospital(id, DetailFacilityHotelRequest request) {
    return apiService.putDetailFacilityHospital(id, request);
  }
}

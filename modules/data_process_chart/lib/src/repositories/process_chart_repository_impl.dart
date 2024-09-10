// Package imports:
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/process_chart_local_provider.dart';
import '../providers/process_chart_remote_provider.dart';
import 'process_chart_repository.dart';

@Injectable(as: ProcessChartRepository)
class ProcessChartRepositoryIml extends ProcessChartRepository {
  ProcessChartRepositoryIml({
    required this.remote,
    required this.local,
  });

  final ProcessChartRemoteProvider remote;
  final ProcessChartLocalProvider local;

  

  @override
  Future<PatientFilterResponse> postFilterpatientChart(
      PatientFilterRequst patientFilterRequst) {
    return remote.postFilterpatientChart(patientFilterRequst);
  }

  @override
  Future<ItineraryExplanationResponse> getInfoItineraryExamination() {
    return remote.getInfoMedicalExamination();
  }

  @override
  Future<ItineraryTitleResponse> getItineraryTitle() {
    return remote.getItineraryTitle();
  }

  @override
  Future<ItineraryExplanationResponse> postItineraryExplanation(
      ItineraryExplanationRequest itineraryExplanationRequest) {
    return remote.postItineraryExplanation(itineraryExplanationRequest);
  }

  @override
  Future<ItineraryTitleResponse> postItineraryTitle(
      ItineraryTitleRequest itineraryTitleRequest) {
    return remote.postItineraryTitle(itineraryTitleRequest);
  }

  @override
  Future<ItineraryInterpreterOrGuideInputResponse>
      getItineraryInterpretorOrGuideInput() {
    return remote.getItineraryInterpretorOrGuideInput();
  }

  @override
  Future<ItineraryTransferInputResponse> getItineraryTransferInput() {
    return remote.getItineraryTransferInput();
  }

  @override
  Future<ItineraryInterpreterOrGuideInputResponse>
      postItineraryInterpretorOrGuideInput(
          ItineraryInterpreterOrGuideInputRequest
              itineraryInterpreterOrGuideInputRequest) {
    return remote.postItineraryInterpretorOrGuideInput(
        itineraryInterpreterOrGuideInputRequest);
  }

  @override
  Future<ItineraryTransferInputResponse> postItineraryTransferInput(
      ItineraryTransferInputRequest itineraryTransferInputRequest) {
    return remote.postItineraryTransferInput(itineraryTransferInputRequest);
  }

  @override
  Future<List<DetailDropInFacilityResponse>> getDetailFacilityDropIn() {
    return remote.getDetailFacilityDropIn();
  }

  @override
  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital() {
    return remote.getDetialFacilityHospital();
  }

  @override
  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(
      DetailDropInFacilityRequest detailDropInFacilityRequest) {
    return remote.postDetailFacilityDropIn(detailDropInFacilityRequest);
  }

  @override
  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(
      DetailFacilityHotelRequest detailFacilityHotelRequest) {
    return remote.postDetailFacilityHospital(detailFacilityHotelRequest);
  }

  @override
  Future<List<DetainHotelRegistationResponse>> getDetainlHotelRegistation({
    String? accommodationName,
    //  List<String>? accommodationType,
    String? area,
    bool? usageRecord,
    bool? isJapanese,
    bool? isEnglish,
    bool? isVietnamese,
    bool? isThai,
    bool? isKorean,
    bool? isChinese,
  }) {
    return remote.getDetainlHotelRegistation(
      accommodationName: accommodationName,
      //   accommodationType: accommodationType,
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

  @override
  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(
      DetainHotelRegistationRequest detainHotelRegistationRequest) {
    return remote.postDetailHotelRegistation(detainHotelRegistationRequest);
  }

  @override
  Future<DetailHotelSearchResponse> postDetialHotelSearch(
      DetailHotelSearchRequest detailHotelSearchRequest) {
    return remote.postDetialHotelSearch(detailHotelSearchRequest);
  }

  @override
  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      getDetailItinerarySimpleInterpretorOrGuideInput() {
    return remote.getDetailItinerarySimpleInterpretorOrGuide();
  }

  @override
  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      getDetailItinerarySimplePickUpAndDropOff() {
    return remote.getDetailItinerarySimplePickUpAndDropOff();
  }

  @override
  Future<DetailItinerarySimplePriorExplanationResponse>
      getDetailItinerarySimplePriorExplanation() {
    return remote.getDetailItinerarySimplePriorExplanation();
  }

  @override
  Future<DetailItinerarySimpleTitle> getDetailItinerarySimpleTitle() {
    return remote.getDetailItinerarySimpleTitle();
  }

  @override
  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      postDetailItinerarySimpleInterpretorOrGuideInput(
          DetailItinerarySimpleInterpreterOrGuideRequest
              detailItinerarySimpleInterpreterOrGuideRequest) {
    return remote.postDetailItinerarySimpleInterpretorOrGuide(
        detailItinerarySimpleInterpreterOrGuideRequest);
  }

  @override
  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      postDetailItinerarySimplePickUpAndDropOff(
          DetailItinerarySimplePickUpAndDropOffRequest
              detailItinerarySimplePickUpAndDropOffRequest) {
    return remote.postDetailItinerarySimplePickUp(
        detailItinerarySimplePickUpAndDropOffRequest);
  }

  @override
  Future<DetailItinerarySimplePriorExplanationResponse>
      postDetailItinerarySimplePriorExplanation(
          DetailItinerarySimplePriorExplanationRequest
              detailItinerarySimplePriorExplanationRequest) {
    return remote.postDetailItinerarySimpleExplanation(
        detailItinerarySimplePriorExplanationRequest);
  }

  @override
  Future<DetailItinerarySimpleTitle> postDetailItinerarySimpleTitle(
      DetailItinerarySimpleTitleRequest detailItinerarySimpleTitleRequest) {
    return remote
        .postDetailItinerarySimpleTitle(detailItinerarySimpleTitleRequest);
  }

  @override
  Future<List<DetailRelatedPartiesResponse>> getDetailRelatedParties(String id) {
    return remote.getRelatedPartiesGuideOrInterpreter(id);
  }

  @override
  Future<List<DetailRelatedPartiesBusCompanyResponse>>
      getDetailRelatedPartiesBusCompany() {
    return remote.getRelatedPartiesBusCompany();
  }

  @override
  Future<DetailRelatedPartiesDriverResponse> getDetailRelatedPartiesDriver() {
    return remote.getRelatedPartiesDriver();
  }

  @override
  Future<DetailRelatedPartiesEmergencyContactResponse>
      getDetailRelatedPartiesEmergencyContact() {
    return remote.getRelatedPartiesEmergencyContact();
  }

  @override
  Future<DetailRelatedPartiesResponse> postDetailRelatedParties(
      DetailRelatedPartiesRequest detailRelatedPartiesRequest) {
    return remote
        .postRelatedPartiesGuideOrInterpreter(detailRelatedPartiesRequest);
  }

  @override
  Future<DetailRelatedPartiesBusCompanyResponse>
      postDetailRelatedPartiesBusCompany(
          DetailRelatedPartiesBusCompanyRequest
              detailRelatedPartiesBusCompanyRequest) {
    return remote
        .postRelatedPartiesBusCompany(detailRelatedPartiesBusCompanyRequest);
  }

  @override
  Future<DetailRelatedPartiesDriverResponse> postDetailRelatedPartiesDriver(
      DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest) {
    return remote.postRelatedPartiesDriver(detailRelatedPartiesDriverRequest);
  }

  @override
  Future<DetailRelatedPartiesEmergencyContactResponse>
      postDetailRelatedPartiesEmergencyContact(
          DetailRelatedPartiesEmergencyContactRequest
              detailRelatedPartiesEmergencyContactRequest) {
    return remote.postRelatedPartiesEmergencyContact(
        detailRelatedPartiesEmergencyContactRequest);
  }

  @override
  Future<DetailItineraryResponse> getDetailItinerary(String id) {
    return remote.getDetailitinerary(
     id,
     
    );
  }

  @override
  Future<List<DetailItineraryResponse>> getPatientChart({
    String? tourName,
    String? classification,
    DateTime? dateFrom,
    DateTime? dateTo,
  }) {
    return remote.getPatientChart(
       tourName: tourName,
      classification: classification,
      dateFrom: dateFrom,
      dateTo: dateTo,
    );
  }

  @override
  Future<DetailItineraryResponse> postDetailItinerary(
      DetailIneraryRequest detailIneraryRequest) {
    return remote.postDetailitinerary(detailIneraryRequest);
  }

  @override
  Future<DetailRelatedPartiesResponse> putDetailRelatedParties(DetailRelatedPartiesRequest request, element) {
    return remote.putDetailRelatedParties(request, element);
  }
}

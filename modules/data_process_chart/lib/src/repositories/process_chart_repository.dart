// Package imports:
import 'package:core_network/entities.dart';

abstract class ProcessChartRepository {
  Future<PatientFilterResponse> postFilterpatientChart(
    PatientFilterRequst patientFilterRequst,
  );

  Future<ItineraryTitleResponse> getItineraryTitle();

  Future<ItineraryTitleResponse> postItineraryTitle(
    ItineraryTitleRequest itineraryTitleRequest,
  );

  Future<ItineraryExplanationResponse> getInfoItineraryExamination();

  Future<ItineraryExplanationResponse> postItineraryExplanation(
    ItineraryExplanationRequest itineraryExplanationRequest,
  );

  Future<ItineraryInterpreterOrGuideInputResponse>
      getItineraryInterpretorOrGuideInput();

  Future<ItineraryInterpreterOrGuideInputResponse>
      postItineraryInterpretorOrGuideInput(
    ItineraryInterpreterOrGuideInputRequest
        itineraryInterpreterOrGuideInputRequest,
  );

  Future<ItineraryTransferInputResponse> getItineraryTransferInput();

  Future<ItineraryTransferInputResponse> postItineraryTransferInput(
    ItineraryTransferInputRequest itineraryTransferInputRequest,
  );

  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital(
      String id);

  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(
    DetailFacilityHotelRequest detailFacilityHotelRequest,
  );

  Future<DetailDropInFacilityResponse> getDetailFacilityDropIn(String tourId);

  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(
    DetailDropInFacilityRequest detailDropInFacilityRequest,
  );

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
  });

  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(
    DetainHotelRegistationRequest detainHotelRegistationRequest,
  );

  Future<DetailHotelSearchResponse> postDetialHotelSearch(
    DetailHotelSearchRequest detailHotelSearchRequest,
  );

  Future<DetailItinerarySimpleTitle> getDetailItinerarySimpleTitle();

  Future<DetailItinerarySimpleTitle> postDetailItinerarySimpleTitle(
    DetailItinerarySimpleTitleRequest detailItinerarySimpleTitleRequest,
  );

  Future<DetailItinerarySimplePriorExplanationResponse>
      getDetailItinerarySimplePriorExplanation();

  Future<DetailItinerarySimplePriorExplanationResponse>
      postDetailItinerarySimplePriorExplanation(
    DetailItinerarySimplePriorExplanationRequest
        detailItinerarySimplePriorExplanationRequest,
  );

  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      getDetailItinerarySimpleInterpretorOrGuideInput();

  Future<DetailItinerarySimpleInterpreterOrGuideResponse>
      postDetailItinerarySimpleInterpretorOrGuideInput(
    DetailItinerarySimpleInterpreterOrGuideRequest
        detailItinerarySimpleInterpreterOrGuideRequest,
  );

  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      getDetailItinerarySimplePickUpAndDropOff();

  Future<DetailItinerarySimplePickUpAndDropOffResponse>
      postDetailItinerarySimplePickUpAndDropOff(
    DetailItinerarySimplePickUpAndDropOffRequest
        detailItinerarySimplePickUpAndDropOffRequest,
  );

  Future<List<DetailRelatedPartiesResponse>> getDetailRelatedParties(String id);

  Future<DetailRelatedPartiesResponse> postDetailRelatedParties(
    DetailRelatedPartiesRequest detailRelatedPartiesRequest,
  );

  Future<List<DetailRelatedPartiesBusCompanyResponse>>
      getDetailRelatedPartiesBusCompany(String id);

  Future<DetailRelatedPartiesBusCompanyResponse>
      postDetailRelatedPartiesBusCompany(
    DetailRelatedPartiesBusCompanyRequest detailRelatedPartiesBusCompanyRequest,
  );

  Future<List<DetailRelatedPartiesDriverResponse>>
      getDetailRelatedPartiesDriver(String id);

  Future<DetailRelatedPartiesDriverResponse> postDetailRelatedPartiesDriver(
    DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest,
  );

  Future<DetailRelatedPartiesDriverResponse> putRelatedPartiesDriver(String id,DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest);

  Future<List<DetailRelatedPartiesEmergencyContactResponse>>
      getDetailRelatedPartiesEmergencyContact(String id);

  Future<DetailRelatedPartiesEmergencyContactResponse>
      postDetailRelatedPartiesEmergencyContact(
    DetailRelatedPartiesEmergencyContactRequest
        detailRelatedPartiesEmergencyContactRequest,
  );

  Future<DetailRelatedPartiesEmergencyContactResponse> putRelatedPartiesEmergency(String id,DetailRelatedPartiesEmergencyContactRequest detailRelatedPartiesEmergencyContactRequest);

  Future<DetailItineraryResponse> getDetailItinerary({String? id});

  Future<List<DetailItineraryResponse>> getPatientChart({
    String? tourName,
    String? classification,
    DateTime? dateFrom,
    DateTime? dateTo,
  });

  Future<DetailItineraryResponse> postDetailItinerary(
    DetailIneraryRequest detailIneraryRequest,
  );

  Future<DetailItineraryResponse> putDetailItinerary(
    DetailIneraryRequest request,
    element,
  );

  Future<DetailRelatedPartiesResponse> putDetailRelatedParties(
      DetailRelatedPartiesRequest request, element);

  Future<DetailDropInFacilityResponse> putDetailFacilityDropIn(
      id, DetailDropInFacilityRequest detailDropInFacilityRequest);

  Future<DetailFacilityHotelResponse> putDetailFacilityHospital(id, DetailFacilityHotelRequest request);
}

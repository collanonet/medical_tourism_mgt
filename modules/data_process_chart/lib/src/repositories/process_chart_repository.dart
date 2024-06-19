
import 'package:core_network/entities.dart';

abstract class ProcessChartRepository {
    Future<PatientFilterResponse> getFilterPatientChart();

    Future<PatientFilterResponse> postFilterpatientChart(
      PatientFilterRequst patientFilterRequst,
    );

    Future<ItineraryTitleResponse> getItineraryTitle();

    Future<ItineraryTitleResponse> postItineraryTitle(
      ItineraryTitleRequest itineraryTitleRequest,
    );

    Future<ItineraryExplanationResponse> getInfoMedicalExamination();

    Future<ItineraryExplanationResponse> postItineraryExplanation(
      ItineraryExplanationRequest itineraryExplanationRequest,
    );

    Future<ItineraryInterpreterOrGuideInputResponse> getItineraryInterpretorOrGuideInput();

    Future<ItineraryInterpreterOrGuideInputResponse> postItineraryInterpretorOrGuideInput(
      ItineraryInterpreterOrGuideInputRequest itineraryInterpreterOrGuideInputRequest,
    );

    Future<ItineraryTransferInputResponse> getItineraryTransferInput();

    Future<ItineraryTransferInputResponse> postItineraryTransferInput(
      ItineraryTransferInputRequest itineraryTransferInputRequest,
    );

    Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital();

    Future<DetailFacilityHotelResponse> postDetailFacilityHospital(
      DetailFacilityHotelRequest detailFacilityHotelRequest,
    );

    Future<DetailDropInFacilityResponse> getDetailFacilityDropIn();

    Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(
      DetailDropInFacilityRequest detailDropInFacilityRequest,
    );

    Future<DetainHotelRegistationResponse> getDetainlHotelRegistation();

    Future<DetainHotelRegistationResponse> postDetailHotelRegistation(
      DetainHotelRegistationRequest detainHotelRegistationRequest,
    );

    Future<DetailHotelSearchResponse> getDetailHotelSearch();

    Future<DetailHotelSearchResponse> postDetialHotelSearch(
      DetailHotelSearchRequest detailHotelSearchRequest,
    );
}

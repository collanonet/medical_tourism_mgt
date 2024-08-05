import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProcessChartRemoteProvider {
  ProcessChartRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;


  Future<PatientFilterResponse> getFilterPatientChart() async{
   return await apiService.getFilterPatientChart();
  }

  Future<PatientFilterResponse> postFilterpatientChart(PatientFilterRequst patientFilterRequst) async{
    return apiService.postFilterpatientChart(patientFilterRequst);
  }

  Future<ItineraryTitleResponse> getItineraryTitle() async{
    return apiService.getItineraryTitle();
  }

  Future<ItineraryTitleResponse> postItineraryTitle(ItineraryTitleRequest itineraryTitleRequest) async{
    return apiService.postItineraryTitle(itineraryTitleRequest);
  }

  Future<ItineraryExplanationResponse> getInfoMedicalExamination() async{
    return await apiService.getItineraryExplanation();
  }

  Future<ItineraryExplanationResponse> postItineraryExplanation(ItineraryExplanationRequest itineraryExplanationRequest) async{
    return await apiService.postItineraryExplanation(itineraryExplanationRequest);
  }

  Future<ItineraryInterpreterOrGuideInputResponse> getItineraryInterpretorOrGuideInput() async{
    return await apiService.getItineraryInterpretorOrGuideInput();
  }

  Future<ItineraryInterpreterOrGuideInputResponse> postItineraryInterpretorOrGuideInput(ItineraryInterpreterOrGuideInputRequest itineraryInterpreterOrGuideInputRequest) async{
    return await apiService.postItineraryInterpretorOrGuideInput(itineraryInterpreterOrGuideInputRequest);
  }

  Future<ItineraryTransferInputResponse> getItineraryTransferInput() async{
    return await apiService.getItineraryTransferInput();
  } 

  Future<ItineraryTransferInputResponse> postItineraryTransferInput(ItineraryTransferInputRequest itineraryTransferInputRequest) async{
    return await apiService.postItineraryTransferInput(itineraryTransferInputRequest);
  }

  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital() async{
    return await apiService.getDetialFacilityHospital();
  }

  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(DetailFacilityHotelRequest detailFacilityHotelRequest) async{
    return await apiService.postDetailFacilityHospital(detailFacilityHotelRequest);
  }

  Future<DetailDropInFacilityResponse> getDetailFacilityDropIn() async{
    return await apiService.getDetailFacilityDropIn();
  }

  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(DetailDropInFacilityRequest detailDropInFacilityRequest) async{
    return await apiService.postDetailFacilityDropIn(detailDropInFacilityRequest);
  }

  Future<DetainHotelRegistationResponse> getDetainlHotelRegistation() async{
    return await apiService.getDetainlHotelRegistation();
  }

  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(DetainHotelRegistationRequest detainHotelRegistationRequest) async{
    return await apiService.postDetailHotelRegistation(detainHotelRegistationRequest);
  }

  Future<DetailHotelSearchResponse> getDetailHotelSearch() async{
    return await apiService.getDetailHotelSearch();
  }

  Future<DetailHotelSearchResponse> postDetialHotelSearch(DetailHotelSearchRequest detailHotelSearchRequest) async{
    return await apiService.postDetialHotelSearch(detailHotelSearchRequest);
  }

  Future<DetailRelatedPartiesResponse> getRelatedPartiesGuideOrInterpreter() async{
    return await apiService.getRelatedPartiesGuideOrInterpreter();
  }

  Future<DetailRelatedPartiesResponse> postRelatedPartiesGuideOrInterpreter(DetailRelatedPartiesRequest detailRelatedPartiesRequest) async{
    return await apiService.postRelatedPartiesGuideOrInterpreter(detailRelatedPartiesRequest);
  }

  Future<DetailRelatedPartiesBusCompanyResponse> getRelatedPartiesBusCompany() async{
    return await apiService.getRelatedPartiesBusCompany();
  }

  Future<DetailRelatedPartiesBusCompanyResponse> postRelatedPartiesBusCompany(DetailRelatedPartiesBusCompanyRequest detailRelatedPartiesBusCompanyRequest) async{
    return await apiService.postRelatedPartiesBusCompany(detailRelatedPartiesBusCompanyRequest);
  }

  Future<DetailRelatedPartiesDriverResponse> getRelatedPartiesDriver() async{
    return await apiService.getRelatedPartiesDriver();
  }

  Future<DetailRelatedPartiesDriverResponse> postRelatedPartiesDriver(DetailRelatedPartiesDriverRequest detailRelatedPartiesDriverRequest) async{
    return await apiService.postRelatedPartiesDriver(detailRelatedPartiesDriverRequest);
  }

  Future<DetailRelatedPartiesEmergencyContactResponse> getRelatedPartiesEmergencyContact() async{
    return await apiService.getRelatedPartiesEmergencyContact();
  }

  Future<DetailRelatedPartiesEmergencyContactResponse> postRelatedPartiesEmergencyContact(DetailRelatedPartiesEmergencyContactRequest detailRelatedPartiesEmergencyContactRequest) async{
    return await apiService.postRelatedPartiesEmergencyContact(detailRelatedPartiesEmergencyContactRequest);
  }

  Future<DetailItinerarySimpleTitle> getDetailItinerarySimpleTitle() async{
    return await apiService.getDetailItinerarySimpleTitle();
  }

  Future<DetailItinerarySimpleTitle> postDetailItinerarySimpleTitle(DetailItinerarySimpleTitleRequest detailItinerarySimpleTitleRequest) async{
    return await apiService.postDetailItinerarySimpleTitle(detailItinerarySimpleTitleRequest);
  }

  Future<DetailItinerarySimplePriorExplanationResponse> getDetailItinerarySimplePriorExplanation() async{
    return await apiService.getDetailItinerarySimpleExplanation();
  }

  Future<DetailItinerarySimplePriorExplanationResponse> postDetailItinerarySimpleExplanation(DetailItinerarySimplePriorExplanationRequest detailItinerarySimplePriorExplanationRequest) async{
    return await apiService.postDetailItinerarySimpleExplanation(detailItinerarySimplePriorExplanationRequest);
  }

  Future<DetailItinerarySimpleInterpreterOrGuideResponse> getDetailItinerarySimpleInterpretorOrGuide() async{
      return await apiService.getDetailItinerarySimpleInterpreter();
  }

  Future<DetailItinerarySimpleInterpreterOrGuideResponse> postDetailItinerarySimpleInterpretorOrGuide(DetailItinerarySimpleInterpreterOrGuideRequest detailItinerarySimpleInterpreterOrGuideRequest) async{
    return await apiService.postDetailItinerarySimpleInterpreter(detailItinerarySimpleInterpreterOrGuideRequest);
  }

  Future<DetailItinerarySimplePickUpAndDropOffResponse> getDetailItinerarySimplePickUpAndDropOff() async{
    return await apiService.getDetailItinerarySimplePickUp();
  }

  Future<DetailItinerarySimplePickUpAndDropOffResponse> postDetailItinerarySimplePickUp(DetailItinerarySimplePickUpAndDropOffRequest detailItinerarySimplePickUpAnd) async{
    return await apiService.postDetailItinerarySimplePickUp(detailItinerarySimplePickUpAnd);
  }

  Future<DetailItineraryResponse> getDetailitinerary() async{
    return await apiService.getDetailitinerary();
  }

  Future<DetailItineraryResponse> postDetailitinerary(DetailIneraryRequest detailIneraryRequest) async{
    return await apiService.postDetailItinerary(detailIneraryRequest);
  }

}

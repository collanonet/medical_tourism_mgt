
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

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
  Future<PatientFilterResponse> getFilterPatientChart() {
    return remote.getFilterPatientChart();
  }

  @override
  Future<PatientFilterResponse> postFilterpatientChart(PatientFilterRequst patientFilterRequst) {
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
  Future<ItineraryExplanationResponse> postItineraryExplanation(ItineraryExplanationRequest itineraryExplanationRequest) {
    return remote.postItineraryExplanation(itineraryExplanationRequest);
  }

  @override
  Future<ItineraryTitleResponse> postItineraryTitle(ItineraryTitleRequest itineraryTitleRequest) {
    return remote.postItineraryTitle(itineraryTitleRequest);
  }
  
  @override
  Future<ItineraryInterpreterOrGuideInputResponse> getItineraryInterpretorOrGuideInput() {
    return remote.getItineraryInterpretorOrGuideInput();
  }
  
  @override
  Future<ItineraryTransferInputResponse> getItineraryTransferInput() {
    return remote.getItineraryTransferInput();
  }
  
  @override
  Future<ItineraryInterpreterOrGuideInputResponse> postItineraryInterpretorOrGuideInput(ItineraryInterpreterOrGuideInputRequest itineraryInterpreterOrGuideInputRequest) {
    return remote.postItineraryInterpretorOrGuideInput(itineraryInterpreterOrGuideInputRequest);
  }
  
  @override
  Future<ItineraryTransferInputResponse> postItineraryTransferInput(ItineraryTransferInputRequest itineraryTransferInputRequest) {
   return remote.postItineraryTransferInput(itineraryTransferInputRequest);
  }
  
  @override
  Future<DetailDropInFacilityResponse> getDetailFacilityDropIn() {
    return remote.getDetailFacilityDropIn();
  }
  
  @override
  Future<List<DetailFacilityHotelResponse>> getDetialFacilityHospital() {
   return remote.getDetialFacilityHospital();
  }
  
  @override
  Future<DetailDropInFacilityResponse> postDetailFacilityDropIn(DetailDropInFacilityRequest detailDropInFacilityRequest) {
   return remote.postDetailFacilityDropIn(detailDropInFacilityRequest);
  }
  
  @override
  Future<DetailFacilityHotelResponse> postDetailFacilityHospital(DetailFacilityHotelRequest detailFacilityHotelRequest) {
   return remote.postDetailFacilityHospital(detailFacilityHotelRequest);
  }
  
  @override
  Future<DetainHotelRegistationResponse> getDetainlHotelRegistation() {
   return remote.getDetainlHotelRegistation();
  }
  
  @override
  Future<DetainHotelRegistationResponse> postDetailHotelRegistation(DetainHotelRegistationRequest detainHotelRegistationRequest) {
    return remote.postDetailHotelRegistation(detainHotelRegistationRequest);
  }
  
  @override
  Future<DetailHotelSearchResponse> getDetailHotelSearch() {
    return remote.getDetailHotelSearch();
  }
  
  @override
  Future<DetailHotelSearchResponse> postDetialHotelSearch(DetailHotelSearchRequest detailHotelSearchRequest) {
    return remote.postDetialHotelSearch(detailHotelSearchRequest);
  }

}

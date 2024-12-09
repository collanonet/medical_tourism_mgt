// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReportRemoteProvider {
  ReportRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<FileResponse> uploadFileBase64(
    String file,
    String filename,
  ) async =>
      await apiService.uploadFileBase64(file, filename);

  Future<List<TypeResponse>> getTypes() async {
    return apiService.getTypes();
  }

  Future<TypeResponse> postType(TypeRequest typeRequest) async {
    return apiService.postType(typeRequest);
  }

  Future<TypeResponse> putType(String id, TypeRequest typeRequest) async {
    return apiService.putType(id, typeRequest);
  }

  Future<List<ContractTemplateBasicInformationResponse>> getReportContrant({String? documentName,String? first,String? second,String? methodOfConclusion}) async {
    return apiService.getReportContract(
      documentName: documentName,
      first: first,
      second: second,
      methodOfConclusion: methodOfConclusion,
    );
  }

  // Future<ReportContractResponse> postReportContract(ReportContractRequest reportContractRequest) async {
  //   return apiService.postReportContract(reportContractRequest);
  // }

  // Future<ContractFilterResponse> getReportFilter() async{
  //   return apiService.getReportFilter(
    
  //   );
  // }
  
  // Future<ContractFilterResponse> postReportFilter(ContractFilterRequest contractFilterRequest) async {
  //   return apiService.postReportFilter(contractFilterRequest);
  // }

  Future<ContractReportDetailResponse> getContractReportDetail() async{
    return apiService.getContractReportDetail();
  }

  Future<ContractReportDetailResponse> postContractReportDetail(ContractReportDetailRequest contractReportDetailRequest) async{
    return apiService.postContractReportDetail(contractReportDetailRequest);
  }

  Future<List<ContractTemplateBasicInformationResponse>> getContractTemplateBasicInformation() async{
    return apiService.getContractTemplateBasicInformation();
  }

  Future<ContractTemplateBasicInformationResponse> postContractTemplateBasicInformation(ContractTemplateBasicInformationRequest contractTemplateBasicInformationRequest) async{
    return apiService.postContractTemplateBasicInformation(contractTemplateBasicInformationRequest);
  }

  Future<List<EstimatemasterReportResponse>> getEstimatemasterReport() async{
    return apiService.getEstimateMasterReport();
  }

  Future<EstimatemasterReportResponse> postEstimatemasterReport(EstimatemasterReportRequest estimatemasterReportRequest) async{
    return apiService.postEstimateMasterReport(estimatemasterReportRequest);
  }

  Future<EstimatemasterReportResponse> putEstimatemasterReport(String id, EstimatemasterReportRequest estimatemasterReportRequest) async{
    return apiService.putEstimateMasterReport(id, estimatemasterReportRequest);
  }

  Future<List<ProspectiveRankResponse>> getProspectiveRank() async{
    return apiService.getProspectiveRank();
  }

  Future<ProspectiveRankResponse> postProspectiveRank(ProspectiveRankRequest prospectiveRankRequest) async{
    return apiService.postProspectiveRank(prospectiveRankRequest);
  }

  Future<ProspectiveRankResponse> putProspectiveRank(String id, ProspectiveRankRequest prospectiveRankRequest) async{
    return apiService.putProspectiveRank(id, prospectiveRankRequest);
  }
}

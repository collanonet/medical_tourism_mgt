// Package imports:
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/report_remote_provider.dart';
import 'report_repository.dart';

@Injectable(as: ReportRepository)
class ReportRepositoryIml extends ReportRepository {
  ReportRepositoryIml({
    required this.remote,
  });

  final ReportRemoteProvider remote;

    @override
  Future<FileResponse> uploadFileBase64(
    String file,
    String filename,
  ) async =>
      await remote.uploadFileBase64(file, filename);
      
  @override
  Future<List<TypeResponse>> getTypes() {
    return remote.getTypes();
  }

  @override
  Future<TypeResponse> postType(TypeRequest typeRequest) {
    return remote.postType(typeRequest);
  }

  @override
  Future<TypeResponse> putType(String id, TypeRequest typeRequest) {
    return remote.putType(id, typeRequest);
  }

    @override
  Future<List<ContractTemplateBasicInformationResponse>> getReportContract({String? documentName, String? first, String? second, String? methodOfConclusion}) {
    return remote.apiService.getReportContract(
      documentName: documentName,
      first: first,
      second: second,
      methodOfConclusion: methodOfConclusion,
    );
  }

  // @override
  // Future<ReportContractResponse> postReportContract(ReportContractRequest reportContractRequest) {
  //   return remote.postReportContract(reportContractRequest);
  // }

  // @override
  // Future<ContractFilterResponse> getContractFilter() {
  //  return remote.getReportFilter();
  // }

  // @override
  // Future<ContractFilterResponse> postContractFilter(ContractFilterRequest contractFilterRequest) {
  //   return remote.postReportFilter(contractFilterRequest);
  // }

  @override
  Future<ContractReportDetailResponse> getContractReportDetail() {
    return remote.getContractReportDetail();
  }

  @override
  Future<ContractReportDetailResponse> postContractReportDetail(ContractReportDetailRequest contractReportDetailRequest) {
   return remote.postContractReportDetail(contractReportDetailRequest);
  }

  @override
  Future<List<ContractTemplateBasicInformationResponse>> getContractTemplateBasicInformation() {
    return remote.getContractTemplateBasicInformation();
  }

  @override
  Future<ContractTemplateBasicInformationResponse> postContractTemplateBasicInformation(ContractTemplateBasicInformationRequest contractTemplateBasicInformationRequest) {
    return remote.postContractTemplateBasicInformation(contractTemplateBasicInformationRequest);
  }

  @override
  Future<List<EstimatemasterReportResponse>> getEstimatemasterReport() {
    return remote.getEstimatemasterReport();
  }

  @override
  Future<EstimatemasterReportResponse> postEstimatemasterReport(EstimatemasterReportRequest estimatemasterReportRequest) {
    return remote.postEstimatemasterReport(estimatemasterReportRequest);
  }



  @override
  Future<List<ProspectiveRankResponse>> getProspectiveRank() {
    return remote.getProspectiveRank();
  }

  @override
  Future<ProspectiveRankResponse> postProspectiveRank(ProspectiveRankRequest prospectiveRankRequest) {
    return remote.postProspectiveRank(prospectiveRankRequest);
  }

  @override
  Future<EstimatemasterReportResponse> putEstimatemasterReport(String id, EstimatemasterReportRequest estimatemasterReportRequest) {
    return remote.putEstimatemasterReport(id, estimatemasterReportRequest);
  }

  @override
  Future<ProspectiveRankResponse> putProspectiveRank(String id, ProspectiveRankRequest prospectiveRankRequest) {
    return remote.putProspectiveRank(id, prospectiveRankRequest);
  }
  

}

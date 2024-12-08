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
  Future<List<ReportContractResponse>> getReportContract() {
    return remote.getReportContrant();
  }

  @override
  Future<ReportContractResponse> postReportContract(ReportContractRequest reportContractRequest) {
    return remote.postReportContract(reportContractRequest);
  }

  @override
  Future<ContractFilterResponse> getContractFilter() {
   return remote.getReportFilter();
  }

  @override
  Future<ContractFilterResponse> postContractFilter(ContractFilterRequest contractFilterRequest) {
    return remote.postReportFilter(contractFilterRequest);
  }

  @override
  Future<ContractReportDetailResponse> getContractReportDetail() {
    return remote.getContractReportDetail();
  }

  @override
  Future<ContractReportDetailResponse> postContractReportDetail(ContractReportDetailRequest contractReportDetailRequest) {
   return remote.postContractReportDetail(contractReportDetailRequest);
  }

  @override
  Future<ContractTemplateBasicInformationResponse> getContractTemplateBasicInformation() {
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
}

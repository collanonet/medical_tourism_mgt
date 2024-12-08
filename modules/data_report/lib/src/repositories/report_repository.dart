// Package imports:
import 'package:core_network/entities.dart';

abstract class ReportRepository {
  Future<List<TypeResponse>> getTypes();

  Future<TypeResponse> postType(TypeRequest typeRequest);

  Future<TypeResponse> putType(String id, TypeRequest typeRequest);

  Future<List<ReportContractResponse>> getReportContract();

  Future<ReportContractResponse> postReportContract(
    ReportContractRequest reportContractRequest,
  );

  Future<ContractFilterResponse> getContractFilter();

  Future<ContractFilterResponse> postContractFilter(ContractFilterRequest contractFilterRequest,);

  Future<ContractReportDetailResponse>  getContractReportDetail();

  Future<ContractReportDetailResponse> postContractReportDetail(
    ContractReportDetailRequest contractReportDetailRequest,
  );

  Future<ContractTemplateBasicInformationResponse> getContractTemplateBasicInformation();

  Future<ContractTemplateBasicInformationResponse> postContractTemplateBasicInformation(
    ContractTemplateBasicInformationRequest contractTemplateBasicInformationRequest,
  );

  Future<List<EstimatemasterReportResponse>> getEstimatemasterReport();

  Future<EstimatemasterReportResponse> postEstimatemasterReport(
    EstimatemasterReportRequest estimatemasterReportRequest,
  );

  Future<EstimatemasterReportResponse> putEstimatemasterReport(
    String id,
    EstimatemasterReportRequest estimatemasterReportRequest,
  );

  Future<List<ProspectiveRankResponse>> getProspectiveRank();

  Future<ProspectiveRankResponse> postProspectiveRank(
    ProspectiveRankRequest prospectiveRankRequest,
  );
}

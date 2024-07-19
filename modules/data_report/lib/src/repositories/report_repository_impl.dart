import 'package:core_network/src/entities/contract_report_detail_response.dart';
import 'package:core_network/src/entities/contract_template_detail_basic_info_response.dart';
import 'package:core_network/src/entities/estimate_master_report_response.dart';
import 'package:core_network/src/entities/report_contract_filter_response.dart';
import 'package:core_network/src/entities/report_contract_response.dart';
import 'package:core_network/src/entities/request/contract_report_detail_request.dart';
import 'package:core_network/src/entities/request/contract_request.dart';
import 'package:core_network/src/entities/request/contract_template_detail_basic_info_request.dart';
import 'package:core_network/src/entities/request/estimate_master_report_request.dart';
import 'package:core_network/src/entities/request/report_contract_filter_request.dart';
import 'package:core_network/src/entities/type_request.dart';
import 'package:core_network/src/entities/type_response.dart';
import 'package:injectable/injectable.dart';

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
}

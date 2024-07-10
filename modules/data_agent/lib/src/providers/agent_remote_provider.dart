
import 'package:core_network/core_network.dart';
import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentRemoteProvider {
  AgentRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<List<AgentResponse>> getAgents({
    String? companyName,
    String? nameKana,
    String? postalCode,
    String? address,
    String? area,
    String? phoneNumber,
    DateTime? transactionStartDate,
    String? howToMainPayment,
    int? pastCasesNumber,
  }) async {
    return await apiService.getAgents(
      companyName: companyName,
      nameKana: nameKana,
      postalCode: postalCode,
      address: address,
      area: area,
      phoneNumber: phoneNumber,
      transactionStartDate: transactionStartDate,
      howToMainPayment: howToMainPayment,
      pastCasesNumber: pastCasesNumber,
    );
  }

  Future<AgentResponse> getAgent(String id) async {
    return await apiService.getAgent(id);
  }

  Future<AgentResponse> postAgent(AgentRequest agent) async {
    return await apiService.postAgent(agent);
  }

  Future<AgentResponse> putAgent(String id, AgentRequest agent) async {
    return await apiService.putAgent(id, agent);
  }

  Future<void> deleteAgent(String id) async {
    return await apiService.deleteAgent(id);
  }

  Future<List<AgentManagerResponse>> getAgentManagers(
      {String? agentRecord}) async {
    return await apiService.getAgentManagers(agentRecord: agentRecord);
  }

  Future<AgentManagerResponse> getAgentManager(String id) async {
    return await apiService.getAgentManager(id);
  }

  Future<AgentManagerResponse> postAgentManager(
      AgentManagerRequest agentManager) async {
    return await apiService.postAgentManager(agentManager);
  }

  Future<AgentManagerResponse> putAgentManager(
      String id, AgentManagerRequest agentManager) async {
    return await apiService.putAgentManager(id, agentManager);
  }

  Future<void> deleteAgentManager(String id) async {
    return await apiService.deleteAgentManager(id);
  }

  Future<ContrantAgentResponse> getContrantAgent() async{
    return await apiService.getContractAgent();
  }

  Future<ContrantAgentResponse> postContrantAgent(ContrantAgentRequest contrantAgent) async{
    return await apiService.postContractAgent(contrantAgent);
  }

  Future<EstimateInvoiceResponse> getEstimateInvoice() async{
    return await apiService.getEstimateInvoice();
  }

  Future<EstimateInvoiceResponse> postEstimateInvoice(EstimateInvoiceRequest estimateInvoice) async{
    return await apiService.postEstimateInvoice(estimateInvoice);
  }

   Future<FileResponse> uploadFileBase64(
    String file,
    String filename) {
      return apiService.uploadFileBase64(file, filename);
    }
}

// Package imports:
import 'package:core_network/entities.dart';

abstract class AgentRepository {
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
  });

  Future<AgentResponse> getAgent(String id);

  Future<AgentResponse> postAgent(AgentRequest agent);

  Future<AgentResponse> putAgent(String id, AgentRequest agent);

  Future<void> deleteAgent(String id);

  Future<List<AgentManagerResponse>> getAgentManagers({String? agentRecord});

  Future<AgentManagerResponse> getAgentManager(String id);

  Future<AgentManagerResponse> postAgentManager(
      AgentManagerRequest agentManager);

  Future<AgentManagerResponse> putAgentManager(
      String id, AgentManagerRequest agentManager);

  Future<void> deleteAgentManager(String id);

  Future<List<ContrantAgentResponse>> getContrantAgent({required String id});

  Future<ContrantAgentResponse> postContrantAgent(
    ContrantAgentRequest contrantAgent,
  );

  Future<List<EstimateInvoiceResponse>> getEstimateInvoice(
      {required String id});

  Future<EstimateInvoiceResponse> postEstimateInvoice(
    EstimateInvoiceRequest estimateInvoice,
  );

  Future<FileResponse> uploadFileBase64(
    String file,
    String filename,
  );

  Future<void> deleteContractAgent(String id);

  Future<void> deleteEstimateInvoice(String id);
}

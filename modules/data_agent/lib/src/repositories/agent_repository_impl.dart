import 'dart:io';

import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../providers/agent_local_provider.dart';
import '../providers/agent_remote_provider.dart';
import 'agent_repository.dart';

@Injectable(as: AgentRepository)
class AgentRepositoryIml extends AgentRepository {
  AgentRepositoryIml({
    required this.remote,
    required this.local,
  });

  final AgentRemoteProvider remote;
  final AgentLocalProvider local;

  @override
  Future<void> deleteAgent(String id) {
    return remote.deleteAgent(id);
  }

  @override
  Future<void> deleteAgentManager(String id) {
    return remote.deleteAgentManager(id);
  }

  @override
  Future<AgentResponse> getAgent(String id) {
    return remote.getAgent(id);
  }

  @override
  Future<AgentManagerResponse> getAgentManager(String id) {
    return remote.getAgentManager(id);
  }

  @override
  Future<List<AgentManagerResponse>> getAgentManagers({String? agentRecord}) {
    return remote.getAgentManagers(agentRecord: agentRecord);
  }

  @override
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
  }) {
    return remote.getAgents(
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

  @override
  Future<AgentResponse> postAgent(AgentRequest agent) {
    return remote.postAgent(agent);
  }

  @override
  Future<AgentManagerResponse> postAgentManager(
      AgentManagerRequest agentManager) {
    return remote.postAgentManager(agentManager);
  }

  @override
  Future<AgentResponse> putAgent(String id, AgentRequest agent) {
    return remote.putAgent(id, agent);
  }

  @override
  Future<AgentManagerResponse> putAgentManager(
      String id, AgentManagerRequest agentManager) {
    return remote.putAgentManager(id, agentManager);
  }
}

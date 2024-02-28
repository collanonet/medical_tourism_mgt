import 'dart:io';

import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentRemoteProvider {
  AgentRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<List<AgentResponse>> getAgents() async {
    return await apiService.getAgents();
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

  Future<List<AgentManagerResponse>> getAgentManagers() async {
    return await apiService.getAgentManagers();
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
}

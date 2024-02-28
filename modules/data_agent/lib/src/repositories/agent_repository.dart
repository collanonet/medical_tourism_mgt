import 'dart:io';

import 'package:core_network/core_network.dart';

abstract class AgentRepository {

  Future<List<AgentResponse>> getAgents();

  Future<AgentResponse> getAgent(String id);

  Future<AgentResponse> postAgent(AgentRequest agent);

  Future<AgentResponse> putAgent(String id, AgentRequest agent);

  Future<void> deleteAgent(String id);

  Future<List<AgentManagerResponse>> getAgentManagers();

  Future<AgentManagerResponse> getAgentManager(String id);

  Future<AgentManagerResponse> postAgentManager(AgentManagerRequest agentManager);

  Future<AgentManagerResponse> putAgentManager(String id, AgentManagerRequest agentManager);

  Future<void> deleteAgentManager(String id);
}

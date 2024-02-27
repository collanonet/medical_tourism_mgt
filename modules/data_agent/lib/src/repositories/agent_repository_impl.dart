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

}

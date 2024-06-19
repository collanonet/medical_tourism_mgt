import 'package:data_agent/data_agent.dart';
import 'package:injectable/injectable.dart';

@injectable
class ContractModel {
  ContractModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

}
import 'package:data_agent/data_agent.dart';
import 'package:injectable/injectable.dart';

@injectable
class AgentBasicInformationModel {
  AgentBasicInformationModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;
}
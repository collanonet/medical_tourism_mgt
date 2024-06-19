import 'package:data_agent/data_agent.dart';
import 'package:injectable/injectable.dart';

@injectable
class EstimateInvoiceModel {
  EstimateInvoiceModel({
    required this.authRepository,
  });

  final AgentRepository authRepository;

}
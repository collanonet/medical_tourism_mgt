import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class PatientRemoteProvider {
  PatientRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  }) async =>
      await apiService.prePatients(
        page: page,
        limit: limit,
        agents: agents,
        patient: patient,
      );
}

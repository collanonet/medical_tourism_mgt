import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../providers/patient_local_provider.dart';
import '../providers/patient_remote_provider.dart';
import 'patient_repository.dart';

@Injectable(as: PatientRepository)
class PatientRepositoryIml extends PatientRepository {
  PatientRepositoryIml({
    required this.remote,
    required this.local,
  });

  final PatientRemoteProvider remote;
  final PatientLocalProvider local;

  @override
  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  }) {
    return remote.prePatients(
      page: page,
      limit: limit,
      agents: agents,
      patient: patient,
    );
  }
}

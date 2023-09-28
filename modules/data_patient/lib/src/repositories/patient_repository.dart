import 'package:core_network/core_network.dart';

abstract class PatientRepository {
  Future<Paginated<PrePatient>> prePatients({
    int? page,
    int? limit,
    String? agents,
    String? patient,
  });
}

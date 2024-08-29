// Package imports:
import 'package:injectable/injectable.dart';

// Project imports:
import '../providers/medical_visa_local_provider.dart';
import '../providers/medical_visa_remote_provider.dart';
import 'medical_visa_repository.dart';

@Injectable(as: MedicalVisaRepository)
class MedicalVisaRepositoryIml extends MedicalVisaRepository {
  MedicalVisaRepositoryIml({
    required this.remote,
    required this.local,
  });

  final MedicalVisaRemoteProvider remote;
  final MedicalVisaLocalProvider local;

}

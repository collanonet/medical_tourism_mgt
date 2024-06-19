import 'package:injectable/injectable.dart';

import '../providers/hospital_local_provider.dart';
import '../providers/hospital_remote_provider.dart';
import 'hospital_repository.dart';

@Injectable(as: HospitalRepository)
class HospitalRepositoryIml extends HospitalRepository {
  HospitalRepositoryIml({
    required this.remote,
    required this.local,
  });

  final HospitalRemoteProvider remote;
  final HospitalLocalProvider local;

}

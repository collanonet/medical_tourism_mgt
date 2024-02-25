import 'package:core_network/src/entities/type_request.dart';
import 'package:core_network/src/entities/type_response.dart';
import 'package:injectable/injectable.dart';

import '../providers/report_remote_provider.dart';
import 'report_repository.dart';

@Injectable(as: ReportRepository)
class ReportRepositoryIml extends ReportRepository {
  ReportRepositoryIml({
    required this.remote,
  });

  final ReportRemoteProvider remote;

  @override
  Future<List<TypeResponse>> getTypes() {
    return remote.getTypes();
  }

  @override
  Future<TypeResponse> postType(TypeRequest typeRequest) {
    return remote.postType(typeRequest);
  }

  @override
  Future<TypeResponse> putType(String id, TypeRequest typeRequest) {
    return remote.putType(id, typeRequest);
  }
}

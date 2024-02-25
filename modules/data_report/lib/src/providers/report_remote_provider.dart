import 'package:core_network/core_network.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReportRemoteProvider {
  ReportRemoteProvider({
    required this.apiService,
  });

  final ApiService apiService;

  Future<List<TypeResponse>> getTypes() async {
    return apiService.getTypes();
  }

  Future<TypeResponse> postType(TypeRequest typeRequest) async {
    return apiService.postType(typeRequest);
  }

  Future<TypeResponse> putType(String id, TypeRequest typeRequest) async {
    return apiService.putType(id, typeRequest);
  }
}

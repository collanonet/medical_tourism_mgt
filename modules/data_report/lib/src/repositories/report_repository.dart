import 'package:core_network/core_network.dart';

abstract class ReportRepository {
  Future<List<TypeResponse>> getTypes();

  Future<TypeResponse> postType(TypeRequest typeRequest);

  Future<TypeResponse> putType(String id, TypeRequest typeRequest);
}
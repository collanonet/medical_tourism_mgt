import 'package:json_annotation/json_annotation.dart';
part 'health_checkup_response.g.dart';

@JsonSerializable()
class HealthResponse {
  @JsonKey(name: '_id')
  final String id;
  String? uploadFile;
  String? fileName;
  DateTime? uploadDate;
  DateTime? createdAt;

  HealthResponse(
      {required this.id,
      this.uploadFile,
      this.fileName,
      this.uploadDate,
      this.createdAt});

  factory HealthResponse.fromJson(Map<String, dynamic> json) =>
      _$HealthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HealthResponseToJson(this);
}

// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'health_checkup_request.g.dart';
@JsonSerializable()
class HealthRequest{
  String? uploadFile;
  String? fileName;
  DateTime? uploadDate;
  String hospitalRecord;

  HealthRequest({
    this.uploadFile,
    this.fileName,
    this.uploadDate,
    required this.hospitalRecord,
  });

  factory HealthRequest.fromJson(Map<String, dynamic> json) => _$HealthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$HealthRequestToJson(this);
}

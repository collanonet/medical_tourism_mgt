// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_interpreter_request.g.dart';

@JsonSerializable()
class MedicalRecordInterpreterRequest {
  bool? requiredOrUnnnecessary;
  String? interpreter;
  String medicalRecord;

  MedicalRecordInterpreterRequest({
    this.requiredOrUnnnecessary,
    this.interpreter,
    required this.medicalRecord,
  });

  factory MedicalRecordInterpreterRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordInterpreterRequestFromJson(json);
  }

  Map<String, dynamic> toJson() =>
      _$MedicalRecordInterpreterRequestToJson(this);
}

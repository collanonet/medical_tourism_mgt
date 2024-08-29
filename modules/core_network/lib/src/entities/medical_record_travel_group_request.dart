// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'medical_record_travel_group_request.g.dart';

@JsonSerializable()
class MedicalRecordTravelGroupRequest {
  bool? toGroupLeader;
  List<String?>? travelGroup;
  String? medicalRecord;

  MedicalRecordTravelGroupRequest({
    this.toGroupLeader,
    this.travelGroup,
    this.medicalRecord,
  });

  factory MedicalRecordTravelGroupRequest.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordTravelGroupRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordTravelGroupRequestToJson(this);

}

import 'package:json_annotation/json_annotation.dart';

part 'medical_record_travel_group.g.dart';

@JsonSerializable()
class MedicalRecordTravelGroup {
  @JsonKey(name: '_id')
  String id;
  bool? toGroupLeader;
  List<String?>? travelGroup;
  String medicalRecord;
  String createdAt;
  String updatedAt;

  MedicalRecordTravelGroup({
    required this.id,
    this.toGroupLeader,
    this.travelGroup,
    required this.medicalRecord,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecordTravelGroup.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordTravelGroupFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordTravelGroupToJson(this);

}

import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  @JsonKey(name: '_id')
  final String id;
  String? hospitalName;
  String? type;
  String? area;
  String? r;
  bool? universityHospital;
  bool? nationalHospital;
  bool? privateHospital;
  bool? clinic;

  Hospital({
    required this.id,
    this.hospitalName,
    this.type,
    this.area,
    this.r,
    this.universityHospital,
    this.nationalHospital,
    this.privateHospital,
    this.clinic,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return _$HospitalFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}

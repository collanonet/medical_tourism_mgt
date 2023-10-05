import 'package:json_annotation/json_annotation.dart';

part 'patient_nationality.g.dart';

@JsonSerializable()
class PatientNationality {
  @JsonKey(name: '_id')
  final String id;
   String nationality;
   String nativeLanguage;
   String residentialArea;
   String currentAddress;
   String mobileNumber;
   String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientNationality({
    required this.id,
    required this.nationality,
    required this.nativeLanguage,
    required this.residentialArea,
    required this.currentAddress,
    required this.mobileNumber,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientNationality.fromJson(Map<String, dynamic> json) {
    return _$PatientNationalityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientNationalityToJson(this);
}
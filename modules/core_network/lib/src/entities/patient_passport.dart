// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'patient_passport.g.dart';

@JsonSerializable()
class PatientPassport {
  @JsonKey(name: '_id')
  final String id;
  String? passportNumber;
  DateTime? issueDate;
  DateTime? expirationDate;
  String visaType;
  String? visaCategory;
  bool? underConfirmation;
  String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  PatientPassport({
    required this.id,
    this.passportNumber,
    this.issueDate,
    this.expirationDate,
    required this.visaType,
    this.visaCategory,
    this.underConfirmation,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PatientPassport.fromJson(Map<String, dynamic> json) {
    return _$PatientPassportFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientPassportToJson(this);
}

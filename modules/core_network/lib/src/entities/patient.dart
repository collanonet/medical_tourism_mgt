import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'patient.g.dart';

@JsonSerializable()
class Patient {
  @JsonKey(name: '_id')
  final String id;
  DateTime? dateOfBirth;
  int? age;
  bool? gender;
  String? familyName;
  String? middleName;
  String? firstName;
  final DateTime createdAt;
  final DateTime updatedAt;

  Patient({
    required this.id,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.familyName,
    this.middleName,
    this.firstName,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return _$PatientFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PatientToJson(this);

}

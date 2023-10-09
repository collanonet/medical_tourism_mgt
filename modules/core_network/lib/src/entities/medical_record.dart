import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record.g.dart';

@JsonSerializable()
class MedicalRecord {
  @JsonKey(name: '_id')
  final String id;
  DateTime? dateOfBirth;
  int? age;
  String? gender;
  DateTime? arrivalDate;
  DateTime? examinationDate;
  DateTime? departureDate;
  String? caseNumber;
  DateTime? receptionDate;
  String? type;
  String? progress;
  DateTime? advancePaymentDate;
  String? paymentMethod;
  String? memo;
  String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecord({
    required this.id,
    this.dateOfBirth,
    this.age,
    this.gender,
    this.arrivalDate,
    this.examinationDate,
    this.departureDate,
    this.caseNumber,
    this.receptionDate,
    this.type,
    this.progress,
    this.advancePaymentDate,
    this.paymentMethod,
    this.memo,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordToJson(this);

  static FormGroup buildFormGroup({MedicalRecord? medicalRecord}) {
    return FormGroup({
      'id': FormControl<String>(value: medicalRecord?.id),
      'dateOfBirth': FormControl<String>(
          value: medicalRecord?.dateOfBirth.toString() ?? ''),
      'age': FormControl<String>(value: medicalRecord?.age.toString() ?? ''),
      'gender': FormControl<String>(value: medicalRecord?.gender),
      'arrivalDate': FormControl<String>(
          value: medicalRecord?.arrivalDate.toString() ?? ''),
      'examinationDate': FormControl<String>(
          value: medicalRecord?.examinationDate.toString() ?? ''),
      'departureDate': FormControl<String>(
          value: medicalRecord?.departureDate.toString() ?? ''),
      'caseNumber': FormControl<String>(value: medicalRecord?.caseNumber),
      'receptionDate': FormControl<String>(
          value: medicalRecord?.receptionDate.toString() ?? ''),
      'type': FormControl<String>(value: medicalRecord?.type),
      'progress': FormControl<String>(value: medicalRecord?.progress),
      'advancePaymentDate': FormControl<String>(
          value: medicalRecord?.advancePaymentDate.toString() ?? ''),
      'paymentMethod': FormControl<String>(value: medicalRecord?.paymentMethod),
      'memo': FormControl<String>(value: medicalRecord?.memo),
      'patient': FormControl<String>(value: medicalRecord?.patient),
    });
  }
}

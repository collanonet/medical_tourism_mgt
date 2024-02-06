import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'medical_record.g.dart';

@JsonSerializable()
class MedicalRecord {
  @JsonKey(name: '_id')
  final String id;
  DateTime? dateOfBirth;
  int? age;
  int? height;
  int? weight;
  bool? gender;
  DateTime? arrivalDate;
  DateTime? consultationDate;
  DateTime? returnDate;
  String? proposalNumber;
  DateTime? receptionDate;
  List<String>? type;
  String? progress;
  DateTime? advancePaymentDate;
  String? receivingMethod;

  String? memo;
  String patient;
  final DateTime createdAt;
  final DateTime updatedAt;

  MedicalRecord({
    required this.id,
    this.dateOfBirth,
    this.age,
    this.height,
    this.weight,
    this.gender,
    this.arrivalDate,
    this.consultationDate,
    this.returnDate,
    this.proposalNumber,
    this.receptionDate,
    this.type,
    this.progress,
    this.advancePaymentDate,
    this.receivingMethod,
    this.memo,
    required this.patient,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MedicalRecord.fromJson(Map<String, dynamic> json) {
    return _$MedicalRecordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MedicalRecordToJson(this);
}

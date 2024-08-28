// Package imports:
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_treament_responce.g.dart';

@CopyWith()
@JsonSerializable()
class TreamentResponce {
  @JsonKey(name: '_id')
  String id;
  bool? medicalInfo;
  bool? dicom;
  bool? bloodTests;
  String? datial;
  String? diagnosis;
  String? explanation;
  String? historyOfOnset;
  String? currentTreatment;
  List<String>? nameOfTheDrug;
  bool? healthStatus;
  String? datial1;
  String? datial2;
  bool? healthStatus1;
  String? healthStatus2;
  String? budget;
  bool? attendition;
  String? medicalName;
  String? reason;
  DateTime? desiredDate1;
  DateTime? desiredDate2;
  DateTime? desiredDate3;
  String? scheduled;

  TreamentResponce({
    required this.id,
    this.medicalInfo,
    this.dicom,
    this.bloodTests,
    this.datial,
    this.diagnosis,
    this.explanation,
    this.historyOfOnset,
    this.currentTreatment,
    this.nameOfTheDrug,
    this.healthStatus,
    this.datial1,
    this.datial2,
    this.healthStatus1,
    this.healthStatus2,
    this.budget,
    this.attendition,
    this.medicalName,
    this.reason,
    this.desiredDate1,
    this.desiredDate2,
    this.desiredDate3,
    this.scheduled,
  });
  factory TreamentResponce.fromJson(Map<String, dynamic> json) {
    return _$TreamentResponceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TreamentResponceToJson(this);
  }
}

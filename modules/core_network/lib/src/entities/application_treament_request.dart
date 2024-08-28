import 'package:json_annotation/json_annotation.dart';
part 'application_treament_request.g.dart';

@JsonSerializable()
class TreamentRequest {
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

  TreamentRequest({
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
  factory TreamentRequest.fromJson(Map<String, dynamic> json) {
    return _$TreamentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TreamentRequestToJson(this);
  }
}

// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'necessary_in_japan_visa_info.g.dart';
@JsonSerializable()
class VisaInfo {
  DateTime? passportDate;
  String? passportFileSelect;
  DateTime? letterOfGuaranteeDate;
  String? letterOfGuaranteeFileSelect;
  String? sendBy;
  bool? byEMS;
  bool? byFedex;
  bool? byOthers;

  VisaInfo({
    this.passportDate,
    this.passportFileSelect,
    this.letterOfGuaranteeDate,
    this.letterOfGuaranteeFileSelect,
    this.sendBy,
    this.byEMS,
    this.byFedex,
    this.byOthers,
  });
  factory VisaInfo.fromJson(Map<String, dynamic> json) => _$VisaInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VisaInfoToJson(this);
}

import 'package:json_annotation/json_annotation.dart';
part 'visa_info.g.dart';

@JsonSerializable()
class VisaInfo {
  DateTime? passportDate;
  String? passportFileSelect;
  DateTime? letterOfGuaranteeDate;
  String? letterOfGuaranteeFileSelect;
  String? sendBy;
  bool? byEMS;
  bool? byFedex;
  bool? byothers;

  VisaInfo({
    this.passportDate,
    this.letterOfGuaranteeDate,
    this.sendBy,
    this.byEMS,
    this.byFedex,
    this.byothers,
    this.passportFileSelect,
    this.letterOfGuaranteeFileSelect,
  });

  factory VisaInfo.fromJson(Map<String, dynamic> json) => _$VisaInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VisaInfoToJson(this);
}
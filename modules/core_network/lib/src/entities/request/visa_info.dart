import 'package:json_annotation/json_annotation.dart';
part 'visa_info.g.dart';

@JsonSerializable()
class VisaInfoRequest {
  DateTime? passportDate;
  String? passportFileSelect;
  DateTime? letterOfGuaranteeDate;
  String? letterOfGuaranteeFileSelect;
  String? sendBy;
  bool? byEMS;
  bool? byFedex;
  bool? byOthers;

  VisaInfoRequest({
    this.passportDate,
    this.letterOfGuaranteeDate,
    this.sendBy,
    this.byEMS,
    this.byFedex,
    this.byOthers,
    this.passportFileSelect,
    this.letterOfGuaranteeFileSelect,
  });

  factory VisaInfoRequest.fromJson(Map<String, dynamic> json) => _$VisaInfoRequestFromJson(json);
  Map<String, dynamic> toJson() => _$VisaInfoRequestToJson(this);
}
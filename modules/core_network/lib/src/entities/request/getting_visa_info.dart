import 'package:json_annotation/json_annotation.dart';
part 'getting_visa_info.g.dart';

@JsonSerializable()
class GettingVisaInfoRequest {
  DateTime? visaPage;
  String? visaPageFileName;
  DateTime? landingPermit;
  String? landingPermitFileName;

  GettingVisaInfoRequest({
    this.visaPage,
    this.landingPermit,
    this.landingPermitFileName,
    this.visaPageFileName,
  });

  factory GettingVisaInfoRequest.fromJson(Map<String, dynamic> json) {
    return _$GettingVisaInfoRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GettingVisaInfoRequestToJson(this);
  }
}

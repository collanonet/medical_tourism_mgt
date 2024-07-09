import 'package:json_annotation/json_annotation.dart';
part 'material_hospital_request.g.dart';

@JsonSerializable()
class MaterialHospitalRequest {

   String? memo;
  final String? file;
   String? brochureName;
   String? author;
   String? dateOfIssue;
   String? share;

 MaterialHospitalRequest({
    this.memo,
    this.file,
    this.brochureName,
    this.author,
    this.dateOfIssue,
    this.share,
 });

  factory MaterialHospitalRequest.fromJson(Map<String, dynamic> json) =>
      _$MaterialHospitalRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MaterialHospitalRequestToJson(this);
}

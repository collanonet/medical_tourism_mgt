
import 'package:json_annotation/json_annotation.dart';
part 'filter_process_chart_response.g.dart';
@JsonSerializable()
class PatientFilterResponse {
   @JsonKey(name: '_id')
  final String id;
  String? patientName;
  String? visa;
  String? report;
  String? subjectsWithdrawal;
  String? refinementDate;
  DateTime? periodFrom;
  DateTime? periodTo;

  PatientFilterResponse({
    required this.id,
     this.patientName,
     this.visa,
     this.report,
     this.subjectsWithdrawal,
     this.refinementDate,
    this.periodFrom,
    this.periodTo,
  });

  factory PatientFilterResponse.fromJson(Map<String,dynamic> json){
    return _$PatientFilterResponseFromJson(json);
  }


  Map<String,dynamic> toJson(){
    return _$PatientFilterResponseToJson(this);
  }
}
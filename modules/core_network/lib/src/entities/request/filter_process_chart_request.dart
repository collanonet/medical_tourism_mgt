
import 'package:json_annotation/json_annotation.dart';
part 'filter_process_chart_request.g.dart';

@JsonSerializable()
class PatientFilterRequst {
  String? patientName;
  String? visa;
  String? report;
  String? subjectsWithdrawal;
  String? refinementDate;
  DateTime? periodFrom;
  DateTime? periodTo;

  PatientFilterRequst({
     this.patientName,
     this.visa,
     this.report,
     this.subjectsWithdrawal,
     this.refinementDate,
    this.periodFrom,
    this.periodTo,
  });

  factory PatientFilterRequst.fromJson(Map<String,dynamic> json){
    return _$PatientFilterRequstFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$PatientFilterRequstToJson(this);
  }

  
}
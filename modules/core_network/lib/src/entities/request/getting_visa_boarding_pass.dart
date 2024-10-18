import 'package:json_annotation/json_annotation.dart';
part 'getting_visa_boarding_pass.g.dart';
@JsonSerializable()
class BoardingPass {
  DateTime? boardingPassForReturnFlight;

  BoardingPass({this.boardingPassForReturnFlight});

  factory BoardingPass.fromJson(Map<String,dynamic> json){
    return _$BoardingPassFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$BoardingPassToJson(this);
  }
}
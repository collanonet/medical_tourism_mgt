import 'package:json_annotation/json_annotation.dart';
part 'detail_hotel_search_request.g.dart';
@JsonSerializable()
class DetailHotelSearchRequest {
  String? name;
  String? type;
  String? usageRecord;
  String? area;
  String? supportedLanguage;

  DetailHotelSearchRequest({
     this.name,
     this.type,
     this.usageRecord,
     this.area,
     this.supportedLanguage,
  });

  factory DetailHotelSearchRequest.fromJson(Map<String,dynamic> json){
    return _$DetailHotelSearchRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailHotelSearchRequestToJson(this);
  }
  
}
// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'detail_hotel_search_request.g.dart';
@JsonSerializable()
class DetailHotelSearchRequest {
  String? accommodationName;
  String? accommodationType;
  String? usageRecord;
  String? area;
  String? supportedLanguage;
  bool? hotel;
  bool? apartmentHotel;
  String? usageHistory;
  bool? japanese;
  bool? chinese;
  bool? vietnamese;
  bool? english;
  bool? korean;
  bool? thai;

  DetailHotelSearchRequest({
     this.accommodationName,
     this.accommodationType,
     this.usageRecord,
     this.area,
     this.supportedLanguage,
     this.hotel,
     this.apartmentHotel,
     this.usageHistory,
     this.japanese,
     this.chinese,
     this.vietnamese,
     this.english,
     this.korean,
     this.thai
  });

  factory DetailHotelSearchRequest.fromJson(Map<String,dynamic> json){
    return _$DetailHotelSearchRequestFromJson(json);
  }

  Map<String,dynamic> toJson(){
    return _$DetailHotelSearchRequestToJson(this);
  }
  
}

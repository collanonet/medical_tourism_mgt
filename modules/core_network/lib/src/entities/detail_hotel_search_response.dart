import 'package:json_annotation/json_annotation.dart';
part 'detail_hotel_search_response.g.dart';

@JsonSerializable()
class DetailHotelSearchResponse {
  @JsonKey(name: '_id')
  final String? id;
  String? name;
  String? type;
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

  DetailHotelSearchResponse({
    required this.id,
    this.name,
    this.type,
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
    this.thai,
  });

  factory DetailHotelSearchResponse.fromJson(Map<String,dynamic> json){
    return _$DetailHotelSearchResponseFromJson(json);
  }
  Map<String,dynamic> toJson(){
    return _$DetailHotelSearchResponseToJson(this);
  }

  
}

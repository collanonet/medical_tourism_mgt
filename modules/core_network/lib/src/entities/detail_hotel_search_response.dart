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

  DetailHotelSearchResponse({
    required this.id,
     this.name,
     this.type,
     this.usageRecord,
     this.area,
     this.supportedLanguage,
  });

  
}
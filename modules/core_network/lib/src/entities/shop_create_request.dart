import 'package:json_annotation/json_annotation.dart';

part 'shop_create_request.g.dart';

@JsonSerializable()
class ShopCreateRequest {
  String name;
  String villageId;
  List<String> bankAccountNumbers;
  String profileImageUrl;
  String shopTypeId;
  String latitude;
  String longitude;
  String addressLine1;

  ShopCreateRequest({
    required this.name,
    required this.villageId,
    required this.bankAccountNumbers,
    required this.profileImageUrl,
    required this.shopTypeId,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
  });

  factory ShopCreateRequest.fromJson(Map<String, dynamic> json) {
    return _$ShopCreateRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShopCreateRequestToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'shop_update_request.g.dart';

@JsonSerializable()
class ShopUpdateRequest {
  String name;
  String villageId;
  String profileImageUrl;
  String shopTypeId;
  String latitude;
  String longitude;
  String addressLine1;
  String? timeOpen;
  String? timeClose;

  ShopUpdateRequest({
    required this.name,
    required this.villageId,
    required this.profileImageUrl,
    required this.shopTypeId,
    required this.latitude,
    required this.longitude,
    required this.addressLine1,
     this.timeOpen,
     this.timeClose,
  });

  factory ShopUpdateRequest.fromJson(Map<String, dynamic> json) {
    return _$ShopUpdateRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ShopUpdateRequestToJson(this);
}

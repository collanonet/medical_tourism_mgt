import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum MerchantType {
  @JsonValue('COOPORATE')
  cooporate,

  @JsonValue('RETAILER')
  retailer,
}
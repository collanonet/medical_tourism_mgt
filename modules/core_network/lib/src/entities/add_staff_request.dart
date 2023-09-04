import 'package:json_annotation/json_annotation.dart';

part 'add_staff_request.g.dart';

@JsonSerializable()
class AddStaffRequest {
  String userId;
  String shopId;
  String? counterId;

  AddStaffRequest({
    required this.userId,
    required this.shopId,
    this.counterId,
  });

  factory AddStaffRequest.fromJson(Map<String, dynamic> json) {
    return _$AddStaffRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddStaffRequestToJson(this);
}

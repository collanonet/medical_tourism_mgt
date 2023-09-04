import 'package:json_annotation/json_annotation.dart';

part 'qr_code.g.dart';

@JsonSerializable()
class QrCode {
  String qrCode;
  String accountNumber;

  QrCode({required this.qrCode, required this.accountNumber,});

  factory QrCode.fromJson(Map<String, dynamic> json) =>
      _$QrCodeFromJson(json);

  Map<String, dynamic> toJson() => _$QrCodeToJson(this);
}
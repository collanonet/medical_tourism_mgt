// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_boarding_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardingPass _$BoardingPassFromJson(Map<String, dynamic> json) => BoardingPass(
      boardingPassForReturnFlight: json['boardingPassForReturnFlight'] == null
          ? null
          : DateTime.parse(json['boardingPassForReturnFlight'] as String),
    );

Map<String, dynamic> _$BoardingPassToJson(BoardingPass instance) =>
    <String, dynamic>{
      'boardingPassForReturnFlight':
          instance.boardingPassForReturnFlight?.toIso8601String(),
    };

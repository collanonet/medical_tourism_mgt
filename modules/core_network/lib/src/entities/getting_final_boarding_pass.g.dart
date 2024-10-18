// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_final_boarding_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardingPass _$BoardingPassFromJson(Map<String, dynamic> json) => BoardingPass(
      id: json['_id'] as String,
      boardingPassForReturnFlight: json['boardingPassForReturnFlight'] == null
          ? null
          : DateTime.parse(json['boardingPassForReturnFlight'] as String),
    );

Map<String, dynamic> _$BoardingPassToJson(BoardingPass instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'boardingPassForReturnFlight':
          instance.boardingPassForReturnFlight?.toIso8601String(),
    };

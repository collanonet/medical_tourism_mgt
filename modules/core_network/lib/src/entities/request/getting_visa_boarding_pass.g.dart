// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getting_visa_boarding_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoardingPassRequest _$BoardingPassRequestFromJson(Map<String, dynamic> json) =>
    BoardingPassRequest(
      boardingPassForReturnFlight: json['boardingPassForReturnFlight'] == null
          ? null
          : DateTime.parse(json['boardingPassForReturnFlight'] as String),
      boardingPassForReturnFlightFileName:
          json['boardingPassForReturnFlightFileName'] as String?,
    );

Map<String, dynamic> _$BoardingPassRequestToJson(
        BoardingPassRequest instance) =>
    <String, dynamic>{
      'boardingPassForReturnFlight':
          instance.boardingPassForReturnFlight?.toIso8601String(),
      'boardingPassForReturnFlightFileName':
          instance.boardingPassForReturnFlightFileName,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) => Employee(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'fullName': instance.fullName,
    };

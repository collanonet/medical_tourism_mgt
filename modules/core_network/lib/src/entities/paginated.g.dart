// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Paginated<T> _$PaginatedFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Paginated<T>(
      items: (json['items'] as List<dynamic>?)?.map(fromJsonT).toList(),
      totalPages: (json['totalPages'] as num).toInt(),
      currentPage: json['currentPage'] as String,
    );

Map<String, dynamic> _$PaginatedToJson<T>(
  Paginated<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'items': instance.items.map(toJsonT).toList(),
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };

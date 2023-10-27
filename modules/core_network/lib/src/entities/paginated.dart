import 'package:json_annotation/json_annotation.dart';

part 'paginated.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Paginated<T> {
  Paginated({
    List<T>? items,
    required this.totalPages,
    required this.currentPage,
  }) : items = items ?? const [];

  List<T> items;
  int totalPages;
  int currentPage;

  factory Paginated.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return _$PaginatedFromJson(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Object? Function(T value) toJsonT,
  ) {
    return _$PaginatedToJson(this, toJsonT);
  }
}

import 'package:equatable/equatable.dart';

class StompTopic<T> with EquatableMixin {
  final String endPoint;
  final T? Function(dynamic json) fromJson;
  final dynamic Function(T instance) toJson;

  const StompTopic({
    required this.endPoint,
    required this.fromJson,
    required this.toJson,
  });

  @override
  List<Object> get props => [endPoint];

  @override
  String toString() => 'StompTopic { endPoint: $endPoint }';
}

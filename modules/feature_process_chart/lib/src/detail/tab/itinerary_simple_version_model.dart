import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ItinerarySimpleVersionModel {

  ValueNotifier<List<ExplanationVarious>> dataVarious = ValueNotifier([
    ExplanationVarious(various: 'PETCT'),
  ]);
}

class ExplanationVarious{
  String various;

  ExplanationVarious({required this.various});
}
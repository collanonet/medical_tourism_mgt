import 'package:core_network/entities.dart';
import 'package:core_utils/core_utils.dart';
import 'package:data_process_chart/data_process_chart.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class DetailProcessChartModel {
  DetailProcessChartModel({
    required this.processChartRepository,
  });

  final ProcessChartRepository processChartRepository;

  ValueNotifier<AsyncData<DetailItineraryResponse>> getProcessData =
      ValueNotifier(const AsyncData());

  void update(DetailItineraryResponse data) {
    getProcessData.value = AsyncData(data: data);
  }
}

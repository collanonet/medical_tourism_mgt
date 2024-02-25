import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_report/data_report.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReportModel with ChangeNotifier {
  ReportModel({
    required this.reportRepository,
  });

  final ReportRepository reportRepository;

  ValueNotifier<AsyncData<List<TypeResponse>>> dataType =
      ValueNotifier(const AsyncData<List<TypeResponse>>(data: []));

  Future<void> getReports() async {
    try {
      dataType.value = const AsyncData(loading: true);
      var result = await reportRepository.getTypes();
      dataType.value = AsyncData(data: result);
    } catch (e) {
      dataType.value = AsyncData(error: e);
    }
  }
}

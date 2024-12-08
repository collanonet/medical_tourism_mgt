// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/async.dart';
import 'package:data_report/data_report.dart';
import 'package:injectable/injectable.dart';

@injectable
class ReportModel with ChangeNotifier {
  ReportModel({
    required this.reportRepository,
  });

  final ReportRepository reportRepository;

}

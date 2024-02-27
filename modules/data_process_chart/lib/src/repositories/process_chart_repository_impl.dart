import 'dart:io';

import 'package:core_network/entities.dart';
import 'package:injectable/injectable.dart';

import '../providers/process_chart_local_provider.dart';
import '../providers/process_chart_remote_provider.dart';
import 'process_chart_repository.dart';

@Injectable(as: ProcessChartRepository)
class ProcessChartRepositoryIml extends ProcessChartRepository {
  ProcessChartRepositoryIml({
    required this.remote,
    required this.local,
  });

  final ProcessChartRemoteProvider remote;
  final ProcessChartLocalProvider local;

}

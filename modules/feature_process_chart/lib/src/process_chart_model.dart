import 'package:data_process_chart/data_process_chart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProcessChartModel{
  ProcessChartModel({required this.processChartRepository});
  final ProcessChartRepository processChartRepository;
}
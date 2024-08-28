// Package imports:
import 'package:logger/logger.dart';

class Filter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return true;
  }
}

final logger = Logger(
  filter: Filter(),
);

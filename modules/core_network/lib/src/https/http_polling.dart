import 'dart:async';

import 'package:core_utils/core_utils.dart';

class HttpPolling {
  HttpPolling({
    required this.periodic,
    required this.maxAttempts,
  });

  final Duration periodic;
  final double maxAttempts;

  Timer? _periodicTimer;
  Timer? _starterTimer;

  void start(
    void Function(HttpPolling polling) callback, {
    Duration? inDuration,
  }) {
    double attempts = 0;
    startPolling() {
      logger.d('[HTTP_POLLING]: Start');
      _periodicTimer = Timer.periodic(periodic, (timer) async {
        attempts++;
        logger.d('[HTTP_POLLING]: Attempt $attempts');
        callback(this);

        if (attempts >= maxAttempts) {
          timer.cancel();
          logger.d('[HTTP_POLLING]: Max attempts');
        }
      });
    }

    if (inDuration != null) {
      _starterTimer = Timer(inDuration, startPolling);
    } else {
      startPolling();
    }
  }

  void stop() {
    _periodicTimer?.cancel();
    _starterTimer?.cancel();
    logger.d('[HTTP_POLLING]: Stop');
  }
}

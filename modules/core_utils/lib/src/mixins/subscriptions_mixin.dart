import 'dart:async';

import 'package:flutter/widgets.dart';

import '../subscription_manager.dart';

mixin SubscriptionsMixin<T extends StatefulWidget> on State<T> {
  final subscriptions = SubscriptionManager();

  @override
  void dispose() {
    subscriptions.cancelAll();
    super.dispose();
  }

  void addSubscription(StreamSubscription subscription) {
    subscriptions.add(subscription);
  }
}

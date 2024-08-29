// Flutter imports:
import 'package:flutter/widgets.dart';

class NetworkImageConfigs {
  const NetworkImageConfigs({
    required this.baseUrl,
    required this.headers,
  });

  final Uri baseUrl;
  final Future<Map<String, String>> Function() headers;
}

class NetworkImageProvider extends InheritedWidget {
  const NetworkImageProvider({
    super.key,
    required this.configs,
    required super.child,
  });

  final NetworkImageConfigs configs;

  static NetworkImageConfigs? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NetworkImageProvider>()
        ?.configs;
  }

  static NetworkImageConfigs of(BuildContext context) {
    final NetworkImageConfigs? result = maybeOf(context);
    assert(result != null, 'No NetworkImageConfig in context');
    return result!;
  }

  @override
  bool updateShouldNotify(covariant NetworkImageProvider oldWidget) {
    return oldWidget.configs != configs;
  }
}

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:widgetbook/widgetbook.dart';

import '../theme.dart';
import './widgetbook.directories.g.dart';

void main() {
  runApp(const WidgetbookApp());
}

@widgetbook.App()
class WidgetbookApp extends StatelessWidget {
  const WidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      // Use the generated directories variable
      directories: directories,
      addons: [
        AlignmentAddon(
          initialAlignment: Alignment.center,
        ),
        DeviceFrameAddon(
          initialDevice: Devices.ios.iPhone13,
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPhone13ProMax,
            Devices.android.mediumPhone,
            Devices.android.bigPhone,
          ],
        ),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: AppThemeData.light().build(context),
            )
          ],
        ),
      ],
      appBuilder: (context, child) {
        return AppTheme(
          themeData: AppThemeData.light(),
          child: MaterialApp(
            home: Material(child: child),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

import '../../src/extensions/context_exts.dart';
import '../../src/widgets/app_body.dart';

@widgetbook.UseCase(name: 'No Background', type: AppBody)
Widget withNoBackgroundAppBody(BuildContext context) {
  return const AppBody(
    child: Center(
      child: Text('App Body'),
    ),
  );
}

@widgetbook.UseCase(name: 'Primary Background', type: AppBody)
Widget withPrimaryBackgroundAppBody(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: AppBody.curved(
      context,
      color: context.appTheme.appBodyTheme.primaryCurvedColor,
      child: const Center(
        child: Text('App Body'),
      ),
    ),
  );
}

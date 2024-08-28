// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'auto_translate_model.dart';
import 'auto_translate_screen.dart';

class AutoTranslatePage extends StatelessWidget {
  const AutoTranslatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<AutoTranslateModel>(),
      child: const AutoTranslateScreen(),
    );
  }
}

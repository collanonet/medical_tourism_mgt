import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'summary_list_model.dart';
import 'summary_list_screen.dart';

class SummaryListPage extends StatelessWidget {
  const SummaryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<SummaryListModel>(),
      child: const SummaryListScreen(),
    );
  }
}

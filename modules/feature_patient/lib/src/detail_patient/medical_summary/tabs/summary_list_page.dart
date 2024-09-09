// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'summary_list_model.dart';
import 'summary_list_screen.dart';

class SummaryListPage extends StatelessWidget {
  const SummaryListPage({super.key, this.patientId});
  final String? patientId;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<SummaryListModel>()..fetchSummaryList(patientId),
      child: const SummaryListScreen(),
    );
  }
}

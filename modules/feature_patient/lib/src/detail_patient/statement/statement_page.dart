import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'statement_model.dart';
import 'statement_screen.dart';

class StatementPage extends StatelessWidget {
  const StatementPage({
    super.key,
    required this.patient,
  });
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
      GetIt.I<StatementModel>()..initialData(patient),
      child: const StatementScreen(),
    );
  }
}

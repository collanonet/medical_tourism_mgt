import 'package:core_network/core_network.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'progress_list_model.dart';
import 'progress_list_screen.dart';

class ProgressListPage extends StatelessWidget {
  const ProgressListPage({
    super.key,
    this.patient,
  });
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.I<ProgressListModel>()..initialData(patient: patient ),
      child: const ProgressListScreen(),
    );
  }
}

import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'progress_list_model.dart';
import 'progress_list_table.dart';

class ProgressListScreen extends StatefulWidget {
  const ProgressListScreen({super.key});

  @override
  State<ProgressListScreen> createState() => _ProgressListScreenState();
}

class _ProgressListScreenState extends State<ProgressListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProgressListModel>(
      builder: (context, model, child) => const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 訪日治療の流れ
            ProgressListTable(title: '訪日治療の流れ'),
            // 訪日検診の流れ

            ProgressListTable(title: '訪日検診の流れ'),
          ],
        ),
      ),
    );
  }
}

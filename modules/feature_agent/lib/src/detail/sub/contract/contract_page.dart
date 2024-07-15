import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'contract_model.dart';
import 'contract_screen.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<ContractModel>()..fetchContrant(id: id),
      child: Builder(builder: (context) {
        return ValueListenableBuilder(
            valueListenable: context.read<ContractModel>().contrantData,
            builder: (context, value, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: ContractScreen(
                  id: id,
                ),
              );
            });
      }),
    );
  }
}

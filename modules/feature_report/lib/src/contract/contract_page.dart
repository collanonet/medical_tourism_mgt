// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'contract_form.dart';
import 'contract_model.dart';
import 'contract_screen.dart';

@RoutePage()
class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => contractForm()..markAllAsTouched(),
      builder: (context, formGroup, child) {
        return ChangeNotifierProvider(
          create: (context) => GetIt.I<ContractModel>()..contractFilter(),
          child: const LayoutView(
            selectedIndex: 9,
            page: ContractScreen(),
          ),
        );
      },
    );
  }
}

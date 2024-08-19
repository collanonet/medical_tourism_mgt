import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'contract_template_detail_form.dart';
import 'contract_template_detail_model.dart';
import 'contract_template_detail_screen.dart';

@RoutePage()
class ContractDetailPage extends StatelessWidget {
  const ContractDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormBuilder(
      form: () => contractTemplatebasicInformation()..markAllAsTouched(),
      builder: (context, formGroup, child) {
        return ReactiveFormConfig(
          validationMessages: const {},
          child: LayoutView(
            selectedIndex: 9,
            page: Provider(
              create: (context) => GetIt.I<ContractTemplateModel>(),
              child: const ContractDetailScreen(),
            ),
          ),
        );
      },
    );
  }
}

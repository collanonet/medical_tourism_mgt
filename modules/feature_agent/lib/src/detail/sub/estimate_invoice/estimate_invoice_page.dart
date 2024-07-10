import 'package:core_l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'estimate_invoice_form.dart';
import 'estimate_invoice_model.dart';
import 'estimate_invoice_screen.dart';

class EstimateInvoicePage extends StatelessWidget {
  const EstimateInvoicePage({super.key, this.id});
  final String? id;
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.required: (error) => context.l10n.mgsFieldRequired,
      },
      child: ReactiveFormBuilder(
          form: () => estimateInvoiceForm(),
          builder: (context, form, _) {
            return Provider(
              create: (context) => GetIt.I<EstimateInvoiceModel>(),
              child: Provider(
                create: (context) =>
                    GetIt.I<EstimateInvoiceModel>()..fetchEstimateInvoice(form),
                child: const EstimateInvoiceScreen(),
              ),
            );
          }),
    );
  }
}

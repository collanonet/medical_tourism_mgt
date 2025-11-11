// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'proposal_estimate_model.dart';

class ProposalEstimateScreenList extends StatelessWidget {
  const ProposalEstimateScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    final model = GetIt.I<ProposalEstimateModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('見積書一覧', style: context.textTheme.titleLarge),
        SizedBox(height: context.appTheme.spacing.marginMedium),
        ValueListenableBuilder(
          valueListenable: model.medicalQuotationData,
          builder: (context, value, _) {
            if (value.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            
            if (value.hasError) {
              return Text('エラーが発生しました: ${value.error}');
            }
            
            final quotations = value.data ?? [];

            if (quotations.isEmpty) {
              return const Text('見積書がありません');
            }

            final formGroup = ReactiveForm.of(context) as FormGroup?;

            return Column(
              children: [
                for (var i = 0; i < quotations.length; i++) ...[
                  Card(
                    child: ListTile(
                      title: Text(
                        quotations[i].invoiceNumber ?? '見積書 ${i + 1}',
                      ),
                      subtitle: Text(quotations[i].companyName ?? ''),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: formGroup == null
                                ? null
                                : () {
                                    model.editQuotation(
                                      invoice: quotations[i],
                                      formGroup: formGroup,
                                    );
                                  },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {
                              model.deleteInvoice([quotations[i].id]);
                            },
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (i != quotations.length - 1)
                    SizedBox(height: context.appTheme.spacing.marginSmall),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

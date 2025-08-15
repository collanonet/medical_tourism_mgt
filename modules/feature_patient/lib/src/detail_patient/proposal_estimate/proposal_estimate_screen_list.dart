// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'proposal_estimate_model.dart';

class ProposalEstimateScreenList extends StatelessWidget {
  const ProposalEstimateScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('見積書一覧', style: context.textTheme.titleLarge),
        SizedBox(height: context.appTheme.spacing.marginMedium),
        ValueListenableBuilder(
          valueListenable: context.watch<ProposalEstimateModel>().medicalQuotationData,
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
            
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: quotations.length,
              itemBuilder: (context, index) {
                final quotation = quotations[index];
                return Card(
                  child: ListTile(
                    title: Text(quotation.invoiceNumber ?? '見積書 ${index + 1}'),
                    subtitle: Text(quotation.companyName ?? ''),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            context
                                .read<ProposalEstimateModel>()
                                .editQuotation(
                                  invoice: quotation,
                                  formGroup: ReactiveForm.of(context) as FormGroup,
                                );
                          },
                          icon: const Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<ProposalEstimateModel>()
                                .deleteInvoice([quotation.id]);
                          },
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

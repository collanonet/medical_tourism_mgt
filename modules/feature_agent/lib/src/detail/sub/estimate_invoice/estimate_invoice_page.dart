
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'estimate_invoice_model.dart';
import 'estimate_invoice_screen.dart';

class EstimateInvoicePage extends StatelessWidget {
  const EstimateInvoicePage({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) =>
          GetIt.I<EstimateInvoiceModel>()..fetchEstimateInvoice(id: id),
      child: Builder(builder: (context) {
        return ValueListenableBuilder(
            valueListenable:
                context.read<EstimateInvoiceModel>().estimateInvoiceData,
            builder: (context, value, _) {
              return Skeletonizer(
                enabled: value.loading,
                child: EstimateInvoiceScreen(
                  id: id,
                ),
              );
            });
      }),
    );
  }
}

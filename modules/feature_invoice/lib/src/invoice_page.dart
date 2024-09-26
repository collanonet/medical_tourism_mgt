// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'invoice_model.dart';
import 'invoice_screen.dart';

@RoutePage(name: Routes.invoicesRoute)
class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => GetIt.I<InvoiceModel>()..fetchInvoices(),
      child: const LayoutView(
        selectedIndex: 7,
        page: InvoiceScreen(),
      ),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_invoice/src/invoice_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: InvoiceScreen(),
    );
  }
}

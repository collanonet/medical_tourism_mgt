import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:feature_quotation/src/quotation_screen.dart';
import 'package:flutter/material.dart';

@RoutePage()
class QuotationPage extends StatefulWidget {
  const QuotationPage({super.key});

  @override
  State<QuotationPage> createState() => _QuotationPageState();
}

class _QuotationPageState extends State<QuotationPage> {
  @override
  Widget build(BuildContext context) {
    return const SideBarMenu(
      page: QuotationScreen(),
    );
  }
}

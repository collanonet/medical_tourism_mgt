import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:core_utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'sale_form.dart';
import 'sale_model.dart';
import 'sale_screen.dart';

@RoutePage(name: Routes.salesRoute)
class SalePage extends StatefulWidget {
  const SalePage({super.key});

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> {
  @override
  Widget build(BuildContext context) {
    return LayoutView(
      selectedIndex: 8,
      page: ReactiveFormConfig(
        validationMessages: const {},
        child: ReactiveFormBuilder(
          form: () => saleManagementForm(),
          builder: (context, formGroup, child) {
            return Provider(
              create: (context) => GetIt.I<SaleModel>()..fetchData(formGroup),
              child: const SaleManagementScreen(),
            );
          },
        ),
      ),
    );
  }
}

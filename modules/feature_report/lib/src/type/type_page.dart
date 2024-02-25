import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'type_form.dart';
import 'type_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'type_screen.dart';

@RoutePage()
class ReportTypePage extends StatelessWidget {
  const ReportTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages(context),
      child: ReactiveFormBuilder(
          form: () => typeForm(),
          builder: (_, formGroup, child) {
            return LayoutView(
              selectedIndex: 10,
              page: Provider(
                  create: (context) =>
                      GetIt.I<TypeModel>()..getTypes(formGroup),
                  child: ReportTypeScreen()),
            );
          }),
    );
  }
}

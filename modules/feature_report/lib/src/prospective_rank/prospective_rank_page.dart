import 'package:auto_route/annotations.dart';
import 'package:base_view/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:core_utils/core_utils.dart';
import '../type/type_form.dart';
import '../type/type_model.dart';
import 'prospective_rank_form.dart';
import 'prospective_rank_screen.dart';

@RoutePage()
class ProspectivePankPage extends StatelessWidget {
  const ProspectivePankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
          form: () => prospectivePankForm(),
          builder: (_, formGroup, child) {
            return LayoutView(
              selectedIndex: 9,
              page: Provider(
                create: (context) => GetIt.I<TypeModel>()..getTypes(formGroup),
                child: const ProspectivePankScreen(),
              ),
            );
          }),
    );
  }
}
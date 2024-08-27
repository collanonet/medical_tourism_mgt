import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../filter_process_chart_form.dart';
import 'package:core_utils/core_utils.dart';
import 'related_parties_form.dart';
import 'related_parties_model.dart';
import 'related_parties_screen.dart';

class RelatedPartiesPage extends StatelessWidget {
  const RelatedPartiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: validationMessages,
      child: ReactiveFormBuilder(
        form: () => relatedPartiesForm(),
        builder: (context, formGroup, _) {
          return Provider(
            create: (context) =>
                GetIt.I<RelatedPartiesModel>()..fetchData(formGroup),
            child: const RelatedPartiesScreen(),
          );
        },
      ),
    );
  }
}

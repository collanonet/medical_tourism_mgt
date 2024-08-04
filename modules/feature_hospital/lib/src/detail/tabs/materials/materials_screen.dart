import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'material_model.dart';
import 'materials_form.dart';
import 'materials_section.dart';

class MaterialsScreen extends StatelessWidget {
  const MaterialsScreen({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => memoMaterialsMemoForm(hospitalRecordId: id),
          builder: (context, form, _) {
            return Provider(
                create: (context) => GetIt.I<MaterialsModel>()
                  ..fetchData(formGroup: form, hospitalId: id),
                child: Builder(builder: (context) {
                  return ValueListenableBuilder(
                      valueListenable:
                          context.read<MaterialsModel>().materialsData,
                      builder: (context, value, _) {
                        return Skeletonizer(
                          enabled: value.loading,
                          child: MaterialSection(
                            id: id,
                          ),
                        );
                      });
                }));
          }),
    );
  }
}

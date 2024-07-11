import 'package:feature_hospital/src/detail/tabs/materials/material_model.dart';
import 'package:feature_hospital/src/detail/tabs/materials/materials_section.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'materials_form.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key, required this.id});
  final String id;
  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormConfig(
      validationMessages: {
        ValidationMessage.required: (error) => 'This field is required',
      },
      child: ReactiveFormBuilder(
          form: () => materialsMemoForm(hospitalRecordId: widget.id),
          builder: (context, form, _) {
            return Provider(
                create: (context) =>
                    GetIt.I<MaterialsModel>()..fetchData(hospitalId: widget.id),
                child: MaterialSection(
                  id: widget.id,
                ));
          }),
    );
  }
}

import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../basic_info_model.dart';

class MedicalRecordTravelGroupSection extends StatelessWidget {
  const MedicalRecordTravelGroupSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('Travel_group') as FormArray;

    return Consumer<BasicInformationModel>(
      builder: (context, model, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReactiveFormArray(
              formArrayName: 'Travel_group',
              builder: (context, formArray, child) {
                final rows = formArray.controls
                    .map((control) => control as FormGroup)
                    .map(
                      (currentForm) => ReactiveForm(
                    formGroup: currentForm,
                    child: Row(
                      children: [
                
                        const Expanded(child: SizedBox())
                      ],
                    ),
                  ),
                );

                return ColumnSeparated(
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: context.appTheme.spacing.marginMedium,
                      ),
                  children: rows.toList(),
                );
              },
            ),
          ],
        );
      },
    );
  }
}

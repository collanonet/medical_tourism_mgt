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
                            Expanded(
                              child: ReactiveTextField(
                                formControlName: 'name',
                                decoration: InputDecoration(
                                  label: Text(
                                    '病院名', //   TODO: l10n 対応 (病院名) (hospitalName)
                                  ),
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: context.appTheme.spacing.marginMedium,
                            ),
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
            SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            InkWell(
              onTap: () => formArray.add(
                FormGroup({
                  'id': FormControl<String?>(),
                  'name': FormControl<String?>(),
                }),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle,
                    color: context.appTheme.primaryColor,
                  ),
                  SizedBox(
                    width: context.appTheme.spacing.marginSmall,
                  ),
                  Text(
                    '患者を追加',
                    style: TextStyle(color: context.appTheme.primaryColor),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

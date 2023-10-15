import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MedicalRecordNationalitySection extends StatelessWidget {
  const MedicalRecordNationalitySection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('PATIENT_NATIONALITIES') as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '国籍', // Todo:
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup,
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: context.appTheme.spacing.marginMedium,
            ),
            children: [
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: const [
                  Expanded(
                    child: ReactiveTextFormField(
                      formControlName: 'nationality',
                      decoration: InputDecoration(
                        label: Text(
                          '国籍', // Todo: l10n (国籍)
                        ),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReactiveTextFormField(
                      formControlName: 'nativeLanguage',
                      decoration: InputDecoration(
                        label: Text(
                          '母国語', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  const Expanded(
                    child: ReactiveTextFormField(
                      formControlName: 'residentialArea',
                      decoration: InputDecoration(
                        label: Text(
                          '居住地域', // Todo: l10n (国籍)
                        ),
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 2,
                    child: ReactiveTextFormField(
                      formControlName: 'currentAddress',
                      decoration: InputDecoration(
                        label: Text(
                          '現住所', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              RowSeparated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: context.appTheme.spacing.marginMedium,
                  );
                },
                children: [
                  const Expanded(
                    child: ReactiveTextFormField(
                      formControlName: 'mobileNumber',
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: '+',
                        label: Text(
                          '携帯番号',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

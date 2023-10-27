import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordHospitalSection extends StatelessWidget {
  const MedicalRecordHospitalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_HOSPITALS') as FormArray;

    return Consumer<BasicInformationModel>(
      builder: (context, model, child) => Skeletonizer(
        enabled: model.medicalRecordHospitals.loading,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(
                context.appTheme.spacing.borderRadiusMedium,
              ),
            ),
            color: const Color(0xffF8F8D9),
          ),
          padding: EdgeInsets.all(context.appTheme.spacing.marginMedium),
          child: ColumnSeparated(
            crossAxisAlignment: CrossAxisAlignment.start,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: context.appTheme.spacing.marginMedium,
              );
            },
            children: [
              const Text(
                '病院',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ), // TODO: l10n 対応 (病院) (hospital)

              ReactiveFormArray(
                formArrayName: 'MEDICAL_RECORD_HOSPITALS',
                builder: (context, formArray, child) {
                  final rows = formArray.controls
                      .map((control) => control as FormGroup)
                      .map(
                        (currentForm) => ReactiveForm(
                          formGroup: currentForm,
                          child: Row(
                            children: [
                              const Expanded(
                                child: ReactiveTextFormField(
                                  formControlName: 'hospitalName',
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
                              const Expanded(
                                child: ReactiveTextFormField(
                                  formControlName: 'medicalCardNumber',
                                  decoration: InputDecoration(
                                    label: Text(
                                      '診察券番号', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
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

              InkWell(
                onTap: () => formArray.add(
                  FormGroup({
                    'id': FormControl<String?>(),
                    'hospitalName': FormControl<String?>(),
                    'medicalCardNumber': FormControl<String?>(),
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
                      '病院を追加',
                      style: TextStyle(color: context.appTheme.primaryColor),
                    ) // TODO: l10n 対応 (病院を追加) (addHospital)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

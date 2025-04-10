// Flutter imports:
import 'package:core_network/core_network.dart';
import 'package:core_utils/core_utils.dart';
import 'package:feature_patient/src/detail_patient/basic_info/section/search/search_hospital.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

// Project imports:
import '../basic_info_model.dart';

class MedicalRecordHospitalSection extends StatelessWidget {
  const MedicalRecordHospitalSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formArray = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_HOSPITALS') as FormArray;

    final formGroup = (ReactiveForm.of(context) as FormGroup);
    return ValueListenableBuilder(
        valueListenable:
            context.watch<BasicInformationModel>().medicalRecordHospitals,
        builder: (context, value, _) {
          return Skeletonizer(
            enabled: value.loading,
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
                      fontFamily: 'NotoSansJP',
                      package: 'core_ui',
                      fontWeight: FontWeight.bold,
                    ),
                  ), // TODO: l10n 対応 (病院) (hospital)

                  ReactiveFormArray(
                    formArrayName: 'MEDICAL_RECORD_HOSPITALS',
                    builder: (context, formArray, child) {
                      final rows = formArray.controls
                          .map((control) => control as FormGroup)
                          .map(
                            (currentForm) => SearchHospital(
                              formArray: formArray,
                              currentForm: currentForm,
                              formGroup: formGroup,
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
                        '_id': FormControl<String>(),
                        'hospitalName': FormControl<String>(),
                        'hospitalData':
                            FormControl<BasicInformationHospitalResponse>(),
                        'hospitalId': FormControl<String>(),
                        'medicalCardNumber': FormControl<String>(),
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
                          style: TextStyle(
                              fontFamily: 'NotoSansJP',
                              package: 'core_ui',
                              color: context.appTheme.primaryColor),
                        ) // TODO: l10n 対応 (病院を追加) (addHospital)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}

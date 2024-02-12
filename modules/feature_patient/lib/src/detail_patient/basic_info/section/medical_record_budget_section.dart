import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../basic_info_model.dart';

class MedicalRecordBudgetSection extends StatelessWidget {
  const MedicalRecordBudgetSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_BUDGETS') as FormGroup;
    return ValueListenableBuilder(
        valueListenable: context.read<BasicInformationModel>().patientNames,
        builder: (context, value, _) => Skeletonizer(
          enabled: value.loading,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '予算',
                style: TextStyle(
              fontFamily: 'NotoSansJP',
              package: 'core_ui',
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: context.appTheme.spacing.marginMedium,
              ),
              ReactiveForm(
                formGroup: formGroup,
                child: RowSeparated(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: context.appTheme.spacing.marginMedium,
                    );
                  },
                  children: [
                     Expanded(
                      child: ReactiveTextField(
                        formControlName: 'budget',
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixText: '¥',
                          label: Text(
                            '予算', // Todo: l10n (国籍)
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                     Expanded(
                      flex: 2,
                      child: ReactiveTextField(
                        formControlName: 'remarks',
                        decoration: InputDecoration(
                          label: Text(
                            '備考', //   TODO: l10n 対応 (診察券番号) (medicalCardNumber)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
      )
    );
  }
}

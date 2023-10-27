import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class MedicalRecordInterpreterSection extends StatelessWidget {
  const MedicalRecordInterpreterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final formGroup = (ReactiveForm.of(context) as FormGroup)
        .control('MEDICAL_RECORD_Interpreter') as FormGroup;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '医療通訳',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: context.appTheme.spacing.marginMedium,
        ),
        ReactiveForm(
          formGroup: formGroup,
          child: RowSeparated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: context.appTheme.spacing.marginMedium,
              );
            },
            children: const [
              Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'requiredOrUnnnecessary',
                  decoration: InputDecoration(
                    label: Text(
                      '要・不要',
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: '要',
                      child: Text('要'),
                    ),
                    DropdownMenuItem(
                      value: '不要',
                      child: Text('不要'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ReactiveDropdownFormField(
                  formControlName: 'interpreter',
                  decoration: InputDecoration(
                    label: Text(
                      '医療通訳者',
                    ),
                  ),
                  items: [
                    DropdownMenuItem(
                      value: '赵雪',
                      child: Text('赵雪'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        )
      ],
    );
  }
}

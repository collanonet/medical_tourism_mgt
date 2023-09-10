import 'package:core_l10n/l10n.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../patient_model.dart';
import 'filter_patient_form.dart';

class PatientFilter extends StatelessWidget {
  const PatientFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PatientModel>(builder: (context, model, child) {
      return ReactiveFormConfig(
        validationMessages: validationMessagesLogin(context),
        child: ReactiveFormBuilder(
            form: () => formFilterPatient(),
            builder: (context, formGroup, child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(context.l10n.labelPatientSearch),
                    Row(
                      children: [
                        Expanded(
                          child: ReactiveTextFormField(
                            formControlName: 'patient_name',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextFormField(
                            formControlName: 'patient_name',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ReactiveTextFormField(
                            formControlName: 'patient_name',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }),
      );
    });
  }
}

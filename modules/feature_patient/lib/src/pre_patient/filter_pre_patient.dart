import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../patient/patient_model.dart';
import 'filter_pre_patient_form.dart';
import 'pre_patient_model.dart';

class PrePatientFilter extends StatelessWidget {
  const PrePatientFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrePatientModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPrePatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterPrePatient(),
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
                    Text(
                      context.l10n.labelWeChatPrePatientSearch,
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'agents',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelAgentName,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'patient',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Spacer(flex: 4)
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            model.prePatients(
                              agents: formGroup.control('agents').value,
                              patient: formGroup.control('patient').value,
                            );
                          },
                          child: Text(context.l10n.actionSearch),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

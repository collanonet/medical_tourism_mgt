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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n.labelWeChatPrePatientSearch,
                          style: context.textTheme.titleMedium,
                        ),
                        Text(
                          '事業再構築補助金',
                          style: context.textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelAgentName,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'agents',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelPatientName,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'patient',
                              ),
                            ],
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

import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'agent_model.dart';
import 'filter_agent_form.dart';

class AgentFilter extends StatelessWidget {
  const AgentFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AgentModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterPatient(),
            builder: (context, formGroup, child) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white),
                padding: const EdgeInsets.all(16),
                child: ColumnSeparated(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16);
                  },
                  children: [
                    Text(
                      'エージェント検索',
                      style: context.textTheme.titleMedium,
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 16);
                      },
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'エージェント担当者',
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'agentPerson',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'エージェント会社名',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'agentCompany',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '過去実績案件数',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'pastCasesNumber',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '件以上',
                            style: context.textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                    RowSeparated(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(width: 16);
                      },
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '国',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'country',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '地域',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'area',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '患者名',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'patientName',
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: RowSeparated(
                            mainAxisAlignment: MainAxisAlignment.end,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(width: 16);
                            },
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  formGroup.reset();
                                },
                                child: Text(
                                  context.l10n.actionClear,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(context.l10n.actionSearch),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

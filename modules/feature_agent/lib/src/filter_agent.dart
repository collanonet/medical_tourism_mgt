import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'agent_model.dart';
import 'filter_agent_form.dart';

class AgentFilter extends StatefulWidget {
  const AgentFilter({super.key});

  @override
  State<AgentFilter> createState() => _AgentFilterState();
}

class _AgentFilterState extends State<AgentFilter> {
  final formatter = InputFormatter();
  bool _check = false;
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'エージェント検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelPatientName,
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
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '査証',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'agent_company_name',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '報告書',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'hospitalName',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        // 1 checkbok and text widget
                        Checkbox(
                            activeColor: Theme.of(context).primaryColor,
                            checkColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                              side: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            value: _check,
                            onChanged: (value) {
                              setState(() {
                                _check = value!;
                              });
                            }),
                        Text('取下対象者')
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelClassification,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'classification',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelSalesRepresentative,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'sales_representative',
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
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelEntryDateFrom,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                formControlName: 'entry_date_from',
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context,
                                    ReactiveDatePickerDelegate<dynamic> picker,
                                    Widget? child) {
                                  return ReactiveTextField<DateTime>(
                                    formControlName: 'entry_date_from',
                                    valueAccessor: DateTimeValueAccessor(
                                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                    ),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.grey,
                                        ),
                                        onPressed: picker.showPicker,
                                      ),
                                    ),
                                    inputFormatters: [
                                      formatter.dateFormatter,
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.labelEntryDateTo,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                formControlName: 'entry_date_to',
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context,
                                    ReactiveDatePickerDelegate<dynamic> picker,
                                    Widget? child) {
                                  return ReactiveTextField<DateTime>(
                                    formControlName: 'entry_date_to',
                                    valueAccessor: DateTimeValueAccessor(
                                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                    ),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.grey,
                                        ),
                                        onPressed: picker.showPicker,
                                      ),
                                    ),
                                    inputFormatters: [
                                      formatter.dateFormatter,
                                    ],
                                  );
                                },
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
                                context.l10n.labelExaminationDateFrom,
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                formControlName: 'examination_date_from',
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context,
                                    ReactiveDatePickerDelegate<dynamic> picker,
                                    Widget? child) {
                                  return ReactiveTextField<DateTime>(
                                    formControlName: 'examination_date_from',
                                    valueAccessor: DateTimeValueAccessor(
                                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                    ),
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.grey,
                                        ),
                                        onPressed: picker.showPicker,
                                      ),
                                    ),
                                    inputFormatters: [
                                      formatter.dateFormatter,
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '予算',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveDatePicker<DateTime>(
                                formControlName: 'examination_date_to',
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2100),
                                builder: (BuildContext context,
                                    ReactiveDatePickerDelegate<dynamic> picker,
                                    Widget? child) {
                                  return ReactiveTextField<DateTime>(
                                    formControlName: 'examination_date_to',
                                    valueAccessor: DateTimeValueAccessor(
                                      dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                    ),
                                    decoration: InputDecoration(
                                      label: Text(
                                        context.l10n.labelExaminationDateTo,
                                      ),
                                      suffixIcon: IconButton(
                                        icon: const Icon(
                                          CupertinoIcons.calendar,
                                          color: Colors.grey,
                                        ),
                                        onPressed: picker.showPicker,
                                      ),
                                    ),
                                    inputFormatters: [
                                      formatter.dateFormatter,
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'return_date_from',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'return_date_from',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    context.l10n.labelReturnDateFrom,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      CupertinoIcons.calendar,
                                      color: Colors.grey,
                                    ),
                                    onPressed: picker.showPicker,
                                  ),
                                ),
                                inputFormatters: [
                                  formatter.dateFormatter,
                                ],
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: Text('〜'),
                        ),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'return_date_to',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'return_date_to',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    context.l10n.labelReturnDateTo,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      CupertinoIcons.calendar,
                                      color: Colors.grey,
                                    ),
                                    onPressed: picker.showPicker,
                                  ),
                                ),
                                inputFormatters: [
                                  formatter.dateFormatter,
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            formGroup.reset();
                          },
                          child: Text(
                            context.l10n.actionClear,
                          ),
                        ),
                        const SizedBox(width: 16),
                        ElevatedButton(
                          onPressed: () {},
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

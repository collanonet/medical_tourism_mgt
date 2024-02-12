import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_process_chart_form.dart';
import 'process_chart_model.dart';

class ProcessChartFilter extends StatefulWidget {
  const ProcessChartFilter({super.key});

  @override
  State<ProcessChartFilter> createState() => _ProcessChartFilterState();
}

class _ProcessChartFilterState extends State<ProcessChartFilter> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProcessChartModel>(
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
                      '行程表検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'patientName',
                            decoration: InputDecoration(
                              label: Text(
                                'ツアー名',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: ReactiveTextField(
                            formControlName: 'visa',
                            decoration: InputDecoration(
                              label: Text(
                                '種別',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  context.appTheme.spacing.borderRadiusMedium),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: context.appTheme.primaryColor,
                              ),
                              Text(
                                '次月',
                                style: context.textTheme.titleMedium?.copyWith(
                                    color: context.appTheme.primaryColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        Expanded(
                          flex: 4,
                          child: ReactiveDatePicker<DateTime>(
                            formControlName: 'period_from',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'period_from',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    '期間（自）',
                                  ),
                                  suffixIcon: const Icon(
                                    CupertinoIcons.calendar,
                                    color: Colors.grey,
                                  ),
                                ),
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
                            formControlName: 'period_to',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'period_to',
                                readOnly: true,
                                onTap: (value) => picker.showPicker(),
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    '期間（至）',
                                  ),
                                  suffixIcon: const Icon(
                                    CupertinoIcons.calendar,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        Container(
                          padding: EdgeInsets.all(
                              context.appTheme.spacing.marginSmall),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  context.appTheme.spacing.borderRadiusMedium),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            children: [
                              Text(
                                '次月',
                                style: context.textTheme.titleMedium?.copyWith(
                                    color: context.appTheme.primaryColor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: context.appTheme.primaryColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginMedium),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('検索'),
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

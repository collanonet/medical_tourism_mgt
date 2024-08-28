// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:core_ui/core_ui.dart';
import 'package:core_utils/core_utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

// Project imports:
import 'filter_process_chart_form.dart';
import 'process_chart_model.dart';

class ProcessChartFilter extends StatefulWidget {
  const ProcessChartFilter({super.key});

  @override
  State<ProcessChartFilter> createState() => _ProcessChartFilterState();
}

class _ProcessChartFilterState extends State<ProcessChartFilter> {
  final formatter = InputFormatter();
  @override
  Widget build(BuildContext context) {
    return Consumer<ProcessChartModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessages,
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'ツアー名',
                                style: context.textTheme.bodySmall,
                              ),
                              SizedBox(
                                height:
                                    context.appTheme.spacing.marginExtraSmall,
                              ),
                              ReactiveTextField(
                                formControlName: 'tourName',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '種別',
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
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            final periodFrom = formGroup.control('dateFrom');
                            final periodTo = formGroup.control('dateTo');
                            final valueDate = periodTo.value ?? DateTime.now();
                            periodFrom.value = DateTime(
                                valueDate.year, valueDate.month + 1, 1);
                            periodTo.value = DateTime(
                                valueDate.year, valueDate.month + 2, 0);
                          },
                          child: Container(
                            padding: EdgeInsets.all(
                                context.appTheme.spacing.marginSmall),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(context
                                    .appTheme.spacing.borderRadiusMedium),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: context.appTheme.primaryColor,
                                ),
                                Text(
                                  '次月',
                                  style: context.textTheme.titleMedium
                                      ?.copyWith(
                                          color: context.appTheme.primaryColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: context.appTheme.spacing.marginSmall),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '期間（自）',
                                    style: context.textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                                  ReactiveDatePicker<DateTime>(
                                    formControlName: 'dateFrom',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'dateFrom',
                                        valueAccessor: DateTimeValueAccessor(
                                          dateTimeFormat:
                                              DateFormat('yyyy/MM/dd'),
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
                                    '期間（至）',
                                    style: context.textTheme.bodySmall,
                                  ),
                                  SizedBox(
                                    height: context
                                        .appTheme.spacing.marginExtraSmall,
                                  ),
                                  ReactiveDatePicker<DateTime>(
                                    formControlName: 'dateTo',
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime(2100),
                                    builder: (BuildContext context,
                                        ReactiveDatePickerDelegate<dynamic>
                                            picker,
                                        Widget? child) {
                                      return ReactiveTextField<DateTime>(
                                        formControlName: 'dateTo',
                                        valueAccessor: DateTimeValueAccessor(
                                          dateTimeFormat:
                                              DateFormat('yyyy/MM/dd'),
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
                          ],
                        )),
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
                        ReactiveFormConsumer(
                          builder: (context, form, _) {
                            return ElevatedButton(
                              onPressed: () {
                                context
                                    .read<ProcessChartModel>()
                                    .fetchItinerary(
                                      id: formGroup.control('_id').value,
                                      tourName:
                                          formGroup.control('tourName').value,
                                      classification: formGroup
                                          .control('classification')
                                          .value,
                                      dateFrom:
                                          formGroup.control('dateFrom').value,
                                      dateTo: formGroup.control('dateTo').value,
                                    );
                              },
                              child: const Text('検索'),
                            );
                          },
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

import 'package:core_l10n/l10n.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/widgets.dart';
import 'package:core_utils/core_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'filter_medical_visa_form.dart';
import 'medical_visa_model.dart';

class MedicalVisaFilter extends StatefulWidget {
  const MedicalVisaFilter({super.key});

  @override
  State<MedicalVisaFilter> createState() => _MedicalVisaFilterState();
}

class _MedicalVisaFilterState extends State<MedicalVisaFilter> {
  bool _check = false;
  final formatter = InputFormatter();
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalVisaModel>(
      builder: (context, model, child) {
        return ReactiveFormConfig(
          validationMessages: validationMessagesFilterPatient(context),
          child: ReactiveFormBuilder(
            form: () => formFilterMedicalVisa(),
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
                      '医療ビザ管理検索',
                      style: context.textTheme.titleMedium,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'patientName',
                            decoration: InputDecoration(
                              label: Text(
                                context.l10n.labelPatientName,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'visa',
                            decoration: InputDecoration(
                              label: Text(
                                '査証',
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 4,
                          child: ReactiveTextField(
                            formControlName: 'report',
                            decoration: InputDecoration(
                              label: Text(
                                '報告書',
                              ),
                            ),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '日付絞込み',
                            ),
                            Row(
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: 1,
                                  onChanged: (value) {},
                                ),
                                Text('来日日'),
                                Radio(
                                  value: 0,
                                  groupValue: 1,
                                  onChanged: (value) {},
                                ),
                                Text('帰国日'),
                                Radio(
                                  value: 0,
                                  groupValue: 1,
                                  onChanged: (value) {},
                                ),
                                Text('身元保証書発行日'),
                              ],
                            )
                          ],
                        ),
                        SizedBox(width: context.appTheme.spacing.marginMedium),
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
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    '期間（自）',
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
                            formControlName: 'period_to',
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100),
                            builder: (BuildContext context,
                                ReactiveDatePickerDelegate<dynamic> picker,
                                Widget? child) {
                              return ReactiveTextField<DateTime>(
                                formControlName: 'period_to',
                                valueAccessor: DateTimeValueAccessor(
                                  dateTimeFormat: DateFormat('yyyy/MM/dd'),
                                ),
                                decoration: InputDecoration(
                                  label: Text(
                                    '期間（至）',
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
